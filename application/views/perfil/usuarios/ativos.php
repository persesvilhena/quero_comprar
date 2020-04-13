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
            <h1 class="page-header">Usuários ativos
                <div style="float: right;">
                    <a href="<?= base_url(); ?>admin/usuarios/" class="btn"><span class="fa fa-reply"></span>Voltar</a>
                </div>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
<div>
<div class="panel-body">
        <table class="table table-hover">
            <thead> 
                <tr> 
                    <th>#</th> 
                    <th>Nome</th>
                    <th>Login</th>
                    <th>Matricula</th>
                    <th>Email</th>
                    <th>Reprovar</th>
                </tr> 
            </thead> 

            <tbody> 
                <?php foreach ($usuarios as $n): ?>
                    <tr>
                        <td>
                            <?= $n->usu_id; ?>
                        </td>
                        <td>
                            <?= $n->usu_nome; ?>
                        </td>
                        <td>
                            <?= $n->usu_login; ?>
                        </td>
                        <td>
                            <?= $n->usu_matricula; ?>
                        </td>
                        <td>
                            <?= $n->usu_email; ?>
                        </td>
                        <td>
                            <form action="" method="post">
                                <input type="hidden" name="usu_id" value="<?= $n->usu_id; ?>">
                                <input type="submit" name="reprovar" value="Reprovar" class="btn btn-danger">
                            </form>
                        </td>
                 
                    </tr>

                <?php endforeach; ?>
            </tbody>
        </table>
</div>