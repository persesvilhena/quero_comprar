<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Tipos de eventos
                <div style="float: right;">
                    <a href="<?= base_url(); ?>admin/tipo_evento/inserir" class="btn btn-success">Inserir</a>
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
                    <th>Tipos</th>
                    <th>Alterar</th>
                    <th>Apagar</th>
                </tr> 
            </thead> 

            <tbody> 
                <?php foreach ($tipos as $n): ?>
                    <tr>
                        <td>
                            <?= $n->tit_id; ?>
                        </td>
                        <td>
                            <?= $n->tit_nome; ?>
                        </td>
                        <td>
                            <a href="<?= base_url() . "admin/tipo_evento/alterar/" . $n->tit_id . "/"; ?>" class="btn btn-warning">
                                Atualizar
                            </a>
                        </td>
                        <td>
                            <a href="<?= base_url() . "admin/tipo_evento/apagar/" . $n->tit_id . "/"; ?>" class="btn btn-danger">
                                Apagar
                            </a>
                        </td>
                 
                    </tr>

                <?php endforeach; ?>
            </tbody>
        </table>
</div>