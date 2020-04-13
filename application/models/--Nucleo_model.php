<?php

class Nucleo_model extends CI_Model {

    function __construct() {

        // Call the Model constructor
        parent::__construct();
        
    }
    


    function retorna_dados_nucleo($id){
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->where('cc_nucleo.nuc_id', $id);
        return $this->db->get()->result()[0];
    }



    function retorna_todos_nucleos($id){
        $this->db->select('*');
        $this->db->from('cc_nucleo_usuario');
        $this->db->join('cc_nucleo', 'cc_nucleo_usuario.nuo_nucleo_id = cc_nucleo.nuc_id', 'inner');
        $this->db->join('cc_papel', 'cc_nucleo_usuario.nuo_papel_id = cc_papel.pap_id', 'inner');
        $this->db->where('cc_nucleo_usuario.nuo_usuario_id', $id);
        return $this->db->get()->result();
    }
    


     function retorna_todas_noticias_na($id){
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->join('cc_noticia_nucleo', 'cc_noticia_nucleo.noo_nucleo_id = cc_nucleo.nuc_id', 'inner');
        $this->db->join('cc_noticia', 'cc_noticia.not_id = cc_noticia_nucleo.noo_noticia_id', 'inner');
        $this->db->where('cc_nucleo.nuc_id', $id);
        $this->db->where('cc_noticia_nucleo.noo_aprovacao', 0);
        return $this->db->get()->result();
    }
    function retorna_todas_noticias_a($id){
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->join('cc_noticia_nucleo', 'cc_noticia_nucleo.noo_nucleo_id = cc_nucleo.nuc_id', 'inner');
        $this->db->join('cc_noticia', 'cc_noticia.not_id = cc_noticia_nucleo.noo_noticia_id', 'inner');
        $this->db->where('cc_nucleo.nuc_id', $id);
        $this->db->where('cc_noticia_nucleo.noo_aprovacao', 1);
        return $this->db->get()->result();
    }

    function retorna_todas_noticias_suas_na($id){
        $id_user = $this->session->userdata['usu_id'];
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->join('cc_noticia_nucleo', 'cc_noticia_nucleo.noo_nucleo_id = cc_nucleo.nuc_id', 'inner');
        $this->db->join('cc_noticia', 'cc_noticia.not_id = cc_noticia_nucleo.noo_noticia_id', 'inner');
        $this->db->join('cc_autor_noticia', 'cc_noticia.not_id = cc_autor_noticia.aut_noticia_id', 'inner');
        $this->db->where('cc_nucleo.nuc_id', $id);
        $this->db->where('cc_autor_noticia.aut_usuario_id', $id_user);
        $this->db->where('cc_noticia_nucleo.noo_aprovacao', 0);

        return $this->db->get()->result();
    }

    function retorna_todas_noticias_suas_a($id){
        $id_user = $this->session->userdata['usu_id'];
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->join('cc_noticia_nucleo', 'cc_noticia_nucleo.noo_nucleo_id = cc_nucleo.nuc_id', 'inner');
        $this->db->join('cc_noticia', 'cc_noticia.not_id = cc_noticia_nucleo.noo_noticia_id', 'inner');
        $this->db->join('cc_autor_noticia', 'cc_noticia.not_id = cc_autor_noticia.aut_noticia_id', 'inner');
        $this->db->where('cc_nucleo.nuc_id', $id);
        $this->db->where('cc_autor_noticia.aut_usuario_id', $id_user);
        $this->db->where('cc_noticia_nucleo.noo_aprovacao', 1);

        return $this->db->get()->result();
    }





    


}
