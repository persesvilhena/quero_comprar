<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?= $noticia->not_titulo; ?><small><?= $noticia->not_subtitulo; ?></small></h1>
            <b>Imagem: </b><br>
            <img src="<?= $this->conf->caminho_upload_noticias() . $noticia->not_foto; ?>" class="img-responsive">
            <b>Conteudo: </b><?= $noticia->not_conteudo; ?><hr>
            <b>Conteudo sem formatacao: </b><?= $noticia->not_conteudo_sem_formatacao; ?><hr>
            <b>Foto: </b><?= $noticia->not_foto; ?><hr>
            <b>Data de criação: </b><?= $this->conf->data($noticia->not_criado); ?><hr>
            <b>Data de revisão: </b><?= $this->conf->data($noticia->not_revisado); ?><hr>
            <b>Data de exibição: </b><?= $this->conf->data($noticia->not_exibicao); ?><hr>
            <b>Slug: </b><?= $noticia->not_slug; ?><hr>
            <b>Palavras chaves: </b><?= $noticia->not_palavra_chave; ?><hr>
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