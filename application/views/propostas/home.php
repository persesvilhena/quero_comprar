<?php 
if($this->session->userdata['pag_propostas'] == "feitas" ){ $tp="aguardando";$titulo="Propostas feitas"; } 
if($this->session->userdata['pag_propostas'] == "aceitas"  ){ $tp="aceitas";  $titulo="Propostas aceitas"; } 
if($this->session->userdata['pag_propostas'] == "recusadas"){ $tp="recusadas"; $titulo="Propostas recusadas"; } 
?>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header"><?= $titulo; ?>
        </h1>
    </div>
</div>


<?= $this->painel_model->avisos(); ?>





<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="<?php if($this->session->userdata['pag_propostas'] == "feitas"){ echo "active"; } ?>">
        <a href="<?= base_url(); ?>propostas/home">Feitas</a>
    </li>
    <li role="presentation" class="<?php if($this->session->userdata['pag_propostas'] == "aceitas"){ echo "active"; } ?>">
        <a href="<?= base_url(); ?>propostas/home/aceitas">Aceitas</a>
    </li>
    <li role="presentation" class="<?php if($this->session->userdata['pag_propostas'] == "recusadas"){ echo "active"; } ?>">
        <a href="<?= base_url(); ?>propostas/home/recusadas">Recusadas</a>
    </li>
</ul>




    
<div role="tabpanel" style="margin-top: 15px;">
    <?= $list; ?>
</div>