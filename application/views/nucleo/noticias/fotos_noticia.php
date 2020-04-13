<div id="page-wrapper">

        <div class="row">
            <div class="col-md-12">
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
            </div>
        </div>

    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">Adicionar novas fotos <small><?= $noticia->not_titulo; ?></small></h1>
            <br>
            <form action="" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <label>Inserir nova foto:</label>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                
                                <input type="file" name="foto">
                            </div>
                        </div>
                        <div class="panel-footer">
                            <div style="float: right;">
                                <input type="submit" name="inserir_foto" value="Inserir" class="btn btn-success">
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                    </div>
                </div>

                
            </form>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">Fotos <small><?= $noticia->not_titulo; ?></small></h1>
            <br>
        </div>
    </div>
    <div class="row">
        <?php foreach ($fotos as $f) { ?>
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <img src="<?= $this->conf->caminho_upload_noticias() . $f->for_caminho; ?>" style="width: 100%; height: 200px;">
                    </div>
                    <div class="panel-footer">
                        <form action="" method="post">
                            <input type="hidden" name="foto" value="<?= $f->for_id; ?>">
                            <input type="submit" name="remover_foto" value="Apagar" class="btn btn-danger">
                        </form>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
    
<div>
