<?php
class Home extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model('logar_model');
    }

    ////////////////////////////////////////////////////
    ////////////////// SISTEMA LOGIN ///////////////////
    ////////////////////////////////////////////////////
    public function index() {
        $this->logar_model->verifica_logado();
        redirect("home/logar/");
    }

    public function logar($aviso = null){
        $this->logar_model->verifica_logado();
        
        ///verifica avisos
        $dados = null;
        if($aviso == "incorreto"){ $dados['aviso'] = "Dados Incorretos"; }
        if($aviso == "logout"){ $dados['aviso'] = "Logoff realizado com sucesso!"; }
        if($aviso == "aguardando"){ $dados['aviso'] = "Aguardando aprovação!"; }
        if($aviso == "confirme"){ $dados['aviso'] = "Por favor! Confirme seu email!"; }

        $this->load->view('login/header');
        $this->load->view('login/home', $dados);
        $this->load->view('login/footer');

    }

    public function login() {
        //Recebe do formulário
        $user = $this->input->post('usuario');
        $pass = $this->input->post('senha');
        ///chama a funcao de logar
        $this->logar_model->logar($user, $pass);
    }

    public function logout() {
        $this->session->sess_destroy();
        redirect("home/logar/logout");
    }




    ////////////////////////////////////////////////////////
    ////////////////// SISTEMA DE CADASTRO /////////////////
    ////////////////////////////////////////////////////////
    public function cadastro(){
        $this->logar_model->verifica_logado();
        if($this->input->post('cadastrar') != null){
            $usu_login = $this->input->post('usu_login');
            $usu_senha = $this->input->post('usu_senha');
            $usu_nome = $this->input->post('usu_nome');
            $usu_email = $this->input->post('usu_email');
            $hash = rand(1, 10000);
            $hash = md5($hash);
            
            $resultado = $this->logar_model->cadastrar($usu_login, $usu_senha, $usu_nome, $usu_email, $hash);

            /*if($resultado == 1){ 
                $arquivo = "<b>Cadastro no site da ciência da computação</b><br>
                Link para confirmação de sua conta: <a href=\"" . base_url() . "home/confirmacao/" . $usu_login . "/" . $hash . "\">Confirmar cadastro</a><br>
                Caso você não tenha solicitado o cadastro na ciência da computação apenas ignore este e-mail!";
                $destino = $usu_email;
                $assunto = "Confirmação de cadastro no site da ciência da computação";
                $headers  = 'MIME-Version: 1.0' . "\r\n";
                $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
                $headers .= 'From: Ciência da computação <admin@comp.muz.ifsuldeminas.edu.br>';
                $enviaremail = mail($destino, $assunto, $arquivo, $headers);
                if ($enviaremail) {
                    $dados['sucesso'] = "Cadastro realizado com sucesso! Foi enviado um email para confirmação da sua conta!";
                }else{
                    $dados['erro'] = "Houve um problema! Por favor contate o administrador!";
                }
            }*/

            if ($resultado == 1) {
                $dados['sucesso'] = "Cadastro realizado com sucesso!";
            }
                
            if($resultado == 0){ $dados['erro'] = "Houve um problema! Por favor contate o administrador!"; }
            if($resultado == 2){ $dados['erro'] = "Login já existente! Por favor tente outro login!"; }
            if($resultado == 3){ $dados['erro'] = "Por favor preencha todos os campos!"; }
        }else{
            $dados = null;
        }

        $this->load->view('login/header');
        $this->load->view('login/cadastro', $dados);
        $this->load->view('login/footer');

    }

    public function confirmacao($usu_login = null, $usu_hash = null){
        $this->logar_model->verifica_logado();
        $resultado = $this->logar_model->confirma_cadastro($usu_login, $usu_hash);

        if($resultado){
            $avisos[0]['message'] = "Cadastro confirmado com sucesso! Agora basta aguardar aprovação!";
            $avisos[0]['type'] = "success";
        }else{
            $avisos[1]['message'] = "Houve um problema! Por favor contate o administrador!";
            $avisos[1]['type'] = "danger";
        }

        $this->session->set_userdata('avisos', $avisos);
        redirect('home');
    }




    ////////////////////////////////////////////////////////
    //////////////// SISTEMA DE RECUPERAÇAO ////////////////
    ////////////////////////////////////////////////////////
    public function esqueceu(){
        $this->logar_model->verifica_logado();
        if($this->input->post('recuperar') != null){
            $usu_login = $this->input->post('usu_login');
            $hash = rand(1, 10000);
            $hash = md5($hash);
            $user = $this->logar_model->ver_user_login($usu_login);
            
            $resultado = $this->logar_model->recuperar($usu_login, $hash);

            if($resultado == 1){ 
                $arquivo = "<b>Recuperar senha - Ciência da computação</b><br>
                Link para recuperação de senha: <a href=\"" . base_url() . "home/recuperar/" . $usu_login . "/" . $hash . "\">Recuperar senha</a><br>
                Caso você não tenha solicitado a recuperação de senha no site da ciência da computação apenas ignore este e-mail!";
                $destino = $user->usu_email;
                $assunto = "Recuperar senha - Ciência da computação";
                $headers  = 'MIME-Version: 1.0' . "\r\n";
                $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
                $headers .= 'From: Ciência da computação <admin@comp.muz.ifsuldeminas.edu.br>';
                $enviaremail = mail($destino, $assunto, $arquivo, $headers);
                if ($enviaremail) {
                    $avisos[0]['message'] = "Foi enviado um email para recuperação de sua senha!";
                    $avisos[0]['type'] = "success";
                }else{
                    $avisos[1]['message'] = "Houve um problema! Por favor contate o administrador!";
                    $avisos[1]['type'] = "danger";
                }
                $this->session->set_userdata('avisos', $avisos);
                redirect('home');
            }
        }
        $this->load->view('login/header');
        $this->load->view('login/esqueceu');
        $this->load->view('login/footer');

    }

    public function recuperar($usu_login = null, $usu_rechash = null){
        $this->logar_model->verifica_logado();
        $this->logar_model->verifica_recuperacao($usu_login, $usu_rechash);
        if($this->input->post('recuperar') != null){
            $senha1 = $this->input->post('senha1');
            $senha2 = $this->input->post('senha2');


            if($senha1 == $senha2){
                $resultado = $this->logar_model->recupera_senha($usu_login, $senha1);

                if($resultado){ 
                    $avisos[0]['message'] = "Nova senha cadastrada com sucesso!";
                    $avisos[0]['type'] = "success";
                }else{
                    $avisos[1]['message'] = "Houve um problema! Por favor contate o administrador!";
                    $avisos[1]['type'] = "danger";
                }
                $this->session->set_userdata('avisos', $avisos);
                redirect('home');
            }else{
                $dados['erro'] = "As senhas não são iguais!";
            }
        }else{
            $dados['login'] = $usu_login;
        }

        $this->load->view('login/header');
        $this->load->view('login/recuperar', $dados);
        $this->load->view('login/footer');

    }





}
