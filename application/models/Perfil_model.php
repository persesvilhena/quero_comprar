<?php

class Perfil_model extends CI_Model {

    function __construct() {
        // Call the Model constructor
        parent::__construct();
    }




    function retorna_dados_usuario($id = null){
        if($id == null){
            $id = $this->session->userdata['usu_id'];
        }
        $this->db->select('*');
        $this->db->from('usuario');
        $this->db->where('usuario.usu_id', $id);
        $result = $this->db->get()->result()[0];
        $result->qtde_anuncios_aguardando = $this->anuncios_model->qtde_anuncios_aguardando()->qtde;
        $result->qtde_anuncios_ativos = $this->anuncios_model->qtde_anuncios_ativos()->qtde;
        $result->qtde_anuncios_concluidos = $this->anuncios_model->qtde_anuncios_concluidos()->qtde;
        $result->qtde_anuncios_nao_concluidos = $this->anuncios_model->qtde_anuncios_nao_concluidos()->qtde;
        return $result;
    }

   /* function qtde_anuncios_aguardando(){
        $this->db->select('*');
        $this->db->from('compra_ativo');
        $this->db->where('usuario.usu_id', $id);
    }*/



    function apaga_foto_perfil($id){
        $this->db->select('*');
        $this->db->from('usuario');
        $this->db->where('usuario.usu_id', $id);
        $foto = $this->db->get()->result()[0]->usu_foto;
        if(unlink($this->conf->caminho_upload_perfil_relativo() . $foto ."")){
            return true;
        }else{
            return false;
        }
    }

    function alterar($usu_id, $usu_nome, $usu_cel, $usu_tel, $usu_sobre, $usu_foto){
        $data = array(
        'usu_nome' => $usu_nome,
        'usu_cel' => $usu_cel,
        'usu_tel' => $usu_tel,
        'usu_sobre' => $usu_sobre,
        'usu_foto' => $usu_foto
        );
        $this->db->where('usu_id', $usu_id);
        $this->db->update('usuario', $data);
        return $this->db->affected_rows();
    }

    function alterar_senha($id, $senha_atual, $senha1, $senha2){
        $this->db->select('*');
        $this->db->from('usuario');
        $this->db->where('usuario.usu_id', $id);
        $this->db->where('usuario.usu_senha', $senha_atual);
        $result = $this->db->get()->result();
        if($result){
            if($senha1 == $senha2){
                $data = array(
                'usu_senha' => $senha1
                );

                $this->db->where('usu_id', $id);
                $this->db->update('usuario', $data);
                return $this->db->affected_rows();
            }else{
                return 3;
            }
        }else{
            return 2;
        }
    }


    function alterar_email($id, $senha, $email){
        $this->db->select('*');
        $this->db->from('usuario');
        $this->db->where('usuario.usu_id', $id);
        $this->db->where('usuario.usu_senha', $senha);
        $result = $this->db->get()->result();
        if($result){
            $data = array(
            'usu_email' => $email
            );

            $this->db->where('usu_id', $id);
            $this->db->update('usuario', $data);
            return $this->db->affected_rows();
        }else{
            return 2;
        }
    }


    function excluir_conta($id, $senha){
        $this->db->select('*');
        $this->db->from('usuario');
        $this->db->where('usuario.usu_id', $id);
        $this->db->where('usuario.usu_senha', $senha);
        $result = $this->db->get()->result();
        if($result){
            $data = array(
            'usu_aprovacao' => 2
            );

            $this->db->where('usu_id', $id);
            $this->db->update('usuario', $data);
            return $this->db->affected_rows();
        }else{
            return 2;
        }
    }








    


}
