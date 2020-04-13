<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Eventos sem nucleos
	            <div style="float: right;">
            		<a href="<?= base_url(); ?>admin/eventos/sem_autores" class="btn btn-default">Sem autores</a>
            		<a href="<?= base_url(); ?>admin/eventos/home" class="btn btn-default">Todas</a>
            	</div>
            </h1>
        </div>
    </div>
<div>



<?php

if(isset($this->session->userdata['avisos'])){
	$avisos = $this->session->userdata['avisos'];
	foreach ($avisos as $a) { ?>
		<div class="alert alert-<?= $a['type']; ?> alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<strong>Aviso!</strong> <?= $a['message']; ?>
		</div>
	<?php
	}
	$this->session->set_userdata('avisos', null);
} 
?>







    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th> 
        			<th>eventos</th>
        			<th>Autores</th>
        			<th>Nucleos</th>
        			<th>Autores</th>
					<th>Nucleos</th>
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($eventos as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->eve_id; ?>
		        		</td>
		        		<td>
		        			<a href="<?= base_url() . "admin/eventos/ver/" . $n->eve_id . "/"; ?>"><?= $n->eve_titulo ?></a>
		        		</td>
		        		<td>
		        			<?php foreach ($n->autores as $aut){ echo $aut->usu_nome . "<br>"; } ?>
		        		</td>
		        		<td>
		        			<?php foreach ($n->nucleos as $nuc){ echo $nuc->nuc_nome . "<br>"; } ?>
		        		</td>

		        		<td>
		        			<a href="<?= base_url() . "admin/eventos/autores/" . $n->eve_id . "/"; ?>" class="btn btn-default">Autores</a>
		        		</td>

		        		<td>
			        		<a href="<?= base_url() . "admin/eventos/nucleos/" . $n->eve_id . "/"; ?>" class="btn btn-default">Nucleos</a>
		        		</td>

		        	</tr>

		        <?php endforeach; ?>
			</tbody>
		</table>

	





















</div>
    <!-- /.row -->
    <div class="row">
        
    </div>
</div>