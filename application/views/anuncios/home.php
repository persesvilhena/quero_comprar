<?php 
if($this->session->userdata['pag_anuncio'] == "aguardando" ){ $tp="aguardando";$titulo="Anuncios de compra aguardando aprovação"; } 
if($this->session->userdata['pag_anuncio'] == "ativos"  ){ $tp="ativos";  $titulo="Anuncios de compra ativos"; } 
if($this->session->userdata['pag_anuncio'] == "concluidos"){ $tp="concluidos"; $titulo="Anuncios de compra concluidos"; } 
if($this->session->userdata['pag_anuncio'] == "nao_concluidos" ){ $tp="nao_concluidos";  $titulo="Anuncios de compra não concluidos"; } 
?>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header"><?= $titulo; ?>
            <div style="float: right;">
                <a href="<?= base_url(); ?>anuncios/criar" class="btn btn-outline btn-success">CRIAR ANUNCIO DE COMPRA</a>
            </div>
        </h1>
    </div>
</div>


<?= $this->painel_model->avisos(); ?>





<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="<?php if($this->session->userdata['pag_anuncio'] == "aguardando"){ echo "active"; } ?>">
        <a href="<?= base_url(); ?>anuncios/home">Aguardando</a>
    </li>
    <li role="presentation" class="<?php if($this->session->userdata['pag_anuncio'] == "ativos"){ echo "active"; } ?>">
        <a href="<?= base_url(); ?>anuncios/home/ativos">Ativos</a>
    </li>
    <li role="presentation" class="<?php if($this->session->userdata['pag_anuncio'] == "concluidos"){ echo "active"; } ?>">
        <a href="<?= base_url(); ?>anuncios/home/concluidos">Concluídos</a>
    </li>
    <li role="presentation" class="<?php if($this->session->userdata['pag_anuncio'] == "nao_concluidos"){ echo "active"; } ?>">
        <a href="<?= base_url(); ?>anuncios/home/nao_concluidos">Não concluídos</a>
    </li>
</ul>




    
<div role="tabpanel" style="margin-top: 15px;">
    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
        <thead> 
            <tr> 
                <th id="id-table-suas-na">#</th> 

                <th>Anuncios</th>

                <th class="tabela">Atualizar</th>

                <th class="tabela">Apagar</th>
            </tr> 
        </thead> 

        <tbody> 
        <?php $cont = 0; ?>
            <?php foreach ($anuncios as $n): $cont++; ?>
                <tr>
                    <td>
                        <?= $cont; ?>
                    </td>

                    <td>
                        <a href="<?= base_url(); ?>anuncios/home/ver/<?= $n->com_id ?>"><?= $n->com_nome ?></a>
                    </td>
                    
                    <td>
                        <a href="<?= base_url(); ?>anuncios/alterar/<?= $n->com_id ?>" class="btn btn-outline btn-warning">Atualizar</a>
                    </td>
                    
                    <td>
                        <a href="<?= base_url(); ?>" class="btn btn-outline btn-danger">Apagar</a>
                    </td>
                    
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>