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

            <h1 class="page-header">Autores Evento <small><?= $evento->eve_titulo; ?></small></h1>

            <table class="table table-hover">
                <thead>
                    <tr> 
                        <th>#</th>
                        <th>Autor</th>
                        <th>Autor Original</th>
                        <th>Remover</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($autores as $n){ 
                        if($n->auo_original == 1){ $tipo = "success"; $msg = "SIM"; }else{ $tipo = "danger"; $msg = "NÃO"; }
                        ?>

                        <tr>
                            <td class="<?= $tipo; ?>"><?= $n->usu_id; ?></td>
                            <td class="<?= $tipo; ?>"><?= $n->usu_nome; ?></td>
                            <td class="<?= $tipo; ?>"><?= $msg; ?></td>
                            <td class="<?= $tipo; ?>">
                                <form action="" method="post">
                                        <input type="hidden" name="autor" value="<?= $n->usu_id; ?>">
                                        <input type="submit" name="remover_autor" value="Remover" class="btn btn-danger">
                                        <br>
                                </form>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>





            <h1 class="page-header"><small>Inserir autor</small></h1>
            <br>
            <form action="" method="post">
                <div class="form-group">
                    <label>Escolha um autor: </label>
                    <select class="form-control" name="autor">
                        <option>Escolha um autor</option>
                        <?php foreach ($todos_usuarios as $n){ ?>
                            <option value="<?= $n->usu_id; ?>"><?= $n->usu_nome; ?></option>
                        <?php } ?>
                    </select>
                </div>

                <div style="float: right;">
                    <input type="submit" name="inserir_autor" value="Inserir" class="btn btn-success">
                </div>
            </form>



            <h1 class="page-header"><small>Inserir autor original</small></h1>
            <br>
            <form action="" method="post">
                <div class="form-group">
                    <label>Escolha o autor original: </label>
                    <select class="form-control" name="autor">
                        <option>Escolha o autor original</option>
                        <?php foreach ($todos_usuarios as $n){ ?>
                            <option value="<?= $n->usu_id; ?>"><?= $n->usu_nome; ?></option>
                        <?php } ?>
                    </select>
                </div>

                <div style="float: right;">
                    <input type="submit" name="inserir_autor_original" value="Inserir" class="btn btn-success">
                </div>
            </form>





        </div>
    </div>
    <div class="row">
        
    </div>
<div>

