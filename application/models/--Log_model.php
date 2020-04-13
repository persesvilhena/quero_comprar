<?php

class Log_model extends CI_Model {

    function __construct() {
        // Call the Model constructor
        parent::__construct();
        date_default_timezone_set('America/Sao_Paulo');
        $this->date = date('Y-m-d H:i:s');
        $this->usu_nome = $this->session->userdata['usu_nome'];
        $this->usu_id = $this->session->userdata['usu_id'];

    }

    function log($log_titulo, $log_horario, $log_acao, $log_usuario, $log_descricao){
        //echo $log_titulo . $log_horario . $log_acao . $log_usuario . $log_descricao;
        $data = array(
        'log_titulo' => $log_titulo,
        'log_horario' => $log_horario,
        'log_acao' => $log_acao,
        'log_usuario' => $log_usuario,
        'log_descricao' => $log_descricao
        );
        $this->db->insert('cc_log', $data);
    }

    function vizualizar_log(){
        $this->db->select('*');
        $this->db->from('cc_log');
        $this->db->order_by("log_horario", "desc");
        $this->db->limit(50);

        return $this->db->get()->result();
    }


    ///////////CRUD NOTICIA
    function adicionou_noticia($noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " adicionou uma nova notícia!";
        $log_acao = "add-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, adicionou uma nova notícia com titulo: <b>" . $noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu uma notícia!";
        $log_acao = "rmv-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu uma notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function alterou_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " alterou uma notícia!";
        $log_acao = "alt-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, alterou uma notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    ///////AUTOR NOTICIA
    function adicionou_autor_noticia($noticia, $id_noticia, $id_autor, $autor){
        $log_titulo = "O usuário " . $this->usu_nome . " adicionou um novo autor a notícia!";
        $log_acao = "add-autor-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, adicionou <b>" . $autor . "</b> como autor da notícia com titulo: <b>" . $noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_autor_noticia($noticia, $id_noticia, $id_autor, $autor){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu um autor da notícia!";
        $log_acao = "rmv-autor-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu <b>" . $autor . "</b> como autor da notícia com titulo: <b>" . $noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    /////////DESTAQUE
    function adicionou_destaque_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " adicionou destaque a uma notícia!";
        $log_acao = "add-destaque-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, adicionou destaque a uma notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_destaque_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu o destaque de uma notícia!";
        $log_acao = "rmv-destaque-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu destaque a uma notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    //////////DUPLICACAO
    function adicionou_duplicacao_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " duplicou uma notícia!";
        $log_acao = "add-duplicacao-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, duplicou uma notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_duplicacao_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu a duplicação de uma notícia!";
        $log_acao = "rmv-duplicacao-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu a duplicação da notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    /////APROVACAO
    function adicionou_aprovacao_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " aprovou uma notícia!";
        $log_acao = "add-aprovacao-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, aprovou uma notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_aprovacao_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " reprovou uma notícia!";
        $log_acao = "rmv-aprovacao-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, reprovou uma notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    ///////////FOTOS AUXILIARES
    function adicionou_foto_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " adicionou uma nova foto a uma notícia!";
        $log_acao = "add-foto-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, adicionou uma nova foto a notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_foto_noticia($noticia, $id_noticia){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu uma foto de uma notícia!";
        $log_acao = "rmv-foto-noticia";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu uma foto da notícia com titulo: <b>" . $noticia . "</b>, e id <b>" . $id_noticia . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }
    //////////FIM









    ////////////////EVENTOS
    ////////// CRUD EVENTOS
    function adicionou_evento($evento){
        $log_titulo = "O usuário " . $this->usu_nome . " adicionou um novo evento!";
        $log_acao = "add-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, adicionou uma novo evento com titulo: <b>" . $evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu um evento!";
        $log_acao = "rmv-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu um evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function alterou_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " alterou um evento!";
        $log_acao = "alt-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, alterou um evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    ////////AUTOR EVENTO
    function adicionou_autor_evento($evento, $id_evento, $id_autor, $autor){
        $log_titulo = "O usuário " . $this->usu_nome . " adicionou um novo autor ao evento!";
        $log_acao = "add-autor-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, adicionou <b>" . $autor . "</b> como autor do evento com titulo: <b>" . $evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_autor_evento($evento, $id_evento, $id_autor, $autor){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu um autor do evento!";
        $log_acao = "rmv-autor-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu <b>" . $autor . "</b> como autor do evento com titulo: <b>" . $evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    /////////DESTAQUE EVENTO
    function adicionou_destaque_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " adicionou destaque a um evento!";
        $log_acao = "add-destaque-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, adicionou destaque a um evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_destaque_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu o destaque de um evento!";
        $log_acao = "rmv-destaque-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu destaque a um evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    //////////DUPLICACAO EVENTO
    function adicionou_duplicacao_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " duplicou um evento!";
        $log_acao = "add-duplicacao-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, duplicou um evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_duplicacao_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu a duplicação de um evento!";
        $log_acao = "rmv-duplicacao-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu a duplicação do evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    //////////APROVACAO EVENTO
    function adicionou_aprovacao_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " aprovou um evento!";
        $log_acao = "add-aprovacao-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, aprovou um evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_aprovacao_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " reprovou um evento!";
        $log_acao = "rmv-aprovacao-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, reprovou um evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    //////////// FOTOS AUXILIARES
    function adicionou_foto_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " adicionou uma nova foto a um evento!";
        $log_acao = "add-foto-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, adicionou uma nova foto a um evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }

    function removeu_foto_evento($evento, $id_evento){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu uma foto de um evento!";
        $log_acao = "rmv-foto-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, removeu uma foto do evento com titulo: <b>" . $evento . "</b>, e id <b>" . $id_evento . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }
    ////////FIM



    function alterou_tipo_evento($antigo, $tit_nome, $par){
        $log_titulo = "O usuário " . $this->usu_nome . " alterou um tipo de evento!";
        $log_acao = "alt-tipo-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, alterou um tipo de evento com nome: <b>" . $antigo . "</b> para: <b>" . $tit_nome . "</b>, e id <b>" . $par . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }
    function apagar_tipo_evento($tit_nome, $par){
        $log_titulo = "O usuário " . $this->usu_nome . " removeu um tipo de evento!";
        $log_acao = "rmv-tipo-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, apagou um tipo de evento com nome: <b>" . $tit_nome . "</b>, e id <b>" . $par . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }
    function inseriu_tipo_evento($tit_nome){
        $log_titulo = "O usuário " . $this->usu_nome . " inseriu um tipo de evento!";
        $log_acao = "add-tipo-evento";
        $log_descricao = "O usuario do sistema: <b>" . $this->usu_nome . "</b>, inseriu um tipo de evento com nome: <b>" . $tit_nome . "</b>, as <b>" . $this->conf->data($this->date) . "</b>";
        $this->log($log_titulo, $this->date, $log_acao, $this->usu_id, $log_descricao);
    }
}