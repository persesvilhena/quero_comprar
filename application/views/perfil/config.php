        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Configurações - <?= $user->usu_nome; ?>
                        <div style="float: right;">
                            <a href="<?= base_url(); ?>perfil/" class="btn btn-default">Meu perfil</a>
                        </div>
                        <div style="clear: both;"></div>
                    </h1>
                </div>
            </div>


            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Configuração
                        </div>

                        <div class="panel-body">
                            
                        </div>

                        <div class="panel-footer">
                            <div style="float: right;">
                                <a href="<?= base_url(); ?>perfil/" class="btn btn-default">Salvar</a>
                            </div>
                            <div style="clear: both;"></div>
                        </div>
                    </div>


                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Alterar senha
                        </div>

                        <form method="post" action="">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>Senha atual:</label>
                                    <input type="password" name="senha_atual" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Nova senha:</label>
                                    <input type="password" name="senha1" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Repita a senha:</label>
                                    <input type="password" name="senha2" class="form-control">
                                </div>
                            </div>

                            <div class="panel-footer">
                                <div style="float: right;">
                                    <input type="submit" name="alterar_senha" value="Alterar" class="btn btn-default">
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </form>
                    </div>



                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Alterar email
                        </div>

                        <form method="post" action="">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>Senha:</label>
                                    <input type="password" name="senha" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Novo email:</label>
                                    <input type="teste" name="email" class="form-control" placeholder="<?= $user->usu_email; ?>">
                                </div>
                            </div>

                            <div class="panel-footer">
                                <div style="float: right;">
                                    <input type="submit" name="alterar_email" value="Alterar" class="btn btn-default">
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </form>
                    </div>





                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Excluir conta
                        </div>

                        <form method="post" action="">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>Senha:</label>
                                    <input type="password" name="senha" class="form-control">
                                </div>
                            </div>

                            <div class="panel-footer">
                                <div style="float: right;">
                                    <input type="submit" name="excluir_conta" value="Excluir" class="btn btn-default">
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                        </form>
                    </div>



                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
