<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?= $nucleo->nuc_nome; ?> - Eventos
            	<div style="float: right;">
            		<?php if($this->permissao_model->verifica_permissao("ins", $nucleo->nuc_id, 2)){ ?>
        				<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/inserir_evento"; ?>" class="btn btn-success">Inserir</a>
        			<?php } ?>
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





<ul class="nav nav-tabs" role="tablist">
	<li role="presentation" class="active">
		<a href="#suasna" aria-controls="suasna" role="tab" data-toggle="tab" aria-expanded="true">Suas (não aprovadas)</a>
	</li>
	<li role="presentation" class="">
		<a href="#suas" aria-controls="suas" role="tab" data-toggle="tab" aria-expanded="true">Suas (aprovadas)</a>
	</li>
	<li role="presentation" class="">
		<a href="#geralna" aria-controls="geralna" role="tab" data-toggle="tab" aria-expanded="false">Geral (não aprovadas)</a>
	</li>
	<li role="presentation" class="">
		<a href="#geral" aria-controls="geral" role="tab" data-toggle="tab" aria-expanded="false">Geral (aprovadas)</a>
	</li>
</ul>


  <div class="tab-content">





  	
    <div role="tabpanel" class="tab-pane fade active in" id="suasna">
    	<?php if($this->permissao_model->verifica_permissao("lis_sua_na", $nucleo->nuc_id, 2)){ ?>
    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th> 
        			<th>Eventos</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("alt_sua_na", $nucleo->nuc_id, 2)){ echo"Atualizar"; } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 2)){ ?>
	        				Aprovar
	        			<?php } ?>
        			</th>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 2)){ echo "Destaque"; } ?>
        			</th>

					<th>
        			<?php if($this->permissao_model->verifica_permissao("dup_sua_na", $nucleo->nuc_id, 2)){ ?>
        				Duplicação
        			<?php } ?>
        			</th>

        			<th>
        			<?php if($this->permissao_model->verifica_permissao("exc_sua_na", $nucleo->nuc_id, 2)){ ?>
        				Apagar
        			<?php } ?>
        			</th>
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($eventos_nucleo_suas_na as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->eve_id; ?>
		        		</td>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/ver_evento/" . $n->eve_id . "/"; ?>"><?= $n->eve_titulo ?></a>
		        		</td>
		        		<?php if($this->permissao_model->verifica_permissao("alt_sua_na", $nucleo->nuc_id, 2)){ ?>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/alterar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-warning">
		        				Atualizar
		        			</a>
		        		</td>
		        		<?php } ?>
		        		<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 2)){ ?>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/aprovar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-success">
		        				Aprovar
		        			</a>
		        		</td>
		        		<?php } ?>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 2)){ ?>
			        			<?php if($n->evl_destaque == 0){ ?>
			        				<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/add_destaque_evento/" . $n->eve_id . "/"; ?>" class="btn btn-success">
			        					Destacar
			        				</a>
				        			<!--<form action="" method="post">
				        				<input type="hidden" name="id_evento" value="<?= $n->eve_id ?>">
				        				<input type="hidden" name="id_nucleo" value="<?= $nucleo->nuc_id ?>">
				        				<input type="submit" name="destacar_evento" value="Destacar" class="btn btn-success">
				        			</form>-->
			        			<?php }else{ ?>
			        				<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/rmv_destaque_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
			        					Remover
			        				</a>
				        			<!--<form action="" method="post">
				        				<input type="hidden" name="id_evento" value="<?= $n->eve_id ?>">
				        				<input type="hidden" name="id_nucleo" value="<?= $nucleo->nuc_id ?>">
				        				<input type="submit" name="remover_destaque" value="Remover" class="btn btn-danger">
				        			</form>-->
			        			<?php } ?>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("dup_sua_na", $nucleo->nuc_id, 2)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/duplicacao_evento/" . $n->eve_id . "/"; ?>" class="btn btn-warning">
			        				Duplicação
			        			</a>
			        		<?php } ?>
		        		</td>

		        		<?php if($this->permissao_model->verifica_permissao("exc_sua_na", $nucleo->nuc_id, 2)){ ?>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/apagar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
		        				Apagar
		        			</a>
		        		</td>
		        		<?php } ?>
		        	</tr>

		        <?php endforeach; ?>
			</tbody>
		</table>
		<?php } ?>
	</div>
	







	
	<div role="tabpanel" class="tab-pane fade" id="suas">
		<?php if($this->permissao_model->verifica_permissao("lis_sua_a", $nucleo->nuc_id, 2)){ ?>
    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th> 
        			<th>eventos</th>
        			<?php if($this->permissao_model->verifica_permissao("alt_sua_a", $nucleo->nuc_id, 2)){ ?>
        				<th>Atualizar</th>
        			<?php } ?>
        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 2)){ ?>
        				<th>Reprovar</th>
        			<?php } ?>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 2)){ echo "Destaque"; } ?>
        			</th>

        			<?php if($this->permissao_model->verifica_permissao("dup_sua_a", $nucleo->nuc_id, 2)){ ?>
        				<th>Duplicação</th>
        			<?php } ?>
        			<?php if($this->permissao_model->verifica_permissao("exc_sua_a", $nucleo->nuc_id, 2)){ ?>
        				<th>Apagar</th>
        			<?php } ?>
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($eventos_nucleo_suas_a as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->eve_id; ?>
		        		</td>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/ver_evento/" . $n->eve_id . "/"; ?>"><?= $n->eve_titulo ?></a>
		        		</td>
		        		<?php if($this->permissao_model->verifica_permissao("alt_sua_a", $nucleo->nuc_id, 2)){ ?>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/alterar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-warning">
		        				Atualizar
		        			</a>
		        		</td>
		        		<?php } ?>
		        		<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 2)){ ?>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/reprovar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
		        				Reprovar
		        			</a>
		        		</td>
		        		<?php } ?>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 2)){ ?>
			        			<?php if($n->evl_destaque == 0){ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/add_destaque_evento/" . $n->eve_id . "/"; ?>" class="btn btn-success">
			        					Destacar
			        				</a>
			        			<?php }else{ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/rmv_destaque_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
			        					Remover
			        				</a>

			        			<?php } ?>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("dup_sua_a", $nucleo->nuc_id, 2)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/duplicacao_evento/" . $n->eve_id . "/"; ?>" class="btn btn-warning">
			        				Duplicação
			        			</a>
			        		<?php } ?>
		        		</td>

		        		<?php if($this->permissao_model->verifica_permissao("exc_sua_a", $nucleo->nuc_id, 2)){ ?>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/apagar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
		        				Apagar
		        			</a>
		        		</td>
		        		<?php } ?>
		        	</tr>

		        <?php endforeach; ?>
			</tbody>
		</table>
		<?php } ?>
	</div>
	










    <div role="tabpanel" class="tab-pane fade" id="geralna">
    	<?php if($this->permissao_model->verifica_permissao("lis_ger_na", $nucleo->nuc_id, 2)){ ?>
    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th> 
        			<th>eventos</th>
        			<th>
        			<?php if($this->permissao_model->verifica_permissao("alt_ger_na", $nucleo->nuc_id, 2)){ ?>Atualizar<?php } ?>
        			</th>
        			<th>
        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 2)){ ?>
        				Aprovar
        			<?php } ?>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 2)){ echo "Destaque"; } ?>
        			</th>

        			</th>
        			<?php if($this->permissao_model->verifica_permissao("dup_ger_na", $nucleo->nuc_id, 2)){ ?>
        				<th>Duplicação</th>
        			<?php } ?>
        			<?php if($this->permissao_model->verifica_permissao("exc_ger_na", $nucleo->nuc_id, 2)){ ?>
        			<th>Apagar</th> 
        			<?php } ?>
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($eventos_nucleo_na as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->eve_id; ?>
		        		</td>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/ver_evento/" . $n->eve_id . "/"; ?>"><?= $n->eve_titulo ?></a>
		        		</td>
		        		<td>
		        			<?php if($this->permissao_model->permissao_original_noticia("alt_ger_na", $nucleo->nuc_id, 2, $n->eve_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/alterar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-warning">
			        				Atualizar
			        			</a>
			        		<?php } ?>
			        	</td>
			        	<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 2)){ ?>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/aprovar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-success">
		        				Aprovar
		        			</a>
		        		</td>
		        		<?php } ?>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 2)){ ?>
			        			<?php if($n->evl_destaque == 0){ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/add_destaque_evento/" . $n->eve_id . "/"; ?>" class="btn btn-success">
			        					Destacar
			        				</a>
			        			<?php }else{ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/rmv_destaque_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
			        					Remover
			        				</a>

			        			<?php } ?>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->permissao_original_noticia("dup_ger_na", $nucleo->nuc_id, 2, $n->eve_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/duplicacao_evento/" . $n->eve_id . "/"; ?>" class="btn btn-warning">
			        				Duplicação
			        			</a>
			        		<?php } ?>
		        		</td>

        				<td>
        					<?php if($this->permissao_model->permissao_original_noticia("exc_ger_na", $nucleo->nuc_id, 2, $n->eve_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/apagar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
			        				Apagar
			        			</a>
			        		<?php } ?>
			        	</td>
		        	</tr>

		        <?php endforeach; ?>
			</tbody>
		</table>
		<?php } ?>
    </div>












    <div role="tabpanel" class="tab-pane fade" id="geral">
    	<?php if($this->permissao_model->verifica_permissao("lis_ger_a", $nucleo->nuc_id, 2)){ ?>
    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th> 
        			<th>eventos</th>
        			<th> 
        			<?php if($this->permissao_model->verifica_permissao("alt_ger_a", $nucleo->nuc_id, 2)){ ?>Atualizar<?php } ?>
        			</th> 
        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 2)){ ?>
        				<th>Reprovar</th>
        			<?php } ?>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 2)){ echo "Destaque"; } ?>
        			</th>

        			<?php if($this->permissao_model->verifica_permissao("dup_ger_a", $nucleo->nuc_id, 2)){ ?>
        				<th>Duplicação</th>
        			<?php } ?>
        			<?php if($this->permissao_model->verifica_permissao("exc_ger_a", $nucleo->nuc_id, 2)){ ?>
        			<th>Apagar</th> 
        			<?php } ?>
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($eventos_nucleo_a as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->eve_id; ?>
		        		</td>
		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/ver_evento/" . $n->eve_id . "/"; ?>"><?= $n->eve_titulo ?></a>
		        		</td>
		        		<td>
		        			<?php if($this->permissao_model->permissao_original_noticia("alt_ger_a", $nucleo->nuc_id, 2, $n->eve_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/alterar_evento/" . $n->eve_id; ?>" class="btn btn-warning">
			        				Atualizar
			        			</a>
		        			<?php } ?>
		        		</td>
		        		
		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 2)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/reprovar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
			        				Reprovar
			        			</a>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 2)){ ?>
			        			<?php if($n->evl_destaque == 0){ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/add_destaque_evento/" . $n->eve_id . "/"; ?>" class="btn btn-success">
			        					Destacar
			        				</a>
			        			<?php }else{ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/rmv_destaque_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
			        					Remover
			        				</a>

			        			<?php } ?>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->permissao_original_noticia("dup_ger_a", $nucleo->nuc_id, 2, $n->eve_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/duplicacao_evento/" . $n->eve_id . "/"; ?>" class="btn btn-warning">
			        				Duplicação
			        			</a>
			        		<?php } ?>
		        		</td>

		        		<td>
        					<?php if($this->permissao_model->permissao_original_noticia("exc_ger_a", $nucleo->nuc_id, 2, $n->eve_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/apagar_evento/" . $n->eve_id . "/"; ?>" class="btn btn-danger">
			        				Apagar
			        			</a>
		        			<?php } ?>
		        		</td>
		        	</tr>

		        <?php endforeach; ?>
			</tbody>
		</table>
		<?php } ?>
    </div>

  </div>

</div>
    <!-- /.row -->
    <div class="row">
        
    </div>
</div>