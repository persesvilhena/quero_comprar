<?php

class Adm_model extends CI_Model {

    function __construct() {
        // Call the Model constructor
        parent::__construct();
    }

    function verifica_adm(){
        $id_user = $this->session->userdata['usu_id'];
        $this->db->select('*');
        $this->db->from('cc_usuario');
        $this->db->where('usu_id', $id_user);
        $dados_user = $this->db->get()->result()[0];
        if(isset($this->session->userdata['logado'])){
            if($dados_user->usu_adm == 1){
                //echo "ta";
            }else{
                redirect("painel/");
            }
        }else{
            redirect("home/logar/");
        }
    }

    function tipos_eventos(){
        $this->db->select('*');
        $this->db->from('cc_tipo_evento');
        return $this->db->get()->result();
    }

    function ver_tipo($id){
        $this->db->select('*');
        $this->db->from('cc_tipo_evento');
        $this->db->where('tit_id', $id);
        return $this->db->get()->result()[0];
    }

    function alterar_tipo($tit_id, $tit_nome){
        $data = array(
        'tit_nome' => $tit_nome
        );

        $this->db->where('tit_id', $tit_id);
        $this->db->update('cc_tipo_evento', $data);
        return $this->db->affected_rows();
    }

    function apagar_tipo($id){
        $this->db->where('tit_id', $id);
        $this->db->delete('cc_tipo_evento');
        return $this->db->affected_rows();
    }

    function inserir_tipo($tit_nome){
        $data = array(
        'tit_nome' => $tit_nome
        );
        $this->db->insert('cc_tipo_evento', $data);
        
        return $this->db->affected_rows();
    }
    function teste(){
        echo $this->conf->rdata("08/09/2017");
    }



    function usuarios_na(){
        $this->db->select('*');
        $this->db->from('cc_usuario');
        $this->db->where('usu_aprovacao', 0);
        return $this->db->get()->result();
    }
    function usuarios_a(){
        $this->db->select('*');
        $this->db->from('cc_usuario');
        $this->db->where('usu_aprovacao', 1);
        return $this->db->get()->result();
    }
    function ver_usuario($id){
        $this->db->select('*');
        $this->db->from('cc_usuario');
        $this->db->where('usu_id', $id);
        return $this->db->get()->result()[0];
    }
    function aprovar_usuario($id){
        $data = array(
        'usu_aprovacao' => 1
        );
        $this->db->where('usu_id', $id);
        $this->db->update('cc_usuario', $data);
        return $this->db->affected_rows();
    }
    function reprovar_usuario($id){
        $data = array(
        'usu_aprovacao' => 0
        );
        $this->db->where('usu_id', $id);
        $this->db->update('cc_usuario', $data);
        return $this->db->affected_rows();
    }
    function apagar_usuario($id){
        return $this->painel_model->apagar_usuario($id);
    }







    ////////////////////////////////////////////////////////////////
    ////////////// NOTICIAS ////////////////////////////////////////
    ////////////////////////////////////////////////////////////////
    function retorna_autores_noticia($id){
        $this->db->select('usu_nome');
        $this->db->from('cc_autor_noticia');
        $this->db->join('cc_usuario', 'cc_usuario.usu_id = cc_autor_noticia.aut_usuario_id', 'inner');
        $this->db->where('aut_noticia_id', $id);
        return $this->db->get()->result();
    }
    function retorna_nucleos_noticia($id){
        $this->db->select('nuc_nome');
        $this->db->from('cc_noticia_nucleo');
        $this->db->join('cc_nucleo', 'noo_nucleo_id = nuc_id', 'inner');
        $this->db->where('noo_noticia_id', $id);
        return $this->db->get()->result();
    }
    function retorna_todas_noticias(){
        $this->db->select('*');
        $this->db->from('cc_noticia');
        $resultado = $this->db->get()->result();
        foreach ($resultado as $n){
            $n->autores = $this->retorna_autores_noticia($n->not_id);
        }
        foreach ($resultado as $n){
            $n->nucleos = $this->retorna_nucleos_noticia($n->not_id);
        }
        return $resultado;
    }
/*    SELECT *
FROM cc_noticia
LEFT JOIN cc_noticia_nucleo ON cc_noticia.not_id = cc_noticia_nucleo.noo_noticia_id
WHERE cc_noticia_nucleo.noo_noticia_id IS NULL*/
    function retorna_todas_noticias_sem_nucleos(){
        $this->db->select('*');
        $this->db->from('cc_noticia');
        $this->db->join('cc_noticia_nucleo', 'not_id = noo_noticia_id', 'left');
        $this->db->where('noo_noticia_id IS NULL');
        /*$sql = "SELECT *
            FROM cc_noticia
            LEFT JOIN cc_noticia_nucleo ON not_id = noo_noticia_id
            WHERE noo_noticia_id IS NULL;
        ";*/
        $resultado = $this->db->get()->result();

        foreach ($resultado as $n){
            $n->autores = $this->retorna_autores_noticia($n->not_id);
        }
        foreach ($resultado as $n){
            $n->nucleos = $this->retorna_nucleos_noticia($n->not_id);
        }

        /*echo "<pre>";
        var_dump($resultado);
        echo "</pre>";*/
        return $resultado;
    }

