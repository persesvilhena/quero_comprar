<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
        
            <?php if(isset($sucesso)){ ?>
                <div class="alert alert-success alert-dismissible" role="alert" style="margin-top: 15px;">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>Sucesso!</strong> <?= $sucesso; ?>
                </div>
            <?php } if(isset($erro)){ ?>
                <div class="alert alert-danger alert-dismissible" role="alert" style="margin-top: 15px;">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>Erro!</strong> <?= $erro; ?>
                </div>
            <?php } ?>

            <h1 class="page-header">Alterar Notícia <small><?= $noticia->not_titulo; ?></small></h1>
            <b>Autores:</b>
            <div style="float: right;">
                <a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/fotos_noticia/" . $noticia->not_id . "/"; ?>" class="btn btn-warning">Fotos</a> 
                <a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/autores_noticia/" . $noticia->not_id . "/"; ?>" class="btn btn-warning">Autores</a>
            </div>
            <br>
            <?php foreach ($autores as $a) { ?>
                <?= $a->usu_nome; ?><br>
            <?php } ?>

            <form method="post" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Titulo:</label><small class="caracteres"></small>
                    <input type="hidden" name="not_id" value="<?= $noticia->not_id; ?>">
                    <input type="text" name="not_titulo" id="not_titulo" value="<?= $noticia->not_titulo; ?>" maxlength="60" class="form-control">
                </div>
                <div class="form-group">
                    <label>Sub-Titulo:</label>
                    <input type="text" name="not_subtitulo" value="<?= $noticia->not_subtitulo; ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Conteudo:</label>
                    <textarea name="not_conteudo" class="form-control" rows="15"><?= $noticia->not_conteudo; ?></textarea>
                </div>
                <div class="form-group">
                    <label>Conteudo sem formatacao:</label>
                    <textarea name="not_conteudo_sem_formatacao" class="form-control" rows="15"><?= $noticia->not_conteudo_sem_formatacao; ?></textarea>
                </div>
                <div class="form-group">
                    <label>Foto:</label>
                    <input type="file" name="not_foto" value="<?= $noticia->not_foto; ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Data de criação:</label>
                    <input type="text" name="not_criado" value="<?= $this->conf->data($noticia->not_criado); ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Data de revisão:</label>
                    <input type="text" name="not_revisado" value="<?= $this->conf->data($noticia->not_revisado); ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Data de exibição:</label>
                    <input type="text" name="not_exibicao" value="<?= $this->conf->data($noticia->not_exibicao); ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Slug:</label>
                    <input type="text" name="not_slug" value="<?= $noticia->not_slug; ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Palavras chaves:</label>
                    <input type="text" name="not_palavra_chave" value="<?= $noticia->not_palavra_chave; ?>" class="form-control">
                </div>
                <div align="right">
                    <input type="submit" name="alterar_noticia" value="Alterar" class="btn btn-success">
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        
    </div>
<div>

