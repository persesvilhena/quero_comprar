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
            <h1 class="page-header">Remover duplicação <small><?= $noticia->not_titulo; ?></small></h1>
            <br>
            <table class="table table-hover">
                <thead>
                    <tr> 
                        <th>#</th>
                        <th>Nucleo</th>
                        <th>Remover</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($todos_nucleos_duplicacao as $n){ ?>
                        <tr>
                            <td><?= $n->nuc_id; ?></td>
                            <td><?= $n->nuc_nome; ?></td>
                            <td>
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
            <h1 class="page-header">Duplicar Notícia <small><?= $noticia->not_titulo; ?></small></h1>
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
                    <input type="submit" name="duplicar_noticia" value="Duplicar" class="btn btn-success">
                </div>
            </form>

        </div>
    </div>
<div>
