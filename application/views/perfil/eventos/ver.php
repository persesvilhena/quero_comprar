<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?= $evento->eve_titulo; ?></h1>
            <b>Imagem: </b><br>
            <img src="<?= $this->conf->caminho_upload_eventos() . $evento->eve_foto; ?>" class="img-responsive">
            <b>Descrição: </b><?= $evento->eve_descricao; ?><hr>
            <b>Descrição sem formatação: </b><?= $evento->eve_descricao_sem_formatacao; ?><hr>
            <b>Foto: </b><?= $evento->eve_foto; ?><hr>
            <b>Inicio: </b><?= $this->conf->data($evento->eve_inicio); ?><hr>
            <b>Termino: </b><?= $this->conf->data($evento->eve_termino); ?><hr>
            <b>Slug: </b><?= $evento->eve_slug; ?><hr>
            <b>Local: </b><?= $evento->eve_local; ?><hr>
            <b>Endereço: </b><?= $evento->eve_endereco; ?><hr>
            <b>Numero de pessoas atendidas: </b><?= $evento->eve_num_pessoa_atendida; ?><hr>
            <b>Palavras chaves: </b><?= $evento->eve_palavra_chave; ?><hr>
            <b>Tipo do evento: </b><?= $evento->tit_nome; ?><hr>
            <b>Autores:</b><br>
            <?php foreach ($autores as $a) { ?>
                <?= $a->usu_nome; ?><br>
            <?php } ?>
        </div>
    </div>
<div>


</div>
    <!-- /.row -->
    <div class="row">
        
    </div>
</div>