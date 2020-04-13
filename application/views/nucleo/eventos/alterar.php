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

            <h1 class="page-header">Alterar Evento <small><?= $evento->eve_titulo; ?></small></h1>
            <b>Autores:</b>
            <div style="float: right;">
                <a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/fotos_evento/" . $evento->eve_id . "/"; ?>" class="btn btn-warning">Fotos</a> 
                <a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/autores_evento/" . $evento->eve_id . "/"; ?>" class="btn btn-warning">Autores</a>
            </div>
            <br>
            <?php foreach ($autores as $a) { ?>
                <?= $a->usu_nome; ?><br>
            <?php } ?>

            <form method="post" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Titulo:</label><small class="caracteres"></small>
                    <input type="hidden" name="eve_id" value="<?= $evento->eve_id; ?>">
                    <input type="text" name="eve_titulo" id="eve_titulo" value="<?= $evento->eve_titulo; ?>" maxlength="60" class="form-control">
                </div>

                <div class="form-group">
                    <label>Descrição:</label>
                    <textarea name="eve_descricao" class="form-control" rows="15"><?= $evento->eve_descricao; ?></textarea>
                </div>
                <div class="form-group">
                    <label>Descrição sem formatacao:</label>
                    <textarea name="eve_descricao_sem_formatacao" class="form-control" rows="15"><?= $evento->eve_descricao_sem_formatacao; ?></textarea>
                </div>
                <div class="form-group">
                    <label>Foto:</label>
                    <input type="file" name="eve_foto" value="<?= $evento->eve_foto; ?>">
                </div>
                <div class="form-group">
                    <label>Inicio:</label>
                    <input type="text" name="eve_inicio" value="<?= $this->conf->data($evento->eve_inicio); ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Termino:</label>
                    <input type="text" name="eve_termino" value="<?= $this->conf->data($evento->eve_termino); ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Local:</label>
                    <input type="text" name="eve_local" value="<?= $evento->eve_local; ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Endereço:</label>
                    <input type="text" name="eve_endereco" value="<?= $evento->eve_endereco; ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Slug:</label>
                    <input type="text" name="eve_slug" value="<?= $evento->eve_slug; ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Numero de pessoas atendidas:</label>
                    <input type="text" name="eve_num_pessoa_atendida" value="<?= $evento->eve_num_pessoa_atendida; ?>" class="form-control">
                </div>
                <div class="form-group">
                    <label>Tipo de evento:</label>
                    <select name="eve_tipo_id" class="form-control">
                        <?php foreach ($tipos as $n) {
                            if($n->tit_id == $evento->eve_tipo_id){
                                echo "<option value=\"" . $n->tit_id . "\" selected>" . $n->tit_nome . "</option>";
                            }else{
                                echo "<option value=\"" . $n->tit_id . "\">" . $n->tit_nome . "</option>";
                            }
                        }
                        ?>
                    </select> 
                </div>
                <div class="form-group">
                    <label>Palavras chaves:</label>
                    <input type="text" name="eve_palavra_chave" value="<?= $evento->eve_palavra_chave; ?>" class="form-control">
                </div>
                <div align="right">
                    <input type="submit" name="alterar_evento" value="Alterar" class="btn btn-success">
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        
    </div>
<div>

