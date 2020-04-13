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

            <h1 class="page-header">Inserir Notícia</h1>
            <form method="post" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Titulo:*</label><small class="caracteres"></small>
                    <input type="text" name="not_titulo" id="not_titulo" value="" maxlength="60" class="form-control">
                </div>
                <div class="form-group">
                    <label>Sub-Titulo:</label>
                    <input type="text" name="not_subtitulo" value="" class="form-control">
                </div>
                <div class="form-group">
                    <label>Conteudo:*</label>
                    <textarea name="not_conteudo" class="form-control" rows="15"></textarea>
                </div>
                <div class="form-group">
                    <label>Conteudo sem formatacao:</label>
                    <textarea name="not_conteudo_sem_formatacao" class="form-control" rows="15"></textarea>
                </div>
                <div class="form-group">
                    <label>Foto:</label>
                    <input type="file" name="not_foto" value="">
                </div>
                <div class="form-group">
                    <label>Data de criação:*</label>
                    <input type="text" name="not_criado" value="" class="form-control" placeholder="DD/MM/AAAA">
                </div>
                <div class="form-group">
                    <label>Data de revisão:</label>
                    <input type="text" name="not_revisado" value="" class="form-control" placeholder="DD/MM/AAAA">
                </div>
                <div class="form-group">
                    <label>Data de exibição:*</label>
                    <input type="text" name="not_exibicao" value="" class="form-control" placeholder="DD/MM/AAAA">
                </div>
                <div class="form-group">
                    <label>Palavras chaves:</label>
                    <input type="text" name="not_palavra_chave" value="" class="form-control">
                </div>
                *Campos Obrigatórios
                <div align="right">
                    <input type="submit" name="inserir_noticia" value="Inserir" class="btn btn-success">
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        
    </div>
<div>


