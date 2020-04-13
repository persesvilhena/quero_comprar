<?php
class Painel extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model('conf');
        $this->load->model('logar_model');
        $this->load->model('painel_model');
        $this->logar_model->protege();
    }



    public function index() {
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        $this->load->view('painel', $dados);
        $this->load->view('footer');
    }















    public function nucleo($id = null, $pag = null, $par = null) {
        $this->load->model('nucleo_model');
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $dados['nucleo'] = $this->nucleo_model->retorna_dados_nucleo($id);



        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        if($pag == null || $pag == "home"){
            $this->load->view('nucleo/home', $dados);
        }



















        //////////////////////////////////////////////
        ///////////// SISTEMA DE NOTICIAS ////////////
        //////////////////////////////////////////////
        if($this->input->post('destacar_noticia') != null){
            if($this->permissao_model->verifica_permissao("des", $id, 1)){
                $id_noticia = $this->input->post('id_noticia');
                $noticia = $this->noticias_model->ver_noticia($id_noticia);
                $resultado = $this->noticias_model->destacar_noticia($id_noticia, $id);
                if($resultado == 1){
                    $this->log_model->adicionou_destaque_noticia($noticia->not_titulo, $par); ////registra no log
                    $avisos[0]['message'] = "Noticia destacada com sucesso!";
                    $avisos[0]['type'] = "success";
                }else{
                    $avisos[1]['message'] = "Houve um problema ao destacar a noticia! Contate o administrador!";
                    $avisos[1]['type'] = "danger";
                }

                $this->session->set_userdata('avisos', $avisos);
                redirect('painel/nucleo/' . $id . '/noticias');
            } 
        }

        if($this->input->post('remover_destaque') != null){
            if($this->permissao_model->verifica_permissao("des", $id, 1)){
                $id_noticia = $this->input->post('id_noticia');
                $noticia = $this->noticias_model->ver_noticia($id_noticia);
                $resultado = $this->noticias_model->remover_destaque($id_noticia, $id);
                if($resultado == 1){
                    $this->log_model->removeu_destaque_noticia($noticia->not_titulo, $par); ////registra no log
                    $avisos[0]['message'] = "Destaque removido com sucesso!";
                    $avisos[0]['type'] = "success";
                }else{
                    $avisos[1]['message'] = "Houve um problema ao remover o destaque! Contate o administrador!";
                    $avisos[1]['type'] = "danger";
                }
                $this->session->set_userdata('avisos', $avisos);
                redirect('painel/nucleo/' . $id . '/noticias');
            } 
        }



        if($pag == "noticias"){


            $dados['noticias_nucleo_na'] = $this->nucleo_model->retorna_todas_noticias_na($id);
            $dados['noticias_nucleo_a'] = $this->nucleo_model->retorna_todas_noticias_a($id);
            $dados['noticias_nucleo_suas_na'] = $this->nucleo_model->retorna_todas_noticias_suas_na($id);
            $dados['noticias_nucleo_suas_a'] = $this->nucleo_model->retorna_todas_noticias_suas_a($id);
            $this->load->view('nucleo/noticias/home', $dados);
        }


        if($pag == "ver_noticia"){
            if($this->permissao_model->verifica_permissao("lis_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1)){
                $dados['noticia'] = $this->noticias_model->ver_noticia($par);
                $dados['autores'] = $this->noticias_model->ver_autor_noticia($par);
                $this->load->view('nucleo/noticias/ver', $dados);
                //var_dump($this->noticias_model->descobrir_permissao($id, $par, 221));
            }
        }


        if($pag == "inserir_noticia"){
            if($this->permissao_model->verifica_permissao("ins", $id, 1)){
                /////////////faz a alteracao
                if($this->input->post('inserir_noticia') != null){

                        $foto = $_FILES['not_foto'];
                        if (!empty($foto["name"])) {
                            $largura = 5000;
                            $larguramin = 1;
                            $altura = 2500;
                            $tamanho = 5000000;
                            preg_match("/\.(gif|bmp|png|jpg|jpeg){1}$/i", $foto["name"], $ext);
                            if($ext[1] != "gif" && $ext[1] != "bmp" && $ext[1] != "png" && $ext[1] != "jpg" && $ext[1] != "jpeg"){
                               $error[1] = "<script>alert ('Formato incompativel!')</script>";
                            } else {
                                $dimensoes = getimagesize($foto["tmp_name"]);
                                if($dimensoes[0] > $largura) {
                                    $error[2] = "<script>alert ('A largura da imagem não deve ultrapassar ".$largura." pixels')</script>";
                                }
                                if($dimensoes[0] < $larguramin) {
                                    $error[5] = "<script>alert ('A largura da imagem não deve ser menor de ".$larguramin." pixels')</script>";
                                }
                                if($dimensoes[1] > $altura) {
                                    $error[3] = "<script>alert ('Altura da imagem não deve ultrapassar ".$altura." pixels')</script>";
                                }
                                if($foto["size"] > $tamanho) {
                                    $error[4] = "<script>alert ('A imagem deve ter no máximo ".$tamanho." bytes')</script>";
                                }
                            }
                     
                            if (!isset($error)){
                                $nome_imagem = md5(uniqid(time())) . "." . $ext[1];
                                $caminho_imagem = $this->conf->caminho_upload_noticias_relativo() . $nome_imagem;
                                move_uploaded_file($foto["tmp_name"], $caminho_imagem);
                            }

                            if(isset($error)){
                                foreach ($error as $erro) {
                                    echo $erro;
                                }
                            }
                        }
                    
                    $not_titulo = $this->input->post('not_titulo');
                    $not_subtitulo = $this->input->post('not_subtitulo');
                    $not_conteudo = $this->input->post('not_conteudo');
                    $not_conteudo_sem_formatacao = $this->input->post('not_conteudo_sem_formatacao');
                    if(isset($nome_imagem)){ $not_foto = $nome_imagem; }else{ $not_foto = "novo.png"; }
                    $not_criado = $this->input->post('not_criado');
                    $not_revisado = $this->input->post('not_revisado');
                    $not_exibicao = $this->input->post('not_exibicao');
                    $not_palavra_chave = $this->input->post('not_palavra_chave');
                    $not_slug = $this->noticias_model->criar_slug($not_titulo);
                    if(empty($not_titulo) || empty($not_conteudo) || empty($not_criado) || empty($not_exibicao)){
                        $avisos[2]['message'] = "Por favor! Preencha todos os campos obrigatórios!";
                        $avisos[2]['type'] = "danger";
                    }else{
                        $resultado = $this->noticias_model->inserir_noticia($this->session->usu_id, $id, $not_titulo, $not_subtitulo, $not_conteudo, $not_conteudo_sem_formatacao, $not_foto, $not_criado, $not_revisado, $not_exibicao, $not_slug, $not_palavra_chave);
                        if($resultado){
                            $avisos[0]['message'] = "Notícia inserida com sucesso!";
                            $avisos[0]['type'] = "success";
                        }else{
                            $avisos[1]['message'] = "Houve um problema! Contate o administrador!";
                            $avisos[1]['type'] = "danger";
                        }
                        $this->log_model->adicionou_noticia($not_titulo); ////registra no log
                    }
                    
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/noticias');

                }

                ////////////exibe o formulario para alteracao
               // $dados['noticia'] = $this->noticias_model->ver_noticia($par);
                $this->load->view('nucleo/noticias/inserir', $dados);
            }

        }


        if($pag == "alterar_noticia"){
            $tp = $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id); ///tipo de permissao
            $sis = 1; //// sistema 1 referente a noticias
            if($this->permissao_model->permissao_original_noticia("alt_" . $tp, $id, $sis, $par) || 
               $this->permissao_model->permissao_autoral_noticia("alt_" . $tp, $id, $sis, $par)){
                /////////////faz a alteracao
                if($this->input->post('alterar_noticia') != null){
                    $noticia = $this->noticias_model->ver_noticia($par);
                    $foto = $_FILES['not_foto'];
                    if (!empty($foto["name"])) {
                        $largura = 5000;
                        $larguramin = 1;
                        $altura = 2500;
                        $tamanho = 5000000;
                        preg_match("/\.(gif|bmp|png|jpg|jpeg){1}$/i", $foto["name"], $ext);
                        if($ext[1] != "gif" && $ext[1] != "bmp" && $ext[1] != "png" && $ext[1] != "jpg" && $ext[1] != "jpeg"){
                           $error[1] = "Formato incompativel!";
                        } else {
                            $dimensoes = getimagesize($foto["tmp_name"]);
                            if($dimensoes[0] > $largura) {
                                $error[2] = "A largura da imagem não deve ultrapassar ".$largura." pixels";
                            }
                            if($dimensoes[0] < $larguramin) {
                                $error[5] = "A largura da imagem não deve ser menor de ".$larguramin." pixels";
                            }
                            if($dimensoes[1] > $altura) {
                                $error[3] = "Altura da imagem não deve ultrapassar ".$altura." pixels";
                            }
                            if($foto["size"] > $tamanho) {
                                $error[4] = "A imagem deve ter no máximo ".$tamanho." bytes";
                            }
                        }
                        if (!isset($error)){
                            $this->noticias_model->apaga_foto_noticia($par);
                            $nome_imagem = md5(uniqid(time())) . "." . $ext[1];
                            $caminho_imagem = $this->conf->caminho_upload_noticias_relativo() . $nome_imagem;
                            move_uploaded_file($foto["tmp_name"], $caminho_imagem);
                        }
                        if(isset($error)){
                            foreach ($error as $erro) {
                                echo $erro;
                            }
                        }
                    }
                    $not_titulo = $this->input->post('not_titulo');
                    $not_subtitulo = $this->input->post('not_subtitulo');
                    $not_conteudo = $this->input->post('not_conteudo');
                    $not_conteudo_sem_formatacao = $this->input->post('not_conteudo_sem_formatacao');
                    if(isset($nome_imagem)){ $not_foto = $nome_imagem; }else{ $not_foto = $noticia->not_foto; }
                    $not_criado = $this->input->post('not_criado');
                    $not_revisado = $this->input->post('not_revisado');
                    $not_exibicao = $this->input->post('not_exibicao');
                    $not_slug = $this->input->post('not_slug');
                    $not_palavra_chave = $this->input->post('not_palavra_chave');
                    $resultado = $this->noticias_model->alterar_noticia($par, $not_titulo, $not_subtitulo, $not_conteudo, $not_conteudo_sem_formatacao, $not_foto, $not_criado, $not_revisado, $not_exibicao, $not_slug, $not_palavra_chave);
                    if($resultado){
                        $avisos[0]['message'] = "Notícia alterada com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $dados['erro'] = "Nada foi alterado!";
                    }
                    $this->log_model->alterou_noticia($noticia->not_titulo, $par); ////registra no log
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/noticias');
                }

                ////////////exibe o formulario para alteracao
                $dados['noticia'] = $this->noticias_model->ver_noticia($par);
                $dados['autores'] = $this->noticias_model->ver_autor_noticia($par);
                $this->load->view('nucleo/noticias/alterar', $dados);
            }

        }


        if($pag == "fotos_noticia"){
            if($this->permissao_model->permissao_original_noticia("alt_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1, $par) || $this->permissao_model->permissao_autoral_noticia("alt_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1, $par)){
                /////////////faz a alteracao
                $dados['noticia'] = $this->noticias_model->ver_noticia($par);

                if($this->input->post('inserir_foto') != null){
                    $foto = $_FILES['foto'];
                    if (!empty($foto["name"])) {
                        $largura = 5000;
                        $larguramin = 1;
                        $altura = 2500;
                        $tamanho = 5000000;
                        preg_match("/\.(gif|bmp|png|jpg|jpeg){1}$/i", $foto["name"], $ext);
                        if($ext[1] != "gif" && $ext[1] != "bmp" && $ext[1] != "png" && $ext[1] != "jpg" && $ext[1] != "jpeg"){
                           $error[1] = "Formato incompativel!";
                        } else {
                            $dimensoes = getimagesize($foto["tmp_name"]);
                            if($dimensoes[0] > $largura) {
                                $error[2] = "A largura da imagem não deve ultrapassar ".$largura." pixels";
                            }
                            if($dimensoes[0] < $larguramin) {
                                $error[5] = "A largura da imagem não deve ser menor de ".$larguramin." pixels";
                            }
                            if($dimensoes[1] > $altura) {
                                $error[3] = "Altura da imagem não deve ultrapassar ".$altura." pixels";
                            }
                            if($foto["size"] > $tamanho) {
                                $error[4] = "A imagem deve ter no máximo ".$tamanho." bytes";
                            }
                        }
                        if (!isset($error)){
                            $nome_imagem = md5(uniqid(time())) . "." . $ext[1];
                            $caminho_imagem = $this->conf->caminho_upload_noticias_relativo() . $nome_imagem;
                            move_uploaded_file($foto["tmp_name"], $caminho_imagem);
                        }
                        if(isset($error)){
                            foreach ($error as $erro) {
                                echo $erro;
                            }
                        }
                    }
                    $resultado = $this->noticias_model->inserir_foto($par, $nome_imagem); /// insere no banco
                    if($resultado == 1){
                        $this->log_model->adicionou_foto_noticia($dados['noticia']->not_titulo, $par); ////registra no log
                        $dados['sucesso'] = "Foto inserida com sucesso!";
                    }else{
                        $dados['erro'] = "Houve um problema! Contate o administrador!";
                    }
                }

                if($this->input->post('remover_foto') != null){
                    $foto = $this->input->post('foto');
                    $resultado = $this->noticias_model->remover_foto($foto); ///remove do banco
                    if($resultado == 1){
                        $this->log_model->removeu_foto_noticia($dados['noticia']->not_titulo, $par); ////registra no log
                        $dados['sucesso'] = "Foto removida com sucesso!";
                    }else{
                        $dados['erro'] = "Houve um problema! Contate o administrador!";
                    }
                }

                ////////////exibe o formulario para alteracao
                $dados['todos_usuarios'] = $this->noticias_model->retorna_todos_autores_disponiveis($par);
                $dados['fotos'] = $this->noticias_model->ver_fotos_noticia($par);
                $dados['autores'] = $this->noticias_model->ver_autor_noticia($par);
                $this->load->view('nucleo/noticias/fotos_noticia', $dados);
            }

        }



        if($pag == "autores_noticia"){
            if($this->permissao_model->permissao_original_noticia("alt_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1, $par) || $this->permissao_model->permissao_autoral_noticia("alt_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1, $par)){
                /////////////faz a alteracao
                $dados['noticia'] = $this->noticias_model->ver_noticia($par);

                if($this->input->post('inserir_autor') != null){
                    $autor = $this->input->post('autor');
                    $autor_dados = $this->painel_model->retorna_dados_usuario($autor);
                    $resultado = $this->noticias_model->inserir_autor($par, $autor);
                    $this->log_model->adicionou_autor_noticia($dados['noticia']->not_titulo, $par, $autor, $autor_dados->usu_nome); ////registra no log
                    if($resultado == 1){
                        $dados['sucesso'] = "Autor inserido com sucesso!";
                    }else{
                        if($resultado == 0){
                            $dados['erro'] = "Houve um problema! Contate o administrador!";
                        }else{
                            $dados['erro'] = "Autor já existente na notícia!";
                        }   
                    }
                }

                if($this->input->post('remover_autor') != null){
                    $autor = $this->input->post('autor');
                    $autor_dados = $this->painel_model->retorna_dados_usuario($autor);
                    $resultado = $this->noticias_model->remover_autor($par, $autor);
                    $this->log_model->removeu_autor_noticia($dados['noticia']->not_titulo, $par, $autor, $autor_dados->usu_nome); ////registra no log
                    if($resultado == 1){
                        $dados['sucesso'] = "Autor removido com sucesso!";
                    }else{
                        if($resultado == 0){
                            $dados['erro'] = "Houve um problema! Contate o administrador!";
                        }else{
                            $dados['erro'] = "Autor não pode ser removido pois é autor original!";
                        }   
                    }
                }

                ////////////exibe o formulario para alteracao
                $dados['todos_usuarios'] = $this->noticias_model->retorna_todos_autores_disponiveis($par);
                
                $dados['autores'] = $this->noticias_model->ver_autor_noticia($par);
                $this->load->view('nucleo/noticias/autores_noticia', $dados);
            }

        }



        if($pag == "apagar_noticia"){
            if($this->permissao_model->permissao_original_noticia("exc_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1, $par) || $this->permissao_model->permissao_autoral_noticia("exc_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1, $par)){
                if($this->input->post('apagar_noticia') != null){
                    $noticia = $this->noticias_model->ver_noticia($par);
                    $dados['avisos'] = 1;
                    $resultado = $this->noticias_model->apagar_noticia($par);
                    if($resultado){
                        $avisos[0]['message'] = "Notícia apagada com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Houve um problema ao apagar a notícia! Contate o administrador!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->log_model->removeu_noticia($noticia->not_titulo, $par); ////registra no log
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/noticias');
                }else{
                    $dados['avisos'] = 0;
                    $dados['noticia'] = $this->noticias_model->ver_noticia($par);
                }
                
                $this->load->view('nucleo/noticias/apagar', $dados);
            }
        }




        if($pag == "aprovar_noticia"){
            if($this->permissao_model->verifica_permissao("apr", $id, 1)){
                $dados['noticia'] = $this->noticias_model->ver_noticia($par);
                if($this->input->post('aprovar_noticia') != null){
                    $dados['avisos'] = 1;
                    $resultado = $this->noticias_model->aprovar_noticia($par, $id);
                    if($resultado){
                        $this->log_model->adicionou_aprovacao_noticia($dados['noticia']->not_titulo, $par); ////registra no log
                        $avisos[0]['message'] = "Notícia aprovada com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Houve um problema ao aprovar a notícia! Contate o administrador!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/noticias');
                }else{
                    $dados['avisos'] = 0;
                    
                }
                
                $this->load->view('nucleo/noticias/aprovar', $dados);
            }
        }




        if($pag == "reprovar_noticia"){
            if($this->permissao_model->verifica_permissao("apr", $id, 1)){
                $dados['noticia'] = $this->noticias_model->ver_noticia($par);
                if($this->input->post('reprovar_noticia') != null){
                    $dados['avisos'] = 1;
                    $resultado = $this->noticias_model->reprovar_noticia($par, $id);
                    if($resultado){
                        $this->log_model->removeu_aprovacao_noticia($dados['noticia']->not_titulo, $par); ////registra no log
                        $avisos[0]['message'] = "Notícia reprovada com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Houve um problema ao reprovar a notícia! Contate o administrador!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/noticias');
                }else{
                    $dados['avisos'] = 0;
                    
                }
                
                $this->load->view('nucleo/noticias/reprovar', $dados);
            }
        }




        if($pag == "duplicacao_noticia"){
            if($this->permissao_model->permissao_original_noticia("dup_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1, $par) || $this->permissao_model->permissao_autoral_noticia("dup_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 1, $par)){
                $dados['avisos'] = 0;
                $dados['noticia'] = $this->noticias_model->ver_noticia($par);
                if($this->input->post('duplicar_noticia') != null){
                    $nucleo = $this->input->post('nucleo');
                    $dados['avisos'] = 1;
                    $resultado = $this->noticias_model->duplicar_noticia($par, $nucleo);
                    if($resultado == 1){
                        $this->log_model->adicionou_duplicacao_noticia($dados['noticia']->not_titulo, $par); ////registra no log
                        $dados['sucesso'] = "Notícia duplicada com sucesso!";
                    }else{
                        if($resultado == 0){
                            $dados['erro'] = "Houve um problema ao duplicar a notícia! Contate o administrador!";
                        }else{
                            $dados['erro'] = "Notícia já existente para nucleo escolhido!";
                        }
                    }
                }else{
                    if($this->input->post('remover_duplicacao') != null){
                        $nucleo = $this->input->post('nucleo');
                        $dados['avisos'] = 1;
                        $resultado = $this->noticias_model->remover_duplicacao($par, $nucleo);
                        if($resultado == 1){
                            $this->log_model->removeu_duplicacao_noticia($dados['noticia']->not_titulo, $par); ////registra no log
                            $dados['sucesso'] = "Duplicação removida com sucesso!";
                        }else{
                            if($resultado == 0){
                                $dados['erro'] = "Houve um problema ao remover a duplicação! Contate o administrador!";
                            }else{
                                $dados['erro'] = "Este nucleo não pode ser removido pois é nucleo original!";
                            }
                        }
                    }else{

                    }
                }
                $dados['todos_nucleos_duplicacao'] = $this->noticias_model->retorna_todos_nucleos($par);
                $dados['todos_nucleos'] = $this->noticias_model->retorna_todos_nucleos_disponiveis($par);
                
                $this->load->view('nucleo/noticias/duplicacao', $dados);
            }
        }



        if($pag == "destacar_noticia"){
            $dados['noticia'] = $this->noticias_model->ver_noticia($par);
            $this->load->view('nucleo/noticias/destacar_noticia', $dados);
        }


        if($pag == "remover_destaque"){
            $dados['noticia'] = $this->noticias_model->ver_noticia($par);
            $this->load->view('nucleo/noticias/remover_destaque', $dados);
        }
        ///////////////////////////////////////////////////
        ///////////// FIM SISTEMA DE NOTICIAS /////////////
        ///////////////////////////////////////////////////



























        //////////////////////////////////////////////
        ///////////// SISTEMA DE EVENTOS /////////////
        //////////////////////////////////////////////

        /////////// DESTAQUE /////////////////////////
        if($this->input->post('add_destaque_evento') != null){
            if($this->permissao_model->verifica_permissao("des", $id, 2)){
                $id_evento = $this->input->post('id_evento');
                $evento = $this->eventos_model->ver_evento($id_evento);
                $resultado = $this->eventos_model->destacar($id_evento, $id);
                if($resultado == 1){
                    $this->log_model->adicionou_destaque_evento($evento->eve_titulo, $par); ////registra no log
                    $avisos[0]['message'] = "Evento destacado com sucesso!";
                    $avisos[0]['type'] = "success";
                }else{
                    $avisos[1]['message'] = "Houve um problema ao destacar o evento! Contate o administrador!";
                    $avisos[1]['type'] = "danger";
                }

                $this->session->set_userdata('avisos', $avisos);
                redirect('painel/nucleo/' . $id . '/eventos');
            } 
        }

        if($this->input->post('rmv_destaque_evento') != null){
            if($this->permissao_model->verifica_permissao("des", $id, 2)){
                $id_evento = $this->input->post('id_evento');
                $evento = $this->eventos_model->ver_evento($id_evento);
                $resultado = $this->eventos_model->remover_destaque($id_evento, $id);
                if($resultado == 1){
                    $this->log_model->removeu_destaque_evento($evento->eve_titulo, $par); ////registra no log
                    $avisos[0]['message'] = "Destaque removido com sucesso!";
                    $avisos[0]['type'] = "success";
                }else{
                    $avisos[1]['message'] = "Houve um problema ao remover o destaque! Contate o administrador!";
                    $avisos[1]['type'] = "danger";
                }
                $this->session->set_userdata('avisos', $avisos);
                redirect('painel/nucleo/' . $id . '/eventos');
            } 
        }

        if($pag == "add_destaque_evento"){
            $dados['evento'] = $this->eventos_model->ver_evento($par);
            $this->load->view('nucleo/eventos/add_destaque', $dados);
        }

        if($pag == "rmv_destaque_evento"){
            $dados['evento'] = $this->eventos_model->ver_evento($par);
            $this->load->view('nucleo/eventos/rmv_destaque', $dados);
        }
        ////////// FIM DESTAQUE ///////////////////////



        ////////// PRINCIPAL //////////////////////////
        if($pag == "eventos"){
            $dados['eventos_nucleo_na'] = $this->eventos_model->retorna_todos_eventos_na($id);
            $dados['eventos_nucleo_a'] = $this->eventos_model->retorna_todos_eventos_a($id);
            $dados['eventos_nucleo_suas_na'] = $this->eventos_model->retorna_todos_eventos_suas_na($id);
            $dados['eventos_nucleo_suas_a'] = $this->eventos_model->retorna_todos_eventos_suas_a($id);
            $this->load->view('nucleo/eventos/home', $dados);
        }
        /////////// FIM PRINCIPAL //////////////////////



        /////////// CRUD ///////////////////////////////
        if($pag == "ver_evento"){
            if($this->permissao_model->verifica_permissao("lis_" . $this->noticias_model->descobrir_permissao($id, $par, $this->session->usu_id), $id, 2)){
                $dados['evento'] = $this->eventos_model->ver_evento($par);
                $dados['autores'] = $this->eventos_model->ver_autor_evento($par);
                $this->load->view('nucleo/eventos/ver', $dados);
            }
        }


        if($pag == "inserir_evento"){
            if($this->permissao_model->verifica_permissao("ins", $id, 2)){
                /////////////faz a alteracao
                if($this->input->post('inserir_evento') != null){
                    $foto = $_FILES['eve_foto'];
                    if(!empty($foto["name"])){ 
                        $eve_foto = $this->painel_model->foto($foto, $this->conf->caminho_upload_eventos_relativo());
                    }else{ 
                        $eve_foto = null;
                    }
                    $eve_titulo = $this->input->post('eve_titulo');
                    $eve_descricao = $this->input->post('eve_descricao');
                    $eve_descricao_sem_formatacao = $this->input->post('eve_descricao_sem_formatacao');
                    $eve_inicio = $this->input->post('eve_inicio');
                    $eve_termino = $this->input->post('eve_termino');
                    $eve_slug =  $this->eventos_model->criar_slug($eve_titulo);
                    $eve_local = $this->input->post('eve_local');
                    $eve_endereco = $this->input->post('eve_endereco');
                    $eve_palavra_chave = $this->input->post('eve_palavra_chave');
                    $eve_tipo_id = $this->input->post('eve_tipo_id');
                    $eve_num_pessoa_atendida = $this->input->post('eve_num_pessoa_atendida');
                    $resultado = $this->eventos_model->inserir_evento($this->session->usu_id, $id, $eve_titulo, $eve_descricao, $eve_descricao_sem_formatacao, $eve_inicio, $eve_termino, $eve_slug, $eve_local, $eve_endereco, $eve_palavra_chave, $eve_tipo_id, $eve_num_pessoa_atendida, $eve_foto);
                    if($resultado){
                        $avisos[0]['message'] = "Evento inserido com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Houve um problema! Contate o administrador!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->log_model->adicionou_evento($eve_titulo); ////registra no log
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/eventos');
                }

                ////////////exibe o formulario para alteracao
               // $dados['noticia'] = $this->noticias_model->ver_noticia($par);
                $dados['tipos'] = $this->eventos_model->tipos();
                $this->load->view('nucleo/eventos/inserir', $dados);
            }

        }


        if($pag == "alterar_evento"){
            $tp = $this->eventos_model->descobrir_permissao($id, $par, $this->session->usu_id); ///tipo de permissao
            $sis = 2; //// sistema 2 referente a eventos
            if($this->permissao_model->permissao_original_noticia("alt_" . $tp, $id, $sis, $par) ||
               $this->permissao_model->permissao_autoral_noticia("alt_" . $tp, $id, $sis, $par)){
                /////////////faz a alteracao
                if($this->input->post('alterar_evento') != null){
                    $evento = $this->eventos_model->ver_evento($par);
                    $foto = $_FILES['eve_foto'];
                    if(!empty($foto["name"])){ 
                        $this->eventos_model->apaga_foto_evento($par);
                        $eve_foto = $this->painel_model->foto($foto, $this->conf->caminho_upload_eventos_relativo());
                    }else{ 
                        $eve_foto = $evento->eve_foto;
                    }
                    $eve_titulo = $this->input->post('eve_titulo');
                    $eve_descricao = $this->input->post('eve_descricao');
                    $eve_descricao_sem_formatacao = $this->input->post('eve_descricao_sem_formatacao');
                    $eve_inicio = $this->input->post('eve_inicio');
                    $eve_termino = $this->input->post('eve_termino');
                    $eve_slug = $this->input->post('eve_slug');
                    $eve_local = $this->input->post('eve_local');
                    $eve_endereco = $this->input->post('eve_endereco');
                    $eve_palavra_chave = $this->input->post('eve_palavra_chave');
                    $eve_tipo_id = $this->input->post('eve_tipo_id');
                    $eve_num_pessoa_atendida = $this->input->post('eve_num_pessoa_atendida');
                    $resultado = $this->eventos_model->alterar_evento($par, $eve_titulo, $eve_descricao, $eve_descricao_sem_formatacao, $eve_inicio, $eve_termino, $eve_slug, $eve_local, $eve_endereco, $eve_palavra_chave, $eve_tipo_id, $eve_num_pessoa_atendida, $eve_foto);
                    if($resultado){
                        $avisos[0]['message'] = "Evento alterado com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Nada foi alterado!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->log_model->alterou_evento($evento->eve_titulo, $par); ////registra no log
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/eventos');
                }

                ////////////exibe o formulario para alteracao
                $dados['tipos'] = $this->eventos_model->tipos();
                $dados['evento'] = $this->eventos_model->ver_evento($par);
                $dados['autores'] = $this->eventos_model->ver_autor_evento($par);
                $this->load->view('nucleo/eventos/alterar', $dados);
            }

        }


        if($pag == "apagar_evento"){
            $tp = $this->eventos_model->descobrir_permissao($id, $par, $this->session->usu_id); ///tipo de permissao
            $sis = 2; //// sistema 2 referente a eventos
            if($this->permissao_model->permissao_original_noticia("exc_" . $tp, $id, $sis, $par) || 
               $this->permissao_model->permissao_autoral_noticia("exc_" . $tp, $id, $sis, $par)){
                if($this->input->post('apagar_evento') != null){
                    $evento = $this->eventos_model->ver_evento($par);
                    $dados['avisos'] = 1;
                    $resultado = $this->eventos_model->apagar_evento($par);
                    if($resultado){
                        $avisos[0]['message'] = "Notícia apagada com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Houve um problema ao apagar a notícia! Contate o administrador!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->log_model->removeu_evento($evento->eve_titulo, $par); ////registra no log
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/eventos');
                }else{
                    $dados['avisos'] = 0;
                    $dados['evento'] = $this->eventos_model->ver_evento($par);
                }
                
                $this->load->view('nucleo/eventos/apagar', $dados);
            }
        }
        ////////// FIM CRUD ///////////////////////////



        ////////// ALTERACOES /////////////////////////

        /////////////////////////// FOTOS ///////////////////////////////
        if($pag == "fotos_evento"){
            $tp = $this->eventos_model->descobrir_permissao($id, $par, $this->session->usu_id); ///tipo de permissao
            $sis = 2; //// sistema 2 referente a eventos
            if($this->permissao_model->permissao_original_noticia("alt_" . $tp, $id, $sis, $par) || 
               $this->permissao_model->permissao_autoral_noticia("alt_" . $tp, $id, $sis, $par)){
                /////////////faz a alteracao
                $dados['evento'] = $this->eventos_model->ver_evento($par);



                if($this->input->post('inserir_foto') != null){
                    $foto = $_FILES['foto'];
                    if (!empty($foto["name"])) {
                        $nome_imagem = $this->painel_model->foto($foto, $this->conf->caminho_upload_eventos_relativo());
                    }
                    if($nome_imagem != null){
                        
                        $resultado = $this->eventos_model->inserir_foto($par, $nome_imagem); /// insere no banco
                        if($resultado == 1){
                            $this->log_model->adicionou_foto_evento($dados['evento']->eve_titulo, $par);//log
                            $avisos[0]['message'] = "Imagem inserida com sucesso!";
                            $avisos[0]['type'] = "success";
                        }else{
                            $avisos[1]['message'] = "Houve um problema! Contate o administrador!";
                            $avisos[1]['type'] = "danger";
                        }
                        $this->session->set_userdata('avisos', $avisos);
                    }
                    
                }

                if($this->input->post('remover_foto') != null){
                    $foto = $this->input->post('foto');
                    $resultado = $this->eventos_model->remover_foto($foto); ///remove do banco
                    if($resultado == 1){
                        $this->log_model->removeu_foto_evento($dados['evento']->eve_titulo, $par);//log
                        $avisos[0]['message'] = "Imagem removida com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Houve um problema! Contate o administrador!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->session->set_userdata('avisos', $avisos);
                }

                ////////////exibe o formulario para alteracao
                $dados['todos_usuarios'] = $this->eventos_model->retorna_todos_autores_disponiveis($par);
                $dados['fotos'] = $this->eventos_model->ver_fotos($par);
                $dados['autores'] = $this->eventos_model->ver_autor_evento($par);
                $this->load->view('nucleo/eventos/fotos', $dados);
            }

        }



        ////////////////////////////////// AUTORES /////////////////////////////////////////////////////////////
        if($pag == "autores_evento"){
            $tp = $this->eventos_model->descobrir_permissao($id, $par, $this->session->usu_id); ///tipo de permissao
            $sis = 2; //// sistema 2 referente a eventos
            if($this->permissao_model->permissao_original_noticia("alt_" . $tp, $id, $sis, $par) || 
               $this->permissao_model->permissao_autoral_noticia("alt_" . $tp, $id, $sis, $par)){
                /////////////faz a alteracao
                $dados['evento'] = $this->eventos_model->ver_evento($par);

                if($this->input->post('inserir_autor') != null){
                    $autor = $this->input->post('autor');
                    $autor_nome = $this->painel_model->retorna_dados_usuario($autor)->usu_nome;
                    $resultado = $this->eventos_model->inserir_autor($par, $autor);
                    if($resultado == 1){
                        $this->log_model->adicionou_autor_evento($dados['evento']->eve_titulo, $par, $autor, $autor_nome);//log
                        $dados['sucesso'] = "Autor inserido com sucesso!";
                    }else{
                        if($resultado == 0){
                            $dados['erro'] = "Houve um problema! Contate o administrador!";
                        }else{
                            $dados['erro'] = "Autor já existente no evento!";
                        }   
                    }
                }

                if($this->input->post('remover_autor') != null){
                    $autor = $this->input->post('autor');
                    $autor_nome = $this->painel_model->retorna_dados_usuario($autor)->usu_nome;
                    $resultado = $this->eventos_model->remover_autor($par, $autor);
                    if($resultado == 1){
                        $this->log_model->removeu_autor_evento($dados['evento']->eve_titulo, $par, $autor, $autor_nome);//log
                        $dados['sucesso'] = "Autor removido com sucesso!";
                    }else{
                        if($resultado == 0){
                            $dados['erro'] = "Houve um problema! Contate o administrador!";
                        }else{
                            $dados['erro'] = "Autor não pode ser removido pois é autor original!";
                        }   
                    }
                }

                ////////////exibe o formulario para alteracao
                $dados['todos_usuarios'] = $this->eventos_model->retorna_todos_autores_disponiveis($par);
                $dados['autores'] = $this->eventos_model->ver_autor_evento($par);
                $this->load->view('nucleo/eventos/autores', $dados);
            }

        }



        //////////////////////////////// APROVACAO //////////////////////////////////////////////////
        if($pag == "aprovar_evento"){
            if($this->permissao_model->verifica_permissao("apr", $id, 2)){
                $dados['evento'] = $this->eventos_model->ver_evento($par);
                if($this->input->post('aprovar') != null){
                    $resultado = $this->eventos_model->aprovar($par, $id);
                    if($resultado){
                        $this->log_model->adicionou_aprovacao_evento($dados['evento']->eve_titulo, $par);//log
                        $avisos[0]['message'] = "Evento aprovado com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Houve um problema ao aprovar o evento! Contate o administrador!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/eventos');
                }
                
                $this->load->view('nucleo/eventos/aprovar', $dados);
            }
        }


        if($pag == "reprovar_evento"){
            if($this->permissao_model->verifica_permissao("apr", $id, 2)){
                $dados['evento'] = $this->eventos_model->ver_evento($par);
                if($this->input->post('reprovar') != null){
                    $resultado = $this->eventos_model->reprovar($par, $id);
                    if($resultado){
                        $this->log_model->removeu_aprovacao_evento($dados['evento']->eve_titulo, $par);//log
                        $avisos[0]['message'] = "Notícia reprovada com sucesso!";
                        $avisos[0]['type'] = "success";
                    }else{
                        $avisos[1]['message'] = "Houve um problema ao reprovar a notícia! Contate o administrador!";
                        $avisos[1]['type'] = "danger";
                    }
                    $this->session->set_userdata('avisos', $avisos);
                    redirect('painel/nucleo/' . $id . '/eventos');
                }
                
                $this->load->view('nucleo/eventos/reprovar', $dados);
            }
        }






        //////////////////////////////////////// DUPLICACAO ///////////////////////
        if($pag == "duplicacao_evento"){
            $tp = $this->eventos_model->descobrir_permissao($id, $par, $this->session->usu_id); ///tipo de permissao
            $sis = 2; //// sistema 2 referente a eventos
            if($this->permissao_model->permissao_original_noticia("dup_" . $tp, $id, $sis, $par) || 
               $this->permissao_model->permissao_autoral_noticia("dup_" . $tp, $id, $sis, $par)){
                $dados['avisos'] = 0;
                $dados['evento'] = $this->eventos_model->ver_evento($par);
                if($this->input->post('add') != null){
                    $nucleo = $this->input->post('nucleo');
                    $dados['avisos'] = 1;
                    $resultado = $this->eventos_model->add_duplicacao($par, $nucleo);
                    if($resultado == 1){
                        $this->log_model->adicionou_duplicacao_evento($dados['evento']->eve_titulo, $par);//log
                        $dados['sucesso'] = "Evento duplicado com sucesso!";
                    }else{
                        if($resultado == 0){
                            $dados['erro'] = "Houve um problema ao duplicar o evento! Contate o administrador!";
                        }else{
                            $dados['erro'] = "Evento já existente para nucleo escolhido!";
                        }
                    }
                }else{
                    if($this->input->post('rmv') != null){
                        $nucleo = $this->input->post('nucleo');
                        $dados['avisos'] = 1;
                        $resultado = $this->eventos_model->rmv_duplicacao($par, $nucleo);
                        if($resultado == 1){
                            $this->log_model->removeu_duplicacao_evento($dados['evento']->eve_titulo, $par);//log
                            $dados['sucesso'] = "Duplicação removida com sucesso!";
                        }else{
                            if($resultado == 0){
                                $dados['erro'] = "Houve um problema ao remover a duplicação! Contate o administrador!";
                            }else{
                                $dados['erro'] = "Este nucleo não pode ser removido pois é nucleo original!";
                            }
                        }
                    }else{

                    }
                }
                $dados['todos_nucleos_duplicacao'] = $this->eventos_model->retorna_todos_nucleos($par);
                $dados['todos_nucleos'] = $this->eventos_model->retorna_todos_nucleos_disponiveis($par);
                
                $this->load->view('nucleo/eventos/duplicacao', $dados);
            }
        }
        ////////// FIM ALTERACOES /////////////////////





        ///////////////////////////////////////////////////
        ///////////// FIM SISTEMA DE EVENTOS //////////////
        ///////////////////////////////////////////////////










        $this->load->view('footer');
    }

}
