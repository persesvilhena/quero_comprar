<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2" style="margin-top: 25px;">
            <?php
                if (isset($erro)) {
                    ?>
                        <div class="alert alert-danger alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <?php echo $erro; ?>
                        </div>
                    <?php
                }
                if (isset($sucesso)) {
                    ?>
                        <div class="alert alert-success alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <?php echo $sucesso; ?>
                        </div>
                    <?php
                }
            ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Área administrativa - Cadastro
                        <div style="float: right;">
                            <a href="<?= base_url(); ?>home/logar"><span class="fa fa-reply"></span>Voltar</a>
                        </div>
                    </h3>
                </div>
                <div class="panel-body">
                    <form action="" id="formlogin" method="post" accept-charset="utf-8">
                    <fieldset>
                        <div class="form-group">
                            <label>Usuário: </label>
                            <input type="text" name="usu_login" autofocus class="form-control"  />
                        </div>
                        <div class="form-group">
                            <label>Senha: </label>
                            <input type="password" name="usu_senha" class="form-control"  />
                        </div>
                        <div class="form-group">
                            <label>Nome completo: </label>
                            <input type="text" name="usu_nome" class="form-control"  />
                        </div>
                        <div class="form-group">
                            <label>Email: </label>
                            <input type="text" name="usu_email" class="form-control"  />
                        </div>
                        <input type="submit" name="cadastrar" value="Cadastrar"  class='btn btn-lg btn-success btn-block' />
                    </fieldset>
                    </form>  
                </div>
            </div>
        </div>        
    </div>
</div>

