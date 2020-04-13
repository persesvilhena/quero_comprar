<?php
class Admin extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->library('session');
        $this->load->model('conf');
        $this->load->model('logar_model');
        $this->load->model('painel_model');
        $this->load->model('nucleo_model');
        $this->load->model('permissao_model');
        $this->load->model('noticias_model');
        $this->load->model('eventos_model');
        $this->load->model('log_model');
        $this->load->model('adm_model');
        $this->logar_model->protege();
        $this->adm_model->verifica_adm();
    }












    function index(){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $dados['todos_sistemas'] = $this->permissao_model->retorna_todos_sistemas();
        $dados['todos_nucleos'] = $this->permissao_model->retorna_todos_nucleos();
        $dados['todos_usuarios'] = $this->permissao_model->retorna_todos_usuarios();
        $dados['todas_permissoes'] = $this->permissao_model->retorna_todas_permissoes();
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        $this->load->view('adm/home', $dados);
        $this->load->view('footer');
    }









    function permissao(){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $dados['todos_sistemas'] = $this->permissao_model->retorna_todos_sistemas();
        $dados['todos_nucleos'] = $this->permissao_model->retorna_todos_nucleos();
        $dados['todos_usuarios'] = $this->permissao_model->retorna_todos_usuarios();
        $dados['todas_permissoes'] = $this->permissao_model->retorna_todas_permissoes();
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        $this->load->view('adm/permissao', $dados);
        $this->load->view('footer');
    }

    function aplica_permissao(){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['todas_permissoes'] = $this->permissao_model->retorna_todas_permissoes();
        $sistema = $this->input->post("sistema");
        $nucleo = $this->input->post("nucleo");
        $user = $this->input->post("user");
        foreach ($dados['todas_permissoes'] as $n){
            if($this->input->post($n->per_nome)){
                //echo "$sistema, $nucleo, $user, $n->per_id, '1'<br>";
                $this->permissao_model->aplica_permissao($sistema, $nucleo, $user, $n->per_id, '1');
            }else{
                //echo "$sistema, $nucleo, $user, $n->per_id, '0'<br>";
                $this->permissao_model->aplica_permissao($sistema, $nucleo, $user, $n->per_id, '0');
            }
        }
        redirect("admin/permissao");
    }











    function tipo_evento($subpag = null, $par = null){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $dados['todos_sistemas'] = $this->permissao_model->retorna_todos_sistemas();
        $dados['todos_nucleos'] = $this->permissao_model->retorna_todos_nucleos();
        $dados['todos_usuarios'] = $this->permissao_model->retorna_todos_usuarios();
        $dados['todas_permissoes'] = $this->permissao_model->retorna_todas_permissoes();
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        if($subpag == null || $subpag == "home"){
            $dados['tipos'] = $this->adm_model->tipos_eventos();
            $this->load->view('adm/tipo_evento/home', $dados);
        }
        if($subpag == "alterar"){
            $dados['avisos'] = 0;
            $dados['tipo'] = $this->adm_model->ver_tipo($par);
            if($this->input->post('alterar') != null){
                $tit_nome = $this->input->post('tit_nome');
                $dados['avisos'] = 1;
                $resultado = $this->adm_model->alterar_tipo($par, $tit_nome);
                if($resultado == 1){
                    $this->log_model->alterou_tipo_evento($dados['tipo']->tit_nome, $tit_nome, $par);//log
                    $dados['sucesso'] = "Tipo alterado com sucesso!";
                }else{
                    $dados['erro'] = "Houve um problema ao alterar o tipo! Contate o administrador!";
                }
            }
            
            $this->load->view('adm/tipo_evento/alterar', $dados);
        }
        if($subpag == "apagar"){
            $dados['avisos'] = 0;
            $dados['tipo'] = $this->adm_model->ver_tipo($par);
            if($this->input->post('apagar') != null){
                $dados['avisos'] = 1;
                $resultado = $this->adm_model->apagar_tipo($par);
                if($resultado == 1){
                    $this->log_model->apagar_tipo_evento($dados['tipo']->tit_nome, $par);//log
                    $dados['sucesso'] = "Tipo apagado com sucesso!";
                }else{
                    $dados['erro'] = "Houve um problema ao apagar o tipo! Contate o administrador!";
                }
            }
            
            $this->load->view('adm/tipo_evento/apagar', $dados);
        }
        if($subpag == "inserir"){
            $dados['avisos'] = 0;
            if($this->input->post('inserir') != null){
                $tit_nome = $this->input->post('tit_nome');
                $dados['avisos'] = 1;
                $resultado = $this->adm_model->inserir_tipo($tit_nome);
                if($resultado == 1){
                    $this->log_model->inseriu_tipo_evento($tit_nome);//log
                    $dados['sucesso'] = "Tipo inserido com sucesso!";
                }else{
                    $dados['erro'] = "Houve um problema ao inserir o tipo! Contate o administrador!";
                }
            }
            
            $this->load->view('adm/tipo_evento/inserir', $dados);
        }
        $this->load->view('footer');
    }









    function usuarios(){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);

        if($this->input->post('aprovar') != null){
            $usu_id = $this->input->post('usu_id');
            $dados['usuario'] = $this->adm_model->ver_usuario($usu_id);
            $dados['avisos'] = 1;
            $resultado = $this->adm_model->aprovar_usuario($usu_id);
            if($resultado == 1){
                //$this->log_model->aprovou_novo_usuario($dados['usuario']->usu_nome, $usu_id);//log
                $dados['sucesso'] = "Usuario aprovado com sucesso!";
            }else{
                $dados['erro'] = "Houve um problema ao aprovar o usuario! Contate o administrador!";
            }
        }
        if($this->input->post('apagar') != null){
            $usu_id = $this->input->post('usu_id');
            $dados['usuario'] = $this->adm_model->ver_usuario($usu_id);
            $dados['avisos'] = 1;
            $resultado = $this->adm_model->apagar_usuario($usu_id);
            if($resultado == 1){
                //$this->log_model->aprovou_novo_usuario($dados['usuario']->usu_nome, $usu_id);//log
                $dados['sucesso'] = "Usuario apagado com sucesso!";
            }else{
                $dados['erro'] = "Houve um problema ao apagar o usuario! Contate o administrador!";
            }
        }

        $dados['usuarios'] = $this->adm_model->usuarios_na();
        $this->load->view('adm/usuarios/home', $dados);


        $this->load->view('footer');
    }











    function usuarios_ativos(){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);

        if($this->input->post('reprovar') != null){
            $usu_id = $this->input->post('usu_id');
            $dados['usuario'] = $this->adm_model->ver_usuario($usu_id);
            $dados['avisos'] = 1;
            $resultado = $this->adm_model->reprovar_usuario($usu_id);
            if($resultado == 1){
                //$this->log_model->aprovou_novo_usuario($dados['usuario']->usu_nome, $usu_id);//log
                $dados['sucesso'] = "Usuario reprovado com sucesso!";
            }else{
                $dados['erro'] = "Houve um problema ao reprovar o usuario! Contate o administrador!";
            }
        }
        $dados['usuarios'] = $this->adm_model->usuarios_a();
        $this->load->view('adm/usuarios/ativos', $dados);

        $this->load->view('footer');
    }






    function log(){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);
        $dados['logs'] = $this->log_model->vizualizar_log();
        $this->load->view('adm/log', $dados);
        $this->load->view('footer');
    }















    function noticias($pag = null, $par = null){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);


        if($pag == null || $pag == "home"){
            $dados['noticias'] = $this->adm_model->retorna_todas_noticias();
            $this->load->view('adm/noticias/home', $dados);
        }


        if($pag == "sem_autores"){
            $dados['noticias'] = $this->adm_model->retorna_todas_noticias_sem_autores();
            $this->load->view('adm/noticias/sem_autores', $dados);
        }

        if($pag == "sem_nucleos"){
            $dados['noticias'] = $this->adm_model->retorna_todas_noticias_sem_nucleos();
            $this->load->view('adm/noticias/sem_nucleos', $dados);
        }


        if($pag == "ver"){
            $dados['noticia'] = $this->noticias_model->ver_noticia($par);
            $dados['autores'] = $this->noticias_model->ver_autor_noticia($par);
            $this->load->view('adm/noticias/ver', $dados);
        }




        if($pag == "autores"){
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

                if($this->input->post('inserir_autor_original') != null){
                    $autor = $this->input->post('autor');
                    $autor_dados = $this->painel_model->retorna_dados_usuario($autor);
                    $resultado = $this->noticias_model->inserir_autor($par, $autor, 1);
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
                    $resultado = $this->noticias_model->remover_autor($par, $autor, 1);
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
                $this->load->view('adm/noticias/autores', $dados);
            

        }









        if($pag == "nucleos"){
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
            }
            if($this->input->post('duplicar_noticia_original') != null){
                $nucleo = $this->input->post('nucleo');
                $dados['avisos'] = 1;
                $resultado = $this->noticias_model->duplicar_noticia($par, $nucleo, 1);
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
            }
            if($this->input->post('remover_duplicacao') != null){
                $nucleo = $this->input->post('nucleo');
                $dados['avisos'] = 1;
                $resultado = $this->noticias_model->remover_duplicacao($par, $nucleo, 1);
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
            }
            
            $dados['todos_nucleos_duplicacao'] = $this->noticias_model->retorna_todos_nucleos($par);
            $dados['todos_nucleos'] = $this->noticias_model->retorna_todos_nucleos_disponiveis($par);
            
            $this->load->view('adm/noticias/nucleos', $dados);
            
        }

        $this->load->view('footer');
    }































    function eventos($pag = null, $par = null){
        $dados['user'] = $this->painel_model->retorna_dados_usuario($this->session->userdata['usu_id']);
        $dados['nucleos'] = $this->painel_model->retorna_todos_nucleos($this->session->userdata['usu_id']);
        $this->load->view('header');
        $this->load->view('barra_superior', $dados);


        if($pag == null || $pag == "home"){
            $dados['eventos'] = $this->eventos_model->retorna_todos();
            $this->load->view('adm/eventos/home', $dados);
        }


        if($pag == "sem_autores"){
            $dados['eventos'] = $this->eventos_model->retorna_todos_sem_autores();
            $this->load->view('adm/eventos/sem_autores', $dados);
        }

        if($pag == "sem_nucleos"){
            $dados['eventos'] = $this->eventos_model->retorna_todos_sem_nucleos();
            $this->load->view('adm/eventos/sem_nucleos', $dados);
        }


        if($pag == "ver"){
            $dados['evento'] = $this->eventos_model->ver_evento($par);
            $dados['autores'] = $this->eventos_model->ver_autor_evento($par);
            $this->load->view('adm/eventos/ver', $dados);
        }




        if($pag == "autores"){
                /////////////faz a alteracao
                $dados['evento'] = $this->eventos_model->ver_evento($par);

                if($this->input->post('inserir_autor') != null){
                    $autor = $this->input->post('autor');
                    $autor_dados = $this->painel_model->retorna_dados_usuario($autor);
                    $resultado = $this->eventos_model->inserir_autor($par, $autor);
                    $this->log_model->adicionou_autor_evento($dados['evento']->eve_titulo, $par, $autor, $autor_dados->usu_nome); ////registra no log
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

                if($this->input->post('inserir_autor_original') != null){
                    $autor = $this->input->post('autor');
                    $autor_dados = $this->painel_model->retorna_dados_usuario($autor);
                    $resultado = $this->eventos_model->inserir_autor($par, $autor, 1);
                    $this->log_model->adicionou_autor_evento($dados['evento']->eve_titulo, $par, $autor, $autor_dados->usu_nome); ////registra no log
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
                    $resultado = $this->eventos_model->remover_autor($par, $autor, 1);
                    $this->log_model->removeu_autor_evento($dados['evento']->eve_titulo, $par, $autor, $autor_dados->usu_nome); ////registra no log
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
                $dados['todos_usuarios'] = $this->eventos_model->retorna_todos_autores_disponiveis($par);
                
                $dados['autores'] = $this->eventos_model->ver_autor_evento($par);
                $this->load->view('adm/eventos/autores', $dados);
            

        }









        if($pag == "nucleos"){
            $dados['avisos'] = 0;
            $dados['evento'] = $this->eventos_model->ver_evento($par);
            if($this->input->post('duplicar_evento') != null){
                $nucleo = $this->input->post('nucleo');
                $dados['avisos'] = 1;
                $resultado = $this->eventos_model->add_duplicacao($par, $nucleo);
                if($resultado == 1){
                    $this->log_model->adicionou_duplicacao_evento($dados['evento']->eve_titulo, $par); ////registra no log
                    $dados['sucesso'] = "Notícia duplicada com sucesso!";
                }else{
                    if($resultado == 0){
                        $dados['erro'] = "Houve um problema ao duplicar a notícia! Contate o administrador!";
                    }else{
                        $dados['erro'] = "Notícia já existente para nucleo escolhido!";
                    }
                }
            }
            if($this->input->post('duplicar_evento_original') != null){
                $nucleo = $this->input->post('nucleo');
                $dados['avisos'] = 1;
                $resultado = $this->eventos_model->add_duplicacao($par, $nucleo, 1);
                if($resultado == 1){
                    $this->log_model->adicionou_duplicacao_evento($dados['evento']->eve_titulo, $par); ////registra no log
                    $dados['sucesso'] = "Notícia duplicada com sucesso!";
                }else{
                    if($resultado == 0){
                        $dados['erro'] = "Houve um problema ao duplicar a notícia! Contate o administrador!";
                    }else{
                        $dados['erro'] = "Notícia já existente para nucleo escolhido!";
                    }
                }
            }
            if($this->input->post('remover_duplicacao') != null){
                $nucleo = $this->input->post('nucleo');
                $dados['avisos'] = 1;
                $resultado = $this->eventos_model->rmv_duplicacao($par, $nucleo, 1);
                if($resultado == 1){
                    $this->log_model->removeu_duplicacao_evento($dados['evento']->eve_titulo, $par); ////registra no log
                    $dados['sucesso'] = "Duplicação removida com sucesso!";
                }else{
                    if($resultado == 0){
                        $dados['erro'] = "Houve um problema ao remover a duplicação! Contate o administrador!";
                    }else{
                        $dados['erro'] = "Este nucleo não pode ser removido pois é nucleo original!";
                    }
                }
            }
            
            $dados['todos_nucleos_duplicacao'] = $this->eventos_model->retorna_todos_nucleos($par);
            $dados['todos_nucleos'] = $this->eventos_model->retorna_todos_nucleos_disponiveis($par);
            
            $this->load->view('adm/eventos/nucleos', $dados);
            
        }

        $this->load->view('footer');
    }












    function teste(){
        echo json_encode($this->adm_model->usuarios_a());
        //echo json_last_error();
        //$teste = json_decode($teste);
        //echo "<pre>";
        //echo $teste;
        //echo "</pre>";
           // $this->load->view('adm/noticias/home', $dados);
        //$this->adm_model->teste();
        //$this->load->view('adm/teste');
        //$arr = array('a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5);

//echo json_encode($arr);
    }



}
