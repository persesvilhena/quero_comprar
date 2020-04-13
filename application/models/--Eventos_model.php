<?php

class Eventos_model extends CI_Model {

    function __construct() {
        // Call the Model constructor
        parent::__construct();
    }

    function retorna_todos_eventos_na($id){
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->join('cc_evento_nucleo', 'nuc_id = evl_nucleo_id', 'inner');
        $this->db->join('cc_evento', 'eve_id = evl_evento_id', 'inner');
        $this->db->where('cc_nucleo.nuc_id', $id);
        $this->db->where('evl_aprovacao', 0);
        return $this->db->get()->result();
    }
    function retorna_todos_eventos_a($id){
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->join('cc_evento_nucleo', 'nuc_id = evl_nucleo_id', 'inner');
        $this->db->join('cc_evento', 'eve_id = evl_evento_id', 'inner');
        $this->db->where('cc_nucleo.nuc_id', $id);
        $this->db->where('evl_aprovacao', 1);
        return $this->db->get()->result();
    }

    function retorna_todos_eventos_suas_na($id){
        $id_user = $this->session->userdata['usu_id'];
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->join('cc_evento_nucleo', 'nuc_id = evl_nucleo_id', 'inner');
        $this->db->join('cc_evento', 'eve_id = evl_evento_id', 'inner');
        $this->db->join('cc_autor_evento', 'auo_evento_id = eve_id', 'inner');
        $this->db->where('nuc_id', $id);
        $this->db->where('auo_usuario_id', $id_user);
        $this->db->where('evl_aprovacao', 0);
        return $this->db->get()->result();
    }

    function retorna_todos_eventos_suas_a($id){
        $id_user = $this->session->userdata['usu_id'];
        $this->db->select('*');
        $this->db->from('cc_nucleo');
        $this->db->join('cc_evento_nucleo', 'nuc_id = evl_nucleo_id', 'inner');
        $this->db->join('cc_evento', 'eve_id = evl_evento_id', 'inner');
        $this->db->join('cc_autor_evento', 'auo_evento_id = eve_id', 'inner');
        $this->db->where('nuc_id', $id);
        $this->db->where('auo_usuario_id', $id_user);
        $this->db->where('evl_aprovacao', 1);
        return $this->db->get()->result();
    }

    function retorna_autores($id){
        $this->db->select('usu_nome');
        $this->db->from('cc_autor_evento');
        $this->db->join('cc_usuario', 'cc_usuario.usu_id = cc_autor_evento.auo_usuario_id', 'inner');
        $this->db->where('auo_evento_id', $id);
        return $this->db->get()->result();
    }

    function retorna_nucleos($id){
        $this->db->select('nuc_nome');
        $this->db->from('cc_evento_nucleo');
        $this->db->join('cc_nucleo', 'evl_nucleo_id = nuc_id', 'inner');
        $this->db->where('evl_evento_id', $id);
        return $this->db->get()->result();
    }

    function retorna_todos(){
        $this->db->select('*');
        $this->db->from('cc_evento');
        $resultado = $this->db->get()->result();
        foreach ($resultado as $n){
            $n->autores = $this->retorna_autores($n->eve_id);
        }
        foreach ($resultado as $n){
            $n->nucleos = $this->retorna_nucleos($n->eve_id);
        }
        return $resultado;
    }

    function retorna_todos_sem_nucleos(){
        $this->db->select('*');
        $this->db->from('cc_evento');
        $this->db->join('cc_evento_nucleo', 'eve_id = evl_evento_id', 'left');
        $this->db->where('evl_evento_id IS NULL');
        $resultado = $this->db->get()->result();

        foreach ($resultado as $n){
            $n->autores = $this->retorna_autores($n->eve_id);
        }
        foreach ($resultado as $n){
            $n->nucleos = $this->retorna_nucleos($n->eve_id);
        }
        return $resultado;
    }

    function retorna_todos_sem_autores(){
        $this->db->select('*');
        $this->db->from('cc_evento');
        $this->db->join('cc_autor_evento', 'eve_id = auo_evento_id', 'left');
        $this->db->where('auo_evento_id IS NULL');

        $resultado = $this->db->get()->result();

        foreach ($resultado as $n){
            $n->autores = $this->retorna_autores($n->eve_id);
        }
        foreach ($resultado as $n){
            $n->nucleos = $this->retorna_nucleos($n->eve_id);
        }

        return $resultado;
    }




    function tipos(){
        $this->db->select('*');
        $this->db->from('cc_tipo_evento');
        return $this->db->get()->result();
    }

