<?php

class Conf extends CI_Model {

    function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model('logar_model');
        $this->load->model('painel_model');
        $this->load->model('perfil_model');
        $this->load->model('anuncios_model');
        $this->load->model('crud');
        $this->logar_model->protege();
    }
    
    function caminho_upload(){
        return base_url() . "assets/upload/";
    }
    function caminho_upload_noticias(){
        return $this->caminho_upload() . "noticias/";
    }
    function caminho_upload_noticias_relativo(){
        return "assets/upload/noticias/";
    }

    function caminho_upload_eventos(){
        return $this->caminho_upload() . "eventos/";
    }
    function caminho_upload_eventos_relativo(){
        return "assets/upload/eventos/";
    }

    function caminho_upload_perfil(){
        return $this->caminho_upload() . "perfil/";
    }
    function caminho_upload_perfil_relativo(){
        return "assets/upload/perfil/";
    }


    function data($data){
        $data = explode(" ", $data);
        if(isset($data[1])){
            $dias = explode("-", $data[0]);
            return $data[1] . " " . $dias[2] . "/" . $dias[1] . "/" . $dias[0];
        }else{
            $dias = explode("-", $data[0]);
            return $dias[2] . "/" . $dias[1] . "/" . $dias[0];
        }  
    }

    function rdata($data){
        $data = explode(" ", $data);
        if(isset($data[1])){
            $dias = explode("/", $data[1]);
            return $dias[2] . "-" . $dias[1] . "-" . $dias[0] . " " . $data[0];
        }else{
            $dias = explode("/", $data[0]);
            return $dias[2] . "-" . $dias[1] . "-" . $dias[0];
        }  
    }
}
