        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <?php
                    if(isset($this->session->userdata['avisos'])){
                        $avisos = $this->session->userdata['avisos'];
                        foreach ($avisos as $a) { ?>
                            <div class="alert alert-<?= $a['type']; ?> alert-dismissible" role="alert" style="margin-top: 15px;">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <strong>Aviso!</strong> <?= $a['message']; ?>
                            </div>
                        <?php
                        }
                        $this->session->set_userdata('avisos', null);
                    } 
                    ?>
                    <h1 class="page-header">
                        <?= $user->usu_nome; ?>
                        <div style="float: right;">
                            <a href="<?= base_url(); ?>perfil/editar/" class="btn btn-default">Editar meu perfil</a>
                            <a href="<?= base_url(); ?>perfil/config/" class="btn btn-default">Configurações</a>
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
                <div class="col-md-3">
                    <img src="<?= $this->conf->caminho_upload_perfil() . $user->usu_foto; ?>" class="img-responsive img-thumbnail" style="width: 100%;">
                </div>
                <div class="col-md-9">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <b>Nome:</b> <?= $user->usu_nome; ?><br>
                            <b>Login:</b> <?= $user->usu_login; ?><br>
                            <b>Email:</b> <?= $user->usu_email; ?><br>
                            <b>Celular:</b> <?= $user->usu_cel; ?><br>
                            <b>Telefone:</b> <?= $user->usu_tel; ?><br>
                            <b>Sobre:</b> <?= $user->usu_sobre; ?><br>
                        </div>
                    </div>
                </div>


            </div>
            <!-- /.row -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