    function ver_evento($id){
        $this->db->select('*');
        $this->db->from('cc_evento');
        $this->db->join('cc_tipo_evento', 'eve_tipo_id = tit_id', 'inner');
        $this->db->where('eve_id', $id);
        return $this->db->get()->result()[0];
    }
    function ver_autor_evento($id){
        $this->db->select('*');
        $this->db->from('cc_autor_evento');
        $this->db->join('cc_usuario', 'usu_id = auo_usuario_id', 'inner');
        $this->db->where('auo_evento_id', $id);
        return $this->db->get()->result();
    }
    function ver_fotos($id){
        $this->db->select('*');
        $this->db->from('cc_foto_evento_auxiliar');
        $this->db->where('fot_evento', $id);
        return $this->db->get()->result();
    }

    function verifica_autor($evento, $user){
        $this->db->select('*');
        $this->db->from('cc_autor_evento');
        $this->db->where('auo_evento_id', $evento);
        $this->db->where('auo_usuario_id', $user);
        return (bool)($this->db->get()->result());
    }
    function descobrir_permissao($nucleo, $evento, $user){
        if($this->verifica_autor($evento, $user) == 1){
            $this->db->select('*');
            $this->db->from('cc_evento_nucleo');
            $this->db->where('evl_evento_id', $evento);
            $this->db->where('evl_nucleo_id', $nucleo);
            $this->db->where('evl_aprovacao', 1);
            if((bool)($this->db->get()->result())){
                return "sua_na";
            }else{
                return "sua_a";
            }
        }else{
            $this->db->select('*');
            $this->db->from('cc_evento_nucleo');
            $this->db->where('evl_evento_id', $evento);
            $this->db->where('evl_nucleo_id', $nucleo);
            $this->db->where('evl_aprovacao', 1);
            if((bool)($this->db->get()->result())){
                return "ger_na";
            }else{
                return "ger_a";
            }
        }
    }

