<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Editar perfil
                <div style="float: right;">
                    <a href="<?= base_url(); ?>perfil/" class="btn btn-default">Meu perfil</a>
                </div>
                <div style="clear: both;"></div>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!--<div class="row">
        <div class="col-lg-12">
            <a href="<?= base_url(); ?>admin/permissao" class="btn btn-default">Sistema de permissões</a>
            <a href="<?= base_url(); ?>admin/log" class="btn btn-default">Sistema de log</a>
            <a href="<?= base_url(); ?>admin/tipo_evento" class="btn btn-default">Tipo de eventos</a>
            <a href="<?= base_url(); ?>admin/teste" class="btn btn-default">teste</a>
            <hr>
        </div>
    </div>-->
    <!-- /.row -->
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

            <form method="post" action="" enctype="multipart/form-data">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Nome:</label>
                        <input type="text" name="usu_nome" value="<?= $user->usu_nome; ?>" maxlength="60" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Celular:</label>
                        <input type="text" name="usu_cel" value="<?= $user->usu_cel; ?>" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Telefone:</label>
                        <input type="text" name="usu_tel" value="<?= $user->usu_tel; ?>" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Foto:</label>
                        <input type="file" name="usu_foto" value="<?= $user->usu_foto; ?>">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label>Sobre:</label>
                        <textarea name="usu_sobre" class="form-control" rows="13"><?= $user->usu_sobre; ?></textarea>
                    </div>
                    
                    <div align="right">
                        <input type="submit" name="alterar" value="Salvar" class="btn btn-outline btn-success">
                    </div>
                </div>
                
                
            </form>


        
    </div>
    <!-- /.row -->

</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
