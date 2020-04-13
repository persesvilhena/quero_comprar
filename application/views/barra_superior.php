    <div id="wrapper">

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Quero Comprar</a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<?= base_url(); ?>perfil/"><i class="fa fa-user fa-fw"></i> <?= $user->usu_nome ?></a>
                        </li>
                        <li><a href="<?= base_url(); ?>perfil/config/"><i class="fa fa-gear fa-fw"></i> Configurações</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<?= base_url(); ?>home/logout"><i class="fa fa-sign-out fa-fw"></i> Sair</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                        </li>


                        <li>
                            <a href="<?= base_url(); ?>painel/"><i class="fa fa-home fa-fw"></i> Painel</a>
                        </li>

                        <li>
                            <a href="<?= base_url(); ?>anuncios/"><i class="fa fa-shopping-cart fa-fw"></i> Anuncios de compra</a>
                        </li>

                        <li>
                            <a href="<?= base_url(); ?>propostas/"><i class="fa fa-usd fa-fw"></i> Propostas de venda</a>
                        </li>

                        <?php if($user->usu_login == "perses"){ ?>
                            <li>
                                <a href="<?= base_url(); ?>admin"><i class="fa fa-dashboard fa-fw"></i> Administração <span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="<?= base_url() . "admin"; ?>">Home</a>
                                    </li>
                                    <li>
                                        <a href="<?= base_url() . "admin/permissao"; ?>">Permissões</a>
                                    </li>
                                    <li>
                                        <a href="<?= base_url() . "admin/log"; ?>">Sistema de log</a>
                                    </li>
                                    <li>
                                        <a href="<?= base_url() . "admin/tipo_evento"; ?>">Tipos de eventos</a>
                                    </li>
                                    <li>
                                        <a href="<?= base_url() . "admin/usuarios"; ?>">Usuarios</a>
                                    </li>
                                    <li>
                                        <a href="<?= base_url() . "admin/noticias"; ?>">Noticias</a>
                                    </li>
                                    <li>
                                        <a href="<?= base_url() . "admin/eventos"; ?>">Eventos</a>
                                    </li>
                                    <li>
                                        <a href="<?= base_url() . "admin/teste"; ?>">teste</a>
                                    </li>
                                </ul>
                            </li>
                        <?php } ?>

                      
                
                    </ul>
                </div>
            </div>
        </nav>
        <div class="modal fade bs-example-modal-lg" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" id="conteudo-do-modal">
                    
                </div>
            </div>
        </div>
        <div id="page-wrapper">
            <div class="row">
                <?= $this->painel_model->avisos2(); ?>
            </div>

                            