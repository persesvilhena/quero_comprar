<?php

class Logar_model extends CI_Model {

    function __construct() {
        // Call the Model constructor
        parent::__construct();
    }


    ////////////////////////////////////////////////////
    ////////////////// SISTEMA LOGIN ///////////////////
    ////////////////////////////////////////////////////
    function ver_user_login($usu_login){
        $this->db->select('*');
        $this->db->from('usuario');
        $this->db->where('usuario.usu_login', $usu_login);
        return $this->db->get()->result()[0];
    }

    function logar($usuario, $senha){
        $this->db->select('*');
        $this->db->from('usuario');
        $this->db->where('usuario.usu_login', $usuario);
        $this->db->where('usuario.usu_senha', $senha);
        $resultado = $this->db->get()->result();
        if($resultado){
            if($resultado[0]->usu_hash == null){
                if($resultado[0]->usu_aprovacao == 1){
                    $this->session->set_userdata('usu_id', $resultado[0]->usu_id);
                    $this->session->set_userdata('usu_nome', $resultado[0]->usu_nome);
                    $this->session->set_userdata('usu_login', $resultado[0]->usu_login);
                    $this->session->set_userdata('usu_email', $resultado[0]->usu_email);
                    $this->session->set_userdata('logado', '1');
                    redirect("painel");
                }else{
                    $this->session->set_userdata('logado', '0');
                    redirect("home/logar/aguardando");
                }
            }else{
                $this->session->set_userdata('logado', '0');
                redirect("home/logar/confirme");
            }
        }else{
            $this->session->set_userdata('logado', '0');
            redirect("home/logar/incorreto");
        }
    }

    function protege(){
        if(isset($this->session->userdata['logado'])){
            if($this->session->userdata['logado'] == 1){
                //echo "ta";
            }else{
                redirect("home/logar/");
            }
        }else{
            redirect("home/logar/");
        }
    }

    function verifica_logado(){
        if(isset($this->session->userdata['logado'])){
            if($this->session->userdata['logado'] == 1){
                redirect("painel/");
            }
        }
    }






    ////////////////////////////////////////////////////////
    ////////////////// SISTEMA DE CADASTRO /////////////////
    ////////////////////////////////////////////////////////
    function cadastrar($usu_login, $usu_senha, $usu_nome, $usu_email, $usu_hash){
        if(($usu_login != null) && ($usu_senha != null) && ($usu_nome != null) && ($usu_email != null)){
            $this->db->select('*');
            $this->db->from('usuario');
            $this->db->where('usuario.usu_login', $usu_login);
            $resultado = (bool)($this->db->get()->result());
            if(!$resultado){
                $data = array(
                'usu_login' => $usu_login,
                'usu_senha' => $usu_senha,
                'usu_nome' => $usu_nome,
                'usu_email' => $usu_email,
                'usu_adm' => 0,
                'usu_aprovacao' => 1
                //'usu_hash' => $usu_hash
                );
                $this->db->insert('usuario', $data);
                return $this->db->affected_rows();
            }else{
                return 2;
            }
        }else{
            return 3;
        }
    }

    function confirma_cadastro($usu_login, $usu_hash){
        if(($usu_login != null) && ($usu_hash != null)){
            $data = array(
            'usu_hash' => null
            );

            $this->db->where('usu_login', $usu_login);
            $this->db->where('usu_hash', $usu_hash);
            $this->db->update('usuario', $data);
            return $this->db->affected_rows();
        }else{
            return 0;
        }
    }






    ////////////////////////////////////////////////////////
    //////////////// SISTEMA DE RECUPERAÇAO ////////////////
    ////////////////////////////////////////////////////////
    function recuperar($usu_login, $usu_rechash){
        if(($usu_login != null) && ($usu_rechash != null)){
            $data = array(
            'usu_rechash' => $usu_rechash
            );

            $this->db->where('usu_login', $usu_login);
            $this->db->update('usuario', $data);
            return $this->db->affected_rows();
        }else{
            return 0;
        }
    }

    function verifica_recuperacao($usu_login, $usu_rechash){
        $this->db->select('*');
        $this->db->from('usuario');
        $this->db->where('usuario.usu_login', $usu_login);
        $this->db->where('usuario.usu_rechash', $usu_rechash);
        $resultado = $this->db->get()->result();
        if($resultado){
            if($resultado[0]->usu_hash == null){
                
            }else{
                $this->session->set_userdata('logado', '0');
                redirect("home/logar/confirme");
            }
        }else{
            $this->session->set_userdata('logado', '0');
            redirect("home/logar/");
        }
    }
    function recupera_senha($usu_login, $senha1){
        $data = array(
        'usu_senha' => $senha1,
        'usu_rechash' => null
        );

        $this->db->where('usu_login', $usu_login);
        $this->db->update('usuario', $data);
        return $this->db->affected_rows();
    }


}
