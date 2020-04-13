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
                    <h3 class="panel-title">Área administrativa - Esqueceu a senha?
                        <div style="float: right;">
                            <a href="<?= base_url(); ?>home/logar"><span class="fa fa-reply"></span>Voltar</a>
                        </div>
                    </h3>
                </div>
                <div class="panel-body">
                    <form action="" id="formlogin" method="post" accept-charset="utf-8">
                    <fieldset>
                        <div class="form-group">
                            <label>Login: </label>
                            <input type="text" name="usu_login" class="form-control"  />
                        </div>
                        <input type="submit" name="recuperar" value="Recuperar senha"  class='btn btn-lg btn-success btn-block' />
                    </fieldset>
                    </form>  
                </div>
            </div>
        </div>        
    </div>
</div>