    /////////////// CRUD ////////////////
    function inserir_evento($id_usuario, $id_nucleo, $eve_titulo, $eve_descricao, $eve_descricao_sem_formatacao, $eve_inicio, $eve_termino, $eve_slug, $eve_local, $eve_endereco, $eve_palavra_chave, $eve_tipo_id, $eve_num_pessoa_atendida, $eve_foto){

        $data = array(
        'eve_titulo' => $eve_titulo,
        'eve_descricao' => $eve_descricao,
        'eve_descricao_sem_formatacao' => $eve_descricao_sem_formatacao,
        'eve_inicio' => $this->conf->rdata($eve_inicio),
        'eve_termino' => $this->conf->rdata($eve_termino),
        'eve_slug' => $eve_slug,
        'eve_local' => $eve_local,
        'eve_endereco' => $eve_endereco,
        'eve_palavra_chave' => $eve_palavra_chave,
        'eve_tipo_id' => $eve_tipo_id,
        'eve_num_pessoa_atendida' => $eve_num_pessoa_atendida,
        'eve_foto' => $eve_foto
        );
        $this->db->insert('cc_evento', $data);



        $this->db->where('eve_slug', $eve_slug);
        $id_evento = $this->db->get('cc_evento')->result()[0]->eve_id;


        $evento_nucleo = array(
        'evl_evento_id' => $id_evento,
        'evl_nucleo_id' => $id_nucleo,
        'evl_destaque' => 0,
        'evl_visita' => 0,
        'evl_aprovacao' => 0,
        'evl_original' => 1
        );
        $this->db->insert('cc_evento_nucleo', $evento_nucleo);

        $autor_evento = array(
        'auo_evento_id' => $id_evento,
        'auo_usuario_id' => $id_usuario,
        'auo_original' => 1
        );
        $this->db->insert('cc_autor_evento', $autor_evento);
        
        return $this->db->affected_rows();
    }
    function valida_slug($slug){
        $this->db->select('*');
        $this->db->from('cc_evento');
        $this->db->where('eve_slug', $slug);
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


    function alterar_evento($eve_id, $eve_titulo, $eve_descricao, $eve_descricao_sem_formatacao, $eve_inicio, $eve_termino, $eve_slug, $eve_local, $eve_endereco, $eve_palavra_chave, $eve_tipo_id, $eve_num_pessoa_atendida, $eve_foto){

        $data = array(
        'eve_titulo' => $eve_titulo,
        'eve_descricao' => $eve_descricao,
        'eve_descricao_sem_formatacao' => $eve_descricao_sem_formatacao,
        'eve_inicio' => $this->conf->rdata($eve_inicio),
        'eve_termino' => $this->conf->rdata($eve_termino),
        'eve_slug' => $eve_slug,
        'eve_local' => $eve_local,
        'eve_endereco' => $eve_endereco,
        'eve_palavra_chave' => $eve_palavra_chave,
        'eve_tipo_id' => $eve_tipo_id,
        'eve_num_pessoa_atendida' => $eve_num_pessoa_atendida,
        'eve_foto' => $eve_foto
        );

        $this->db->where('eve_id', $eve_id);
        $this->db->update('cc_evento', $data);
        return $this->db->affected_rows();
    }

    function apagar_evento($id){
        
        $this->apaga_foto_evento($id);
        $this->apaga_todas_fotos_auxiliares($id);

        $this->db->where('auo_evento_id', $id);
        $this->db->delete('cc_autor_evento');

        $this->db->where('evl_evento_id', $id);
        $this->db->delete('cc_evento_nucleo');

        $this->db->where('eve_id', $id);
        $this->db->delete('cc_evento');
        return $this->db->affected_rows();
    }


    ////////////////// DUPLICACAO /////////////////////////////////
    function verifica_duplicacao($id, $id_nucleo){
        $this->db->select('*');
        $this->db->from('cc_evento_nucleo');
        $this->db->where('evl_evento_id', $id);
        $this->db->where('evl_nucleo_id', $id_nucleo);
        return (bool)($this->db->get()->result());
    }


    function add_duplicacao($id, $id_nucleo, $original = null){
        if($original == null){
            if(!$this->verifica_duplicacao($id, $id_nucleo)){
                $data = array(
                'evl_evento_id' => $id,
                'evl_nucleo_id' => $id_nucleo,
                'evl_destaque' => 0,
                'evl_visita' => 0,
                'evl_aprovacao' => 0,
                'evl_original' => 0
                );
                $this->db->insert('cc_evento_nucleo', $data);
                return $this->db->affected_rows();
            }else{
                return 2;
            }
        }else{
            if(!$this->verifica_duplicacao($id, $id_nucleo)){
                $data = array(
                'evl_evento_id' => $id,
                'evl_nucleo_id' => $id_nucleo,
                'evl_destaque' => 0,
                'evl_visita' => 0,
                'evl_aprovacao' => 0,
                'evl_original' => 1
                );
                $this->db->insert('cc_evento_nucleo', $data);
                return $this->db->affected_rows();
            }else{
                return 2;
            }
        }
    }

    function rmv_duplicacao($id, $id_nucleo, $forcar = null){
        if($forcar == null){
            if(!$this->verifica_nucleo_original($id, $id_nucleo)){
                $this->db->where('evl_evento_id', $id);
                $this->db->where('evl_nucleo_id', $id_nucleo);
                $this->db->delete('cc_evento_nucleo');
                return $this->db->affected_rows();
            }else{
                return 2;
            }
        }else{
            $this->db->where('evl_evento_id', $id);
            $this->db->where('evl_nucleo_id', $id_nucleo);
            $this->db->delete('cc_evento_nucleo');
            return $this->db->affected_rows();
        }
    }


    

    function retorna_todos_nucleos($id){
        $this->db->select('*');
        $this->db->from('cc_evento_nucleo');
        $this->db->join('cc_nucleo', 'evl_nucleo_id = nuc_id', 'inner');
        $this->db->where('evl_evento_id', $id);
        return $this->db->get()->result();
    }
    function retorna_todos_nucleos_disponiveis($id){
        $sql = "
            SELECT * FROM cc_nucleo 
            WHERE NOT nuc_id 
            IN (
                SELECT evl_nucleo_id 
                FROM `cc_evento` 
                INNER JOIN cc_evento_nucleo ON eve_id = evl_evento_id
                WHERE eve_id = '$id'
            )
        ";
        return $this->db->query($sql)->result();
    }
    function retorna_todos_autores_disponiveis($id){
        $sql = "
            SELECT * FROM cc_usuario 
            WHERE NOT usu_id 
            IN (
                SELECT auo_usuario_id 
                FROM `cc_evento` 
                INNER JOIN cc_autor_evento ON eve_id = auo_evento_id 
                WHERE eve_id = '$id'
            )
        ";
        return $this->db->query($sql)->result();
    }
    function verifica_nucleo_original($id, $id_nucleo){
        $this->db->select('*');
        $this->db->from('cc_evento_nucleo');
        $this->db->where('evl_evento_id', $id);
        $this->db->where('evl_nucleo_id', $id_nucleo);
        $this->db->where('evl_original', 1);
        return (bool)($this->db->get()->result());
    }




    function verifica_autor_original($id, $id_autor){
        $this->db->select('*');
        $this->db->from('cc_autor_evento');
        $this->db->where('auo_evento_id', $id);
        $this->db->where('auo_usuario_id', $id_autor);
        $this->db->where('auo_original', 1);
        return (bool)($this->db->get()->result());
    }



    ///////////////autores
    function inserir_autor($id, $id_autor, $original = null){
        if($original == null){
            if(!$this->verifica_autor($id, $id_autor)){
                $data = array(
                'auo_evento_id' => $id,
                'auo_usuario_id' => $id_autor,
                'auo_original' => 0
                );
                $this->db->insert('cc_autor_evento', $data);
                return $this->db->affected_rows();
            }else{
                return 2;
            }
        }else{
            if(!$this->verifica_autor($id, $id_autor)){
                $data = array(
                'auo_evento_id' => $id,
                'auo_usuario_id' => $id_autor,
                'auo_original' => 1
                );
                $this->db->insert('cc_autor_evento', $data);
                return $this->db->affected_rows();
            }else{
                return 2;
            }
        }
    }

    function remover_autor($id, $id_autor, $forcar = null){
        if($forcar == null){
            if(!$this->verifica_autor_original($id, $id_autor)){
                $this->db->where('auo_evento_id', $id);
                $this->db->where('auo_usuario_id', $id_autor);
                $this->db->delete('cc_autor_evento');
                return $this->db->affected_rows();
            }else{
                return 2;
            }
        }else{
            $this->db->where('auo_evento_id', $id);
            $this->db->where('auo_usuario_id', $id_autor);
            $this->db->delete('cc_autor_evento');
            return $this->db->affected_rows();
        }
    }



    /////////////fotos auxiliares
    function inserir_foto($id, $foto){
        $data = array(
        'fot_caminho' => $foto,
        'fot_evento' => $id
        );
        $this->db->insert('cc_foto_evento_auxiliar', $data);
        return $this->db->affected_rows();
    }
    function remover_foto($id){
        $this->db->select('*');
        $this->db->from('cc_foto_evento_auxiliar');
        $this->db->where('fot_id', $id);
        $foto = $this->db->get()->result()[0]->fot_caminho;
        unlink($this->conf->caminho_upload_eventos_relativo() . $foto ."");
        $this->db->where('fot_id', $id);
        $this->db->delete('cc_foto_evento_auxiliar');
        return $this->db->affected_rows();
    }
    function apaga_todas_fotos_auxiliares($id){
        $this->db->select('*');
        $this->db->from('cc_foto_evento_auxiliar');
        $this->db->where('fot_evento', $id);
        $todas_fotos = $this->db->get()->result();
        foreach ($todas_fotos as $tf) {
            $this->remover_foto($tf->fot_id);
        }
    }
    /////////////////fim fotos auxiliares


    function apaga_foto_evento($id){
        $this->db->select('*');
        $this->db->from('cc_evento');
        $this->db->where('cc_evento.eve_id', $id);
        $foto = $this->db->get()->result()[0]->eve_foto;
        if(unlink($this->conf->caminho_upload_eventos_relativo() . $foto ."")){
            return true;
        }else{
            return false;
        }

    }




    //////////// APROVACAO /////////////////////////////
    function aprovar($id, $id_nucleo){
        $data = array(
        'evl_aprovacao' => 1
        );
        $this->db->where('evl_evento_id', $id);
        $this->db->where('evl_nucleo_id', $id_nucleo);
        $this->db->update('cc_evento_nucleo', $data);
        return $this->db->affected_rows();
    }
    function reprovar($id, $id_nucleo){
        $data = array(
        'evl_aprovacao' => 0
        );
        $this->db->where('evl_evento_id', $id);
        $this->db->where('evl_nucleo_id', $id_nucleo);
        $this->db->update('cc_evento_nucleo', $data);
        return $this->db->affected_rows();
    }


    ///////////// DESTAQUE //////////////////////////
    function destacar($id, $id_nucleo){
        $data = array(
        'evl_destaque' => 1
        );
        $this->db->where('evl_evento_id', $id);
        $this->db->where('evl_nucleo_id', $id_nucleo);
        $this->db->update('cc_evento_nucleo', $data);
        return $this->db->affected_rows();
    }

    function remover_destaque($id, $id_nucleo){
        $data = array(
        'evl_destaque' => 0
        );
        $this->db->where('evl_evento_id', $id);
        $this->db->where('evl_nucleo_id', $id_nucleo);
        $this->db->update('cc_evento_nucleo', $data);
        return $this->db->affected_rows();
    }
}
