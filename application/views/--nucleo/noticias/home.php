<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header"><?= $nucleo->nuc_nome; ?> - Notícias
            	<div style="float: right;">
            		<?php if($this->permissao_model->verifica_permissao("ins", $nucleo->nuc_id, 1)){ ?>
        				<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/inserir_noticia"; ?>" class="btn btn-success">Inserir</a>
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
    	<?php if($this->permissao_model->verifica_permissao("lis_sua_na", $nucleo->nuc_id, 1)){ ?>
    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th> 
        			<th>Noticias</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("alt_sua_na", $nucleo->nuc_id, 1)){ echo"Atualizar"; } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 1)){ ?>
	        				Aprovar
	        			<?php } ?>
        			</th>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 1)){ echo "Destaque"; } ?>
        			</th>

					<th>
	        			<?php if($this->permissao_model->verifica_permissao("dup_sua_na", $nucleo->nuc_id, 1)){ ?>
	        				Duplicação
	        			<?php } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("exc_sua_na", $nucleo->nuc_id, 1)){ ?>
	        				Apagar
	        			<?php } ?>
        			</th>
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($noticias_nucleo_suas_na as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->not_id; ?>
		        		</td>

		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/ver_noticia/" . $n->not_id . "/"; ?>"><?= $n->not_titulo ?></a>
		        		</td>
		        		
		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("alt_sua_na", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/alterar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-warning">
			        				Atualizar
			        			</a>
		        			<?php } ?>
		        		</td>
		        		
		        		
		        		<td>
		        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/aprovar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-success">
			        				Aprovar
			        			</a>
			        		<?php } ?>
		        		</td>
		        		

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 1)){ ?>
			        			<?php if($n->noo_destaque == 0){ ?>
			        				<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/destacar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-success">
			        					Destacar
			        				</a>
				        			<!--<form action="" method="post">
				        				<input type="hidden" name="id_noticia" value="<?= $n->not_id ?>">
				        				<input type="hidden" name="id_nucleo" value="<?= $nucleo->nuc_id ?>">
				        				<input type="submit" name="destacar_noticia" value="Destacar" class="btn btn-success">
				        			</form>-->
			        			<?php }else{ ?>
			        				<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/remover_destaque/" . $n->not_id . "/"; ?>" class="btn btn-danger">
			        					Remover
			        				</a>
				        			<!--<form action="" method="post">
				        				<input type="hidden" name="id_noticia" value="<?= $n->not_id ?>">
				        				<input type="hidden" name="id_nucleo" value="<?= $nucleo->nuc_id ?>">
				        				<input type="submit" name="remover_destaque" value="Remover" class="btn btn-danger">
				        			</form>-->
			        			<?php } ?>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("dup_sua_na", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/duplicacao_noticia/" . $n->not_id . "/"; ?>" class="btn btn-warning">
			        				Duplicação
			        			</a>
			        		<?php } ?>
		        		</td>

		        		
		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("exc_sua_na", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/apagar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-danger">
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
	







	
	<div role="tabpanel" class="tab-pane fade" id="suas">
		<?php if($this->permissao_model->verifica_permissao("lis_sua_a", $nucleo->nuc_id, 1)){ ?>
    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th>

        			<th>Noticias</th>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("alt_sua_a", $nucleo->nuc_id, 1)){ ?>
        					Atualizar
        				<?php } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 1)){ ?>
	        				Reprovar
	        			<?php } ?>
					</th>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 1)){ echo "Destaque"; } ?>
        			</th>

					<th>
	        			<?php if($this->permissao_model->verifica_permissao("dup_sua_a", $nucleo->nuc_id, 1)){ ?>
	        				Duplicação
	        			<?php } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("exc_sua_a", $nucleo->nuc_id, 1)){ ?>
	        				Apagar
	        			<?php } ?>
        			</th>
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($noticias_nucleo_suas_a as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->not_id; ?>
		        		</td>

		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/ver_noticia/" . $n->not_id . "/"; ?>"><?= $n->not_titulo ?></a>
		        		</td>
		        		
		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("alt_sua_a", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/alterar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-warning">
			        				Atualizar
			        			</a>
			        		<?php } ?>
		        		</td>
		        		
		        		<td>
		        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/reprovar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-danger">
			        				Reprovar
			        			</a>
			        		<?php } ?>
		        		</td>
		        		
		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 1)){ ?>
			        			<?php if($n->noo_destaque == 0){ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/destacar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-success">
			        					Destacar
			        				</a>
			        			<?php }else{ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/remover_destaque/" . $n->not_id . "/"; ?>" class="btn btn-danger">
			        					Remover
			        				</a>

			        			<?php } ?>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("dup_sua_a", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/duplicacao_noticia/" . $n->not_id . "/"; ?>" class="btn btn-warning">
			        				Duplicação
			        			</a>
			        		<?php } ?>
		        		</td>

						<td>
			        		<?php if($this->permissao_model->verifica_permissao("exc_sua_a", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/apagar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-danger">
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
	










    <div role="tabpanel" class="tab-pane fade" id="geralna">
    	<?php if($this->permissao_model->verifica_permissao("lis_ger_na", $nucleo->nuc_id, 1)){ ?>
    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th>

        			<th>Noticias</th>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("alt_ger_na", $nucleo->nuc_id, 1)){ ?>Atualizar<?php } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 1)){ ?>
	        				Aprovar
	        			<?php } ?>
	        		</th>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 1)){ echo "Destaque"; } ?>
        			</th>

					<th>
	        			<?php if($this->permissao_model->verifica_permissao("dup_ger_na", $nucleo->nuc_id, 1)){ ?>
	        				Duplicação
	        			<?php } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("exc_ger_na", $nucleo->nuc_id, 1)){ ?>
	        				Apagar
	        			<?php } ?>
        			</th> 
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($noticias_nucleo_na as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->not_id; ?>
		        		</td>

		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/ver_noticia/" . $n->not_id . "/"; ?>"><?= $n->not_titulo ?></a>
		        		</td>

		        		<td>
		        			<?php if($this->permissao_model->permissao_original_noticia("alt_ger_na", $nucleo->nuc_id, 1, $n->not_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/alterar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-warning">
			        				Atualizar
			        			</a>
			        		<?php } ?>
			        	</td>

			        	<td>
				        	<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/aprovar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-success">
			        				Aprovar
			        			</a>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 1)){ ?>
			        			<?php if($n->noo_destaque == 0){ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/destacar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-success">
			        					Destacar
			        				</a>
			        			<?php }else{ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/remover_destaque/" . $n->not_id . "/"; ?>" class="btn btn-danger">
			        					Remover
			        				</a>

			        			<?php } ?>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->permissao_original_noticia("dup_ger_na", $nucleo->nuc_id, 1, $n->not_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/duplicacao_noticia/" . $n->not_id . "/"; ?>" class="btn btn-warning">
			        				Duplicação
			        			</a>
			        		<?php } ?>
		        		</td>

        				<td>
        					<?php if($this->permissao_model->permissao_original_noticia("exc_ger_na", $nucleo->nuc_id, 1, $n->not_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/apagar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-danger">
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
    	<?php if($this->permissao_model->verifica_permissao("lis_ger_a", $nucleo->nuc_id, 1)){ ?>
    	<table class="table table-hover">
        	<thead> 
        		<tr> 
        			<th>#</th>

        			<th>Noticias</th>

        			<th> 
        				<?php if($this->permissao_model->verifica_permissao("alt_ger_a", $nucleo->nuc_id, 1)){ ?>Atualizar<?php } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 1)){ ?>
	        				Reprovar
	        			<?php } ?>
        			</th>

        			<th>
        				<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 1)){ echo "Destaque"; } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("dup_ger_a", $nucleo->nuc_id, 1)){ ?>
	        				Duplicação
	        			<?php } ?>
        			</th>

        			<th>
	        			<?php if($this->permissao_model->verifica_permissao("exc_ger_a", $nucleo->nuc_id, 1)){ ?>
	        				Apagar 
	        			<?php } ?>
        			</th>
        		</tr> 
        	</thead> 

        	<tbody> 
		        <?php foreach ($noticias_nucleo_a as $n): ?>
		        	<tr>
		        		<td>
		        			<?= $n->not_id; ?>
		        		</td>

		        		<td>
		        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/ver_noticia/" . $n->not_id . "/"; ?>"><?= $n->not_titulo ?></a>
		        		</td>
		        		
		        		<td>
		        			<?php if($this->permissao_model->permissao_original_noticia("alt_ger_a", $nucleo->nuc_id, 1, $n->not_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/alterar_noticia/" . $n->not_id; ?>" class="btn btn-warning">
			        				Atualizar
			        			</a>
		        			<?php } ?>
		        		</td>
		        		
		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("apr", $nucleo->nuc_id, 1)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/reprovar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-danger">
			        				Reprovar
			        			</a>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->verifica_permissao("des", $nucleo->nuc_id, 1)){ ?>
			        			<?php if($n->noo_destaque == 0){ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/destacar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-success">
			        					Destacar
			        				</a>
			        			<?php }else{ ?>
				        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/remover_destaque/" . $n->not_id . "/"; ?>" class="btn btn-danger">
			        					Remover
			        				</a>

			        			<?php } ?>
			        		<?php } ?>
		        		</td>

		        		<td>
			        		<?php if($this->permissao_model->permissao_original_noticia("dup_ger_a", $nucleo->nuc_id, 1, $n->not_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/duplicacao_noticia/" . $n->not_id . "/"; ?>" class="btn btn-warning">
			        				Duplicação
			        			</a>
			        		<?php } ?>
		        		</td>

		        		<td>
        					<?php if($this->permissao_model->permissao_original_noticia("exc_ger_a", $nucleo->nuc_id, 1, $n->not_id)){ ?>
			        			<a href="<?= base_url() . "painel/nucleo/" . $nucleo->nuc_id . "/apagar_noticia/" . $n->not_id . "/"; ?>" class="btn btn-danger">
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