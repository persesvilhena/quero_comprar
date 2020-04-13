<?php

class Permissao_model extends CI_Model {

    function __construct() {
        // Call the Model constructor
        parent::__construct();
    }


    function verifica_permissao_nucleo($nucleo, $sistema){
        $id = $this->session->userdata['usu_id'];
        $this->db->select('*');
        $this->db->from('cc_nucleo_usuario_permissao');
        $this->db->where('cc_nucleo_usuario_permissao.nua_sistema', $sistema);
        $this->db->where('cc_nucleo_usuario_permissao.nua_nucleo', $nucleo);
        $this->db->where('cc_nucleo_usuario_permissao.nua_usuario', $id);
        return (bool)($this->db->get()->result());
    }

    function verifica_permissao($permissao, $nucleo, $sistema){
        $id = $this->session->userdata['usu_id'];
        $sql = "
        SELECT * FROM `cc_nucleo_usuario_permissao` 
        INNER JOIN `cc_permissao` 
            ON `nua_permissao` = `per_id` 
        WHERE `nua_usuario` = '$id' 
            AND `nua_nucleo` = '$nucleo' 
            AND `per_nome` = '$permissao' 
            AND `nua_sistema` = '$sistema'
        ";
        return (bool)($this->db->query($sql)->result());
    }

    /*function verifica_permissao($permissao, $nucleo, $sistema){
        $id = $this->session->userdata['usu_id'];
        $sql = "
        SELECT * FROM `cc_nucleo_usuario` 
        INNER JOIN `cc_nucleo_usuario_permissao` 
            ON `cc_nucleo_usuario_permissao`.`nua_nucleo` = `cc_nucleo_usuario`.`nuo_nucleo_id` 
            AND `cc_nucleo_usuario_permissao`.`nua_usuario` = `cc_nucleo_usuario`.`nuo_usuario_id` 
        INNER JOIN `cc_permissao` 
            ON `cc_nucleo_usuario_permissao`.`nua_permissao` = `cc_permissao`.`per_id` 
        INNER JOIN `cc_sistema` 
            ON `cc_nucleo_usuario_permissao`.`nua_sistema` = `cc_sistema`.`sis_id` 
        WHERE `cc_nucleo_usuario`.`nuo_usuario_id` = '$id' 
            AND `cc_nucleo_usuario`.`nuo_nucleo_id` = '$nucleo' 
            AND `cc_permissao`.`per_nome` = '$permissao' 
            AND `cc_nucleo_usuario_permissao`.`nua_sistema` = '$sistema'
        ";
        return (bool)($this->db->query($sql)->result());
    }*/


    function permissao_autoral_noticia($permissao, $nucleo, $sistema, $noticia){
        $id = $this->session->userdata['usu_id'];
        $sql = "
        SELECT * FROM `cc_nucleo_usuario_permissao` 
        INNER JOIN `cc_permissao` 
            ON `nua_permissao` = `per_id`
        INNER JOIN `cc_autor_noticia` 

        WHERE `nua_usuario` = '$id' 
            AND `nua_nucleo` = '$nucleo' 
            AND `per_nome` = '$permissao' 
            AND `nua_sistema` = '$sistema'
            AND `aut_noticia_id` = '$noticia'
            AND `aut_usuario_id` = '$id'
        ";
        return (bool)($this->db->query($sql)->result());
    }


    /*function verifica_permissao_autoral_noticia($permissao, $nucleo, $sistema, $noticia){
        $id = $this->session->userdata['usu_id'];
        $sql = "
        SELECT * FROM `cc_nucleo_usuario` 
        INNER JOIN `cc_nucleo_usuario_permissao` 
            ON `cc_nucleo_usuario_permissao`.`nua_nucleo` = `cc_nucleo_usuario`.`nuo_nucleo_id` 
            AND `cc_nucleo_usuario_permissao`.`nua_usuario` = `cc_nucleo_usuario`.`nuo_usuario_id` 
        INNER JOIN `cc_permissao` 
            ON `cc_nucleo_usuario_permissao`.`nua_permissao` = `cc_permissao`.`per_id` 
        INNER JOIN `cc_sistema` 
            ON `cc_nucleo_usuario_permissao`.`nua_sistema` = `cc_sistema`.`sis_id`
        INNER JOIN `cc_autor_noticia` 

        WHERE `cc_nucleo_usuario`.`nuo_usuario_id` = '$id' 
            AND `cc_nucleo_usuario`.`nuo_nucleo_id` = '$nucleo' 
            AND `cc_permissao`.`per_nome` = '$permissao' 
            AND `cc_nucleo_usuario_permissao`.`nua_sistema` = '$sistema'
            AND `cc_autor_noticia`.`aut_noticia_id` = '$noticia'
            AND `cc_autor_noticia`.`aut_usuario_id` = '$id'
        ";
        return (bool)($this->db->query($sql)->result());
    }*/


    function permissao_original_noticia($permissao, $nucleo, $sistema, $noticia){
        $id = $this->session->userdata['usu_id'];
        $sql = "
        SELECT * FROM `cc_nucleo_usuario_permissao` 
        INNER JOIN `cc_permissao` 
            ON `nua_permissao` = `per_id` 
        INNER JOIN `cc_noticia_nucleo`
            ON `nua_nucleo` = `noo_nucleo_id`
        WHERE `nua_usuario` = '$id' 
            AND `nua_nucleo` = '$nucleo' 
            AND `per_nome` = '$permissao' 
            AND `nua_sistema` = '$sistema'
            AND `noo_noticia_id` = '$noticia'
            AND `noo_original` = '1'
        ";
        return (bool)($this->db->query($sql)->result());
    }


