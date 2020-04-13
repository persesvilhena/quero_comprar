<?php

class Painel_model extends CI_Model {

    function __construct() {
        // Call the Model constructor
        parent::__construct();
    }




    function retorna_dados_usuario($id = null){
        return $this->perfil_model->retorna_dados_usuario($id);
    }


    function retorna_todos_usuarios(){
        $this->db->select('*');
        $this->db->from('usuario');
        return $this->db->get()->result();
    }
    




    function foto($foto, $caminho){
        if (!empty($foto["name"])) {
            $largura = 5000;
            $larguramin = 1;
            $altura = 2500;
            $tamanho = 5000000;
            preg_match("/\.(gif|bmp|png|jpg|jpeg){1}$/i", $foto["name"], $ext);
            if($ext[1] != "gif" && $ext[1] != "bmp" && $ext[1] != "png" && $ext[1] != "jpg" && $ext[1] != "jpeg"){
                $avisos[0]['message'] = "Formato incompativel!";
                $avisos[0]['type'] = "danger";
            } else {
                $dimensoes = getimagesize($foto["tmp_name"]);
                if($dimensoes[0] > $largura) {
                    $avisos[1]['message'] = "A largura da imagem não deve ultrapassar ".$largura." pixels!";
                    $avisos[1]['type'] = "danger";
                }
                if($dimensoes[0] < $larguramin) {
                    $avisos[2]['message'] = "A largura da imagem não deve ser menor de ".$larguramin." pixels!";
                    $avisos[2]['type'] = "danger";
                }
                if($dimensoes[1] > $altura) {
                    $avisos[3]['message'] = "A altura da imagem não deve ultrapassar ".$altura." pixels!";
                    $avisos[3]['type'] = "danger";
                }
                if($foto["size"] > $tamanho) {
                    $avisos[4]['message'] = "A imagem deve ter no máximo ".$tamanho." bytes";
                    $avisos[4]['type'] = "danger";
                }
            }
            if (!isset($avisos)){
                $nome_imagem = md5(uniqid(time())) . "." . $ext[1];
                $caminho_imagem = $caminho . $nome_imagem;
                move_uploaded_file($foto["tmp_name"], $caminho_imagem);
            }
            if(!isset($avisos)){
                return $nome_imagem;
            }else{
                $this->session->set_userdata('avisos', $avisos);
                return null;
            }
        }else{
            $this->session->set_userdata('avisos', $avisos);
            return null;
        }
    }

    function apagar_usuario($id){

        $this->db->where('usu_id', $id);
        $this->db->delete('usuario');
        return $this->db->affected_rows();
    }


    function avisos(){
        if(isset($this->session->userdata['avisos'])){
            $avisos = $this->session->userdata['avisos'];
            $this->session->set_userdata('avisos', null);
            foreach ($avisos as $a) {
                return "<div class=\"alert alert-". $a['type'] ." alert-dismissible\" role=\"alert\" style=\"margin-top: 15px;\">
                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>
                    <strong>Aviso!</strong> ". $a['message'] ."
                </div>";
            }
        }
    }

    function avisos2(){
        if(isset($this->session->userdata['avisos'])){
            $aviso = $this->session->userdata['avisos'];
            $this->session->set_userdata('avisos', null);
            $avisos = explode("|", $aviso);

                return "<div class=\"alert alert-". $avisos[0] ." alert-dismissible\" role=\"alert\" style=\"margin-top: 15px;\">
                    <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>
                    <strong>Aviso!</strong> ". $avisos[1] ."
                </div>";
        }
    }


    


}