    function retorna_todas_noticias_sem_autores(){
        $this->db->select('*');
        $this->db->from('cc_noticia');
        $this->db->join('cc_autor_noticia', 'not_id =   aut_noticia_id', 'left');
        $this->db->where('aut_noticia_id IS NULL');

        $resultado = $this->db->get()->result();

        foreach ($resultado as $n){
            $n->autores = $this->retorna_autores_noticia($n->not_id);
        }
        foreach ($resultado as $n){
            $n->nucleos = $this->retorna_nucleos_noticia($n->not_id);
        }

        return $resultado;
    }






    /*
    function ver_autor_noticia($id){
        $this->db->select('*');
        $this->db->from('cc_autor_noticia');
        $this->db->join('cc_usuario', 'cc_usuario.usu_id = cc_autor_noticia.aut_usuario_id', 'inner');
        $this->db->where('aut_noticia_id', $id);
        return $this->db->get()->result();
    }
    function ver_fotos_noticia($id){
        $this->db->select('*');
        $this->db->from('cc_foto_noticia_auxiliar');
        $this->db->where('for_noticia', $id);
        return $this->db->get()->result();
    }

    function verifica_autor($noticia, $user){
        $this->db->select('*');
        $this->db->from('cc_autor_noticia');
        $this->db->where('aut_noticia_id', $noticia);
        $this->db->where('aut_usuario_id', $user);
        return (bool)($this->db->get()->result());
    }
    function descobrir_permissao($nucleo, $noticia, $user){
        if($this->verifica_autor($noticia, $user) == 1){
            $this->db->select('*');
            $this->db->from('cc_noticia_nucleo');
            $this->db->where('noo_noticia_id', $noticia);
            $this->db->where('noo_nucleo_id', $nucleo);
            $this->db->where('noo_aprovacao', 1);
            if((bool)($this->db->get()->result())){
                return "sua_na";
            }else{
                return "sua_a";
            }
        }else{
            $this->db->select('*');
            $this->db->from('cc_noticia_nucleo');
            $this->db->where('noo_noticia_id', $noticia);
            $this->db->where('noo_nucleo_id', $nucleo);
            $this->db->where('noo_aprovacao', 1);
            if((bool)($this->db->get()->result())){
                return "ger_na";
            }else{
                return "ger_a";
            }
        }
    }
    function inserir_noticia($id_usuario, $id_nucleo, $not_titulo, $not_subtitulo, $not_conteudo, $not_conteudo_sem_formatacao, $not_foto, $not_criado, $not_revisado, $not_exibicao, $not_slug, $not_palavra_chave){

        $noticia = array(
        'not_titulo' => $not_titulo,
        'not_subtitulo' => $not_subtitulo,
        'not_conteudo' => $not_conteudo,
        'not_conteudo_sem_formatacao' => $not_conteudo_sem_formatacao,
        'not_foto' => $not_foto,
        'not_criado' => $not_criado,
        'not_revisado' => $not_revisado,
        'not_exibicao' => $not_exibicao,
        'not_slug' => $not_slug,
        'not_palavra_chave' => $not_palavra_chave
        );
        $this->db->insert('cc_noticia', $noticia);



        $this->db->where('not_slug', $not_slug);
        $id_noticia = $this->db->get('cc_noticia')->result()[0]->not_id;


        $noticia_nucleo = array(
        'noo_noticia_id' => $id_noticia,
        'noo_nucleo_id' => $id_nucleo,
        'noo_destaque' => 0,
        'noo_visita' => 0,
        'noo_aprovacao' => 0,
        'noo_original' => 1
        );
        $this->db->insert('cc_noticia_nucleo', $noticia_nucleo);

        $autor_noticia = array(
        'aut_noticia_id' => $id_noticia,
        'aut_usuario_id' => $id_usuario,
        'aut_original' => 1
        );
        $this->db->insert('cc_autor_noticia', $autor_noticia);
        
        return $this->db->affected_rows();
    }
    function valida_slug($slug){
        $this->db->select('*');
        $this->db->from('cc_noticia');
        $this->db->where('not_slug', $slug);
        return (bool)($this->db->get()->result());
    }
    function criar_slug($titulo){
        $slug_temp = strtolower($titulo);
        $slug_temp = str_replace(" ", "-", $slug_temp);
        $slug_temp = str_replace("/", "-", $slug_temp);
        $slug_temp = str_replace("\\", "-", $slug_temp);
        $slug = $slug_temp;
        $x=0;
        while($this->valida_slug($slug) == 1){
            $x++;
            $slug = $slug_temp . "-" . $x;
        }
        return $slug;
    }


    function alterar_noticia($not_id, $not_titulo, $not_subtitulo, $not_conteudo, $not_conteudo_sem_formatacao, $not_foto, $not_criado, $not_revisado, $not_exibicao, $not_slug, $not_palavra_chave){

        $data = array(
        'not_titulo' => $not_titulo,
        'not_subtitulo' => $not_subtitulo,
        'not_conteudo' => $not_conteudo,
        'not_conteudo_sem_formatacao' => $not_conteudo_sem_formatacao,
        'not_foto' => $not_foto,
        'not_criado' => $not_criado,
        'not_revisado' => $not_revisado,
        'not_exibicao' => $not_exibicao,
        'not_slug' => $not_slug,
        'not_palavra_chave' => $not_palavra_chave
        );

        $this->db->where('not_id', $not_id);
        $this->db->update('cc_noticia', $data);
        return $this->db->affected_rows();
    }

    function verifica_duplicacao($id_noticia, $id_nucleo){
        $this->db->select('*');
        $this->db->from('cc_noticia_nucleo');
        $this->db->where('noo_noticia_id', $id_noticia);
        $this->db->where('noo_nucleo_id', $id_nucleo);
        return (bool)($this->db->get()->result());
    }


    function duplicar_noticia($id_noticia, $id_nucleo){
        if(!$this->verifica_duplicacao($id_noticia, $id_nucleo)){
            $noticia_nucleo = array(
            'noo_noticia_id' => $id_noticia,
            'noo_nucleo_id' => $id_nucleo,
            'noo_destaque' => 0,
            'noo_visita' => 0,
            'noo_aprovacao' => 0,
            'noo_original' => 0
            );
            $this->db->insert('cc_noticia_nucleo', $noticia_nucleo);
            return $this->db->affected_rows();
        }else{
            return 2;
        }
    }


    function apagar_noticia($not_id){
        
        $this->apaga_foto_noticia($not_id);
        $this->apaga_todas_fotos_auxiliares($not_id);

        $this->db->where('aut_noticia_id', $not_id);
        $this->db->delete('cc_autor_noticia');

        $this->db->where('noo_noticia_id', $not_id);
        $this->db->delete('cc_noticia_nucleo');

        $this->db->where('not_id', $not_id);
        $this->db->delete('cc_noticia');
        return $this->db->affected_rows();
    }

    function retorna_todos_nucleos($id){
        $this->db->select('*');
        $this->db->from('cc_noticia_nucleo');
        $this->db->join('cc_nucleo', 'cc_noticia_nucleo.noo_nucleo_id = cc_nucleo.nuc_id', 'inner');
        $this->db->where('cc_noticia_nucleo.noo_noticia_id', $id);
        return $this->db->get()->result();
    }
    function retorna_todos_nucleos_disponiveis($id){
        $sql = "
            SELECT * FROM cc_nucleo 
            WHERE NOT nuc_id 
            IN (
                SELECT noo_nucleo_id 
                FROM `cc_noticia` 
                INNER JOIN cc_noticia_nucleo ON not_id = noo_noticia_id 
                WHERE not_id = '$id'
            )
        ";
        return $this->db->query($sql)->result();
    }
    function retorna_todos_autores_disponiveis($id){
        $sql = "
            SELECT * FROM cc_usuario 
            WHERE NOT usu_id 
            IN (
                SELECT aut_usuario_id 
                FROM `cc_noticia` 
                INNER JOIN cc_autor_noticia ON not_id = aut_noticia_id 
                WHERE not_id = '$id'
            )
        ";
        return $this->db->query($sql)->result();
    }
    function verifica_nucleo_original($id_noticia, $id_nucleo){
        $this->db->select('*');
        $this->db->from('cc_noticia_nucleo');
        $this->db->where('cc_noticia_nucleo.noo_noticia_id', $id_noticia);
        $this->db->where('cc_noticia_nucleo.noo_nucleo_id', $id_nucleo);
        $this->db->where('cc_noticia_nucleo.noo_original', 1);
        return (bool)($this->db->get()->result());
    }

    function remover_duplicacao($id_noticia, $id_nucleo){
        //var_dump($this->verifica_nucleo_original($id_noticia, $id_nucleo));
        if(!$this->verifica_nucleo_original($id_noticia, $id_nucleo)){
            $this->db->where('noo_noticia_id', $id_noticia);
            $this->db->where('noo_nucleo_id', $id_nucleo);
            $this->db->delete('cc_noticia_nucleo');
            return $this->db->affected_rows();
        }else{
            return 2;
        }
    }


    function verifica_autor_original($id_noticia, $id_autor){
        $this->db->select('*');
        $this->db->from('cc_autor_noticia');
        $this->db->where('aut_noticia_id', $id_noticia);
        $this->db->where('aut_usuario_id', $id_autor);
        $this->db->where('aut_original', 1);
        return (bool)($this->db->get()->result());
    }

    function inserir_autor($id_noticia, $id_autor){
        if(!$this->verifica_autor($id_noticia, $id_autor)){
            $data = array(
            'aut_noticia_id' => $id_noticia,
            'aut_usuario_id' => $id_autor,
            'aut_original' => 0
            );
            $this->db->insert('cc_autor_noticia', $data);
            return $this->db->affected_rows();
        }else{
            return 2;
        }
    }


    function remover_autor($id_noticia, $id_autor){
        if(!$this->verifica_autor_original($id_noticia, $id_autor)){
            $this->db->where('aut_noticia_id', $id_noticia);
            $this->db->where('aut_usuario_id', $id_autor);
            $this->db->delete('cc_autor_noticia');
            return $this->db->affected_rows();
        }else{
            return 2;
        }
    }



/////////////fotos auxiliares
    function inserir_foto($id_noticia, $foto){
        $data = array(
        'for_caminho' => $foto,
        'for_noticia' => $id_noticia
        );
        $this->db->insert('cc_foto_noticia_auxiliar', $data);
        return $this->db->affected_rows();
    }
    function remover_foto($id){
        $this->db->select('*');
        $this->db->from('cc_foto_noticia_auxiliar');
        $this->db->where('for_id', $id);
        $foto = $this->db->get()->result()[0]->for_caminho;
        unlink($this->conf->caminho_upload_noticias_relativo() . $foto ."");
        $this->db->where('for_id', $id);
        $this->db->delete('cc_foto_noticia_auxiliar');
        return $this->db->affected_rows();
    }
    function apaga_todas_fotos_auxiliares($not_id){
        $this->db->select('*');
        $this->db->from('cc_foto_noticia_auxiliar');
        $this->db->where('for_noticia', $not_id);
        $todas_fotos = $this->db->get()->result();
        foreach ($todas_fotos as $tf) {
            $this->remover_foto($tf->for_id);
        }
    }
/////////////////fim fotos auxiliares


    function apaga_foto_noticia($not_id){
        $this->db->select('*');
        $this->db->from('cc_noticia');
        $this->db->where('cc_noticia.not_id', $not_id);
        $foto = $this->db->get()->result()[0]->not_foto;
        if(unlink($this->conf->caminho_upload_noticias_relativo() . $foto ."")){
            return true;
        }else{
            return false;
        }

    }




////////////aprovacao noticia
    function aprovar_noticia($id_noticia, $id_nucleo){
        $data = array(
        'noo_aprovacao' => 1
        );
        $this->db->where('noo_noticia_id', $id_noticia);
        $this->db->where('noo_nucleo_id', $id_nucleo);
        $this->db->update('cc_noticia_nucleo', $data);
        return $this->db->affected_rows();
    }
    function reprovar_noticia($id_noticia, $id_nucleo){
        $data = array(
        'noo_aprovacao' => 0
        );
        $this->db->where('noo_noticia_id', $id_noticia);
        $this->db->where('noo_nucleo_id', $id_nucleo);
        $this->db->update('cc_noticia_nucleo', $data);
        return $this->db->affected_rows();
    }
/////////////fim aprovacao noticia

    function destacar_noticia($id_noticia, $id_nucleo){
        $data = array(
        'noo_destaque' => 1
        );
        $this->db->where('noo_noticia_id', $id_noticia);
        $this->db->where('noo_nucleo_id', $id_nucleo);
        $this->db->update('cc_noticia_nucleo', $data);
        return $this->db->affected_rows();
    }

    function remover_destaque($id_noticia, $id_nucleo){
        $data = array(
        'noo_destaque' => 0
        );
        $this->db->where('noo_noticia_id', $id_noticia);
        $this->db->where('noo_nucleo_id', $id_nucleo);
        $this->db->update('cc_noticia_nucleo', $data);
        return $this->db->affected_rows();
    }
/*
    function principal($qtd = 0, $inicio = 0) {
        if ($qtd > 0)
            $this->db->limit($qtd, $inicio);
        $this->db->order_by("not_criado", "desc");
        return $this->db->get('cc_noticia')->result();
    }

    function ver($slug_noticias) {
        $this->db->select('*');
        $this->db->from('cc_noticia');
        $this->db->where('not_slug', $slug_noticias);
        return $this->db->get()->result();
    }

    function retorna_fotos_auxiliares($noticia) {
        $this->db->select('*');
        $this->db->from('cc_foto_noticia_auxiliar');
        $this->db->where('for_noticia', $noticia);
        return $this->db->get()->result();
    }
    function similares($palavras_chave, $id) {
        $pcs = explode(' ', $palavras_chave);
        $this->db->like('not_palavra_chave', $pcs[0]);
        foreach ($pcs as $pc):
            $this->db->or_like('not_palavra_chave', $pc);
        endforeach;
        $this->db->where('not_id !=', "$id");
        $this->db->order_by("not_criado", "desc");
        return $this->db->get('cc_noticia', 3)->result();
    }
    function ultimas() {
        $this->db->order_by("not_criado", "desc");
        $this->db->order_by("not_revisado", "desc");
        return $this->db->get('cc_noticia', 3)->result();
    }
    function mais_visitadas() {
        $this->db->order_by("not_visita", "desc");
        return $this->db->get('cc_noticia', 3)->result();
    }
/*
    function total_registros() {
        return $this->db->get('cc_noticia')->num_rows();
    }

    

    function atualizar_visitas($id, $dados) {
        $this->db->where('not_id', $id);
        $this->db->update('cc_noticia', $dados);
    }

    

    function not_antprox() {
//        $this->db->where('not_slug', $slug_noticias);
        $this->db->order_by("not_criado", "desc");
        return $this->db->get('cc_noticia', 20)->result();
    }

    

    function ordenar($filtro, $qtd = 0, $inicio = 0) {
        switch ($filtro) {
            case "titulo-asc":
                $order = "not_titulo";
                $asc_desc = "asc";
                break;
            case "titulo-des":
                $order = "not_titulo";
                $asc_desc = "desc";
                break;
            case "data-rec":
                $order = "not_criado";
                $asc_desc = "desc";
                break;
            case "data-ant":
                $order = "not_criado";
                $asc_desc = "asc";
                break;
        }
        if ($qtd > 0)
            $this->db->limit($qtd, $inicio);
        $this->db->order_by("$order", "$asc_desc");
        return $this->db->get('cc_noticias')->result();
    }

    function pesquisar($busca, $filtro) {
        //Paginação foi removida por incompatibilidade, deve ser revista
        switch ($filtro) {
            case "all":
                $this->db->like('not_titulo', $busca);
                $this->db->or_like('not_conteudo', $busca);
                $this->db->or_like('not_palavraschave', $busca);
                $this->db->order_by("not_criado", "desc");
//                if ($qtd > 0)
//                    $this->db->limit($qtd, $inicio);
                $dados = $this->db->get('cc_noticias')->result();
                break;
            case "not_titulo":
                $this->db->like('not_titulo', $busca);
                $this->db->order_by("not_criado", "desc");
//                if ($qtd > 0)
//                    $this->db->limit($qtd, $inicio);
                $dados = $this->db->get('cc_noticias')->result();
                break;
            case "not_conteudo":
                $this->db->like('not_conteudo', $busca);
                $this->db->order_by("not_criado", "desc");
//                if ($qtd > 0)
//                    $this->db->limit($qtd, $inicio);
                $dados = $this->db->get('cc_noticias')->result();
                break;
            case "not_palavraschave":
                $this->db->like('not_palavraschave', $busca);
                $this->db->order_by("not_criado", "desc");
//                if ($qtd > 0)
//                    $this->db->limit($qtd, $inicio);
                $dados = $this->db->get('cc_noticias')->result();
                break;
            default:
                $this->db->order_by("not_criado", "desc");
                $dados = $this->db->get('cc_noticias')->result();
                break;
        }
        return $dados;
    }

    
*/
}
