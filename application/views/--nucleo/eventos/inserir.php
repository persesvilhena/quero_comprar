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

            <h1 class="page-header">Inserir Evento</h1>
            <form method="post" action="" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Titulo:</label><small class="caracteres"></small>
                    <input type="text" name="eve_titulo" id="eve_titulo" value="" maxlength="60" class="form-control">
                </div>

                <div class="form-group">
                    <label>Descrição:</label>
                    <textarea name="eve_descricao" class="form-control" rows="15"></textarea>
                </div>
                <div class="form-group">
                    <label>Descrição sem formatacao:</label>
                    <textarea name="eve_descricao_sem_formatacao" class="form-control" rows="15"></textarea>
                </div>
                <div class="form-group">
                    <label>Foto:</label>
                    <input type="file" name="eve_foto" value="">
                </div>
                <div class="form-group">
                    <label>Inicio:</label>
                    <input type="text" name="eve_inicio" value="" class="form-control" placeholder="DD/MM/AAAA">
                </div>
                <div class="form-group">
                    <label>Termino:</label>
                    <input type="text" name="eve_termino" value="" class="form-control" placeholder="DD/MM/AAAA">
                </div>
                <div class="form-group">
                    <label>Local:</label>
                    <input type="text" name="eve_local" value="" class="form-control">
                </div>
                <div class="form-group">
                    <label>Endereço:</label>
                    <input type="text" name="eve_endereco" value="" class="form-control">
                </div>
                <div class="form-group">
                    <label>Numero de pessoas atendidas:</label>
                    <input type="text" name="eve_num_pessoa_atendida" value="" class="form-control">
                </div>
                <div class="form-group">
                    <label>Tipo de evento:</label>
                    <select name="eve_tipo_id" class="form-control">
                        <?php foreach ($tipos as $n) {
                            echo "<option value=\"" . $n->tit_id . "\">" . $n->tit_nome . "</option>";
                        }
                        ?>
                    </select> 
                </div>
                <div class="form-group">
                    <label>Palavras chaves:</label>
                    <input type="text" name="eve_palavra_chave" value="" class="form-control">
                </div>
                <div align="right">
                    <input type="submit" name="inserir_evento" value="Inserir" class="btn btn-success">
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        
    </div>
<div>


