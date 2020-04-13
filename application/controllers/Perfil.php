<?php
class Perfil extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('conf');
    }



    public function index() {
        $dados['user'] = $this->perfil_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        $this->load->view('perfil/home', $dados);
        $this->load->view('footer');
    }





    public function editar() {
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        if($this->input->post('alterar') != null){
            $foto = $_FILES['usu_foto'];
            if(!empty($foto["name"])){ 
                $this->perfil_model->apaga_foto_perfil($dados['user']->usu_id);
                $usu_foto = $this->painel_model->foto($foto, $this->conf->caminho_upload_perfil_relativo());
            }else{ 
                $usu_foto = $dados['user']->usu_foto;
            }
            $usu_nome = $this->input->post('usu_nome');
            $usu_cel = $this->input->post('usu_cel');
            $usu_tel = $this->input->post('usu_tel');
            $usu_sobre = $this->input->post('usu_sobre');

            $resultado = $this->perfil_model->alterar($this->session->userdata['usu_id'], $usu_nome, $usu_cel, $usu_tel, $usu_sobre, $usu_foto);
            if($resultado){
                $avisos[0]['message'] = "Perfil alterado com sucesso!";
                $avisos[0]['type'] = "success";
            }else{
                $avisos[1]['message'] = "Nada foi alterado!";
                $avisos[1]['type'] = "danger";
            }
            
            $this->session->set_userdata('avisos', $avisos);
            redirect('perfil/');
        }

        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        $this->load->view('perfil/editar', $dados);
        $this->load->view('footer');
    }







    public function config() {
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);

        if($this->input->post('alterar_senha') != null){
            $senha_atual = $this->input->post('senha_atual');
            $senha1 = $this->input->post('senha1');
            $senha2 = $this->input->post('senha2');

            if(empty($senha_atual) || empty($senha1) || empty($senha2)){
                $avisos[4]['message'] = "Por favor! Preencha os campos corretamente";
                $avisos[4]['type'] = "danger";
            }else{
                $resultado = $this->perfil_model->alterar_senha($this->session->userdata['usu_id'], $senha_atual, $senha1, $senha2);
                if($resultado == 1){
                    $avisos[0]['message'] = "Senha alterada com sucesso!";
                    $avisos[0]['type'] = "success";
                    //$this->log_model->alterou_senha($dados['user']->usu_nome, $par); ////registra no log
                }
                if($resultado == 0){
                    $avisos[1]['message'] = "Nada foi alterado!";
                    $avisos[1]['type'] = "danger";
                }
                if($resultado == 2){
                    $avisos[2]['message'] = "Senha errada!";
                    $avisos[2]['type'] = "danger";
                }
                if($resultado == 3){
                    $avisos[3]['message'] = "As senhas não conferem!";
                    $avisos[3]['type'] = "danger";
                }
            }
            
            $this->session->set_userdata('avisos', $avisos);
            redirect('perfil/');
        }


        if($this->input->post('alterar_email') != null){
            $senha = $this->input->post('senha');
            $email = $this->input->post('email');

            if(empty($senha) || empty($email)){
                $avisos[4]['message'] = "Por favor! Preencha os campos corretamente";
                $avisos[4]['type'] = "danger";
            }else{
                $resultado = $this->perfil_model->alterar_email($this->session->userdata['usu_id'], $senha, $email);
                if($resultado == 1){
                    $avisos[0]['message'] = "Email alterado com sucesso!";
                    $avisos[0]['type'] = "success";
                    //$this->log_model->alterou_senha($dados['user']->usu_nome, $par); ////registra no log
                }
                if($resultado == 0){
                    $avisos[1]['message'] = "Nada foi alterado!";
                    $avisos[1]['type'] = "danger";
                }
                if($resultado == 2){
                    $avisos[2]['message'] = "Senha errada!";
                    $avisos[2]['type'] = "danger";
                }
            }
            
            $this->session->set_userdata('avisos', $avisos);
            redirect('perfil/');
        }

        if($this->input->post('excluir_conta') != null){
            $senha = $this->input->post('senha');

            if(empty($senha)){
                $avisos[4]['message'] = "Por favor! Preencha os campos corretamente";
                $avisos[4]['type'] = "danger";
            }else{
                $resultado = $this->perfil_model->excluir_conta($this->session->userdata['usu_id'], $senha);
                if($resultado == 1){
                    //$this->log_model->alterou_senha($dados['user']->usu_nome, $par); ////registra no log
                    $this->session->sess_destroy();
                    redirect("home/logar/logout");
                }
                if($resultado == 0){
                    $avisos[1]['message'] = "Nada foi alterado!";
                    $avisos[1]['type'] = "danger";
                }
                if($resultado == 2){
                    $avisos[2]['message'] = "Senha errada!";
                    $avisos[2]['type'] = "danger";
                }
            }
            
            $this->session->set_userdata('avisos', $avisos);
            redirect('perfil/');
        }

        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        $this->load->view('perfil/config', $dados);
        $this->load->view('footer');
    }















}