    /*function verifica_permissao2($permissao, $nucleo, $sistema, $noticia){
        $id = $this->session->userdata['usu_id'];
        $sql = "
        SELECT * FROM `cc_nucleo_usuario` 
        INNER JOIN `cc_nucleo_usuario_permissao` 
            ON `cc_nucleo_usuario_permissao`.`nua_nucleo` = `cc_nucleo_usuario`.`nuo_nucleo_id` 
            AND `cc_nucleo_usuario_permissao`.`nua_usuario` = `cc_nucleo_usuario`.`nuo_usuario_id` 
        INNER JOIN `cc_permissao` 
            ON `cc_nucleo_usuario_permissao`.`nua_permissao` = `cc_permissao`.`per_id` 
        INNER JOIN `cc_sistema` 
            ON `cc_nucleo_usuario_permissao`.`nua_sistema` = `cc_sistema`.`sis_id` 
        INNER JOIN `cc_noticia_nucleo`
            ON `cc_nucleo_usuario`.`nuo_nucleo_id` = `cc_noticia_nucleo`.`noo_nucleo_id`
        WHERE `cc_nucleo_usuario`.`nuo_usuario_id` = '$id' 
            AND `cc_nucleo_usuario`.`nuo_nucleo_id` = '$nucleo' 
            AND `cc_permissao`.`per_nome` = '$permissao' 
            AND `cc_nucleo_usuario_permissao`.`nua_sistema` = '$sistema'
            AND `cc_noticia_nucleo`.`noo_noticia_id` = '$noticia'
            AND `cc_noticia_nucleo`.`noo_original` = '1'
        ";
        return (bool)($this->db->query($sql)->result());
    }*/


    function retorna_todos_sistemas(){
        $this->db->select('*');
        $this->db->from('cc_sistema');
        return $this->db->get()->result();
    }

    function retorna_todos_nucleos(){
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        return $this->db->get()->result();
    }

    function retorna_todos_usuarios(){
        $this->db->select('usu_id, usu_nome');
        $this->db->from('cc_usuario');
        $this->db->where('usu_aprovacao', 1);
        return $this->db->get()->result();
    }

    function verifica_todas_permissoes_usuario($par, $permissao){
        $parametros = explode("-", $par);
        $this->db->select('*');
        $this->db->from('cc_nucleo_usuario_permissao');
        $this->db->where('cc_nucleo_usuario_permissao.nua_sistema', $parametros[0]);
        $this->db->where('cc_nucleo_usuario_permissao.nua_nucleo', $parametros[1]);
        $this->db->where('cc_nucleo_usuario_permissao.nua_usuario', $parametros[2]);
        $this->db->where('cc_nucleo_usuario_permissao.nua_permissao', $permissao);
        //$this->db->join('cc_permissao', 'cc_nucleo_usuario_permissao.nua_permissao = cc_permissao.per_id', 'inner');
        return (bool)($this->db->get()->result());
    }

    function retorna_todas_permissoes(){
        $this->db->select('*');
        $this->db->from('cc_permissao');
        return $this->db->get()->result();
    }

    function ver_permissao($sistema, $nucleo, $user, $permissao){
        $this->db->select('*');
        $this->db->from('cc_nucleo_usuario_permissao');
        $this->db->where('cc_nucleo_usuario_permissao.nua_sistema', $sistema);
        $this->db->where('cc_nucleo_usuario_permissao.nua_nucleo', $nucleo);
        $this->db->where('cc_nucleo_usuario_permissao.nua_usuario', $user);
        $this->db->where('cc_nucleo_usuario_permissao.nua_permissao', $permissao);
        return (bool)($this->db->get()->result());
    }

    function nova_permissao($sistema, $nucleo, $user, $permissao){
        $data = array(
        'nua_sistema' => $sistema,
        'nua_nucleo' => $nucleo,
        'nua_usuario' => $user,
        'nua_permissao' => $permissao
        );

        $this->db->insert('cc_nucleo_usuario_permissao', $data);
    }
    function apaga_permissao($sistema, $nucleo, $user, $permissao){
        $this->db->where('nua_sistema', $sistema);
        $this->db->where('nua_nucleo', $nucleo);
        $this->db->where('nua_usuario', $user);
        $this->db->where('nua_permissao', $permissao);
        $this->db->delete('cc_nucleo_usuario_permissao');

    }

    function aplica_permissao($sistema, $nucleo, $user, $permissao, $tipo){
        if($tipo == 1){
            if(!$this->ver_permissao($sistema, $nucleo, $user, $permissao)){
                //echo "$sistema, $nucleo, $user, $permissao, '1'<br>";
                $this->nova_permissao($sistema, $nucleo, $user, $permissao);
                
            }
        }else{
            if($this->ver_permissao($sistema, $nucleo, $user, $permissao)){
                $this->apaga_permissao($sistema, $nucleo, $user, $permissao);
                //echo "$sistema, $nucleo, $user, $permissao, '0'<br>";
            }
        }
        //echo $sistema . $nucleo . $permissao . $tipo . "<br>";
    }



    


}
