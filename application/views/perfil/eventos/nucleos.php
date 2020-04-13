<div id="page-wrapper">
    <?php if($avisos == 1){ ?>
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
            </div>
        </div>
    <?php } ?>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Remover duplicação <small><?= $evento->eve_titulo; ?></small></h1>
            <br>
            <table class="table table-hover">
                <thead>
                    <tr> 
                        <th>#</th>
                        <th>Nucleo</th>
                        <th>Nucleo original</th>
                        <th>Remover</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($todos_nucleos_duplicacao as $n){
                        if($n->evl_original == 1){ $tipo = "success"; $msg = "SIM"; }else{ $tipo = "danger"; $msg = "NÃO"; } 
                        ?>
                        <tr>
                            <td class="<?= $tipo; ?>"><?= $n->nuc_id; ?></td>
                            <td class="<?= $tipo; ?>"><?= $n->nuc_nome; ?></td>
                            <td class="<?= $tipo; ?>"><?= $msg; ?></td>
                            <td class="<?= $tipo; ?>">
                                <form action="" method="post">
                                        <input type="hidden" name="nucleo" value="<?= $n->nuc_id; ?>">
                                        <input type="submit" name="remover_duplicacao" value="Remover" class="btn btn-danger">
                                        <br>
                                </form>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Adicionar nucleo <small><?= $evento->eve_titulo; ?></small></h1>
            <br>
            <form action="" method="post">
                <div class="form-group">
                    <label>Escolha o nucleo: </label>
                    <select class="form-control" name="nucleo">
                        <option>Escolha um nucleo</option>
                        <?php foreach ($todos_nucleos as $n){ ?>
                            <option value="<?= $n->nuc_id; ?>"><?= $n->nuc_nome; ?></option>
                        <?php } ?>
                    </select>
                </div>

                <div style="float: right;">
                    <input type="submit" name="duplicar_evento" value="Duplicar" class="btn btn-success">
                </div>
            </form>

        </div>
    </div>


    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Adicionar nucleo original <small><?= $evento->eve_titulo; ?></small></h1>
            <br>
            <form action="" method="post">
                <div class="form-group">
                    <label>Escolha o nucleo: </label>
                    <select class="form-control" name="nucleo">
                        <option>Escolha um nucleo</option>
                        <?php foreach ($todos_nucleos as $n){ ?>
                            <option value="<?= $n->nuc_id; ?>"><?= $n->nuc_nome; ?></option>
                        <?php } ?>
                    </select>
                </div>

                <div style="float: right;">
                    <input type="submit" name="duplicar_evento_original" value="Duplicar" class="btn btn-success">
                </div>
            </form>

        </div>
    </div>
<div>
