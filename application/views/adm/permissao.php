<script type="text/javascript">
	function aluno() {
		document.getElementById("ins").checked = true;
		document.getElementById("lis_sua_na").checked = true;
		document.getElementById("lis_sua_a").checked = true;
		document.getElementById("alt_sua_na").checked = true;
		document.getElementById("exc_sua_na").checked = true;
	}
	function estagiario() {
		document.getElementById("ins").checked = true;
		document.getElementById("lis_sua_na").checked = true;
		document.getElementById("lis_sua_a").checked = true;
		document.getElementById("lis_ger_na").checked = true;
		document.getElementById("lis_ger_a").checked = true;
		document.getElementById("alt_sua_na").checked = true;
		document.getElementById("alt_ger_na").checked = true;
		document.getElementById("exc_sua_na").checked = true;
		document.getElementById("exc_ger_na").checked = true;
	}
	function prof() {
		document.getElementById("ins").checked = true;
		document.getElementById("lis_sua_na").checked = true;
		document.getElementById("lis_sua_a").checked = true;
		document.getElementById("lis_ger_na").checked = true;
		document.getElementById("lis_ger_a").checked = true;
		document.getElementById("alt_sua_na").checked = true;
		document.getElementById("alt_sua_a").checked = true;
		document.getElementById("alt_ger_na").checked = true;
		document.getElementById("exc_sua_na").checked = true;
		document.getElementById("exc_sua_a").checked = true;
		document.getElementById("exc_ger_na").checked = true;
		document.getElementById("dup_sua_na").checked = true;
		document.getElementById("dup_sua_a").checked = true;
		document.getElementById("dup_ger_na").checked = true;
		document.getElementById("des").checked = true;
	}
	function coord() {
		document.getElementById("ins").checked = true;
		document.getElementById("lis_sua_na").checked = true;
		document.getElementById("lis_sua_a").checked = true;
		document.getElementById("lis_ger_na").checked = true;
		document.getElementById("lis_ger_a").checked = true;
		document.getElementById("alt_sua_na").checked = true;
		document.getElementById("alt_sua_a").checked = true;
		document.getElementById("alt_ger_na").checked = true;
		document.getElementById("alt_ger_a").checked = true;
		document.getElementById("exc_sua_na").checked = true;
		document.getElementById("exc_sua_a").checked = true;
		document.getElementById("exc_ger_na").checked = true;
		document.getElementById("exc_ger_a").checked = true;
		document.getElementById("dup_sua_na").checked = true;
		document.getElementById("dup_sua_a").checked = true;
		document.getElementById("dup_ger_na").checked = true;
		document.getElementById("dup_ger_a").checked = true;
		document.getElementById("des").checked = true;
		document.getElementById("apr").checked = true;
	}
	function limpa() {
		document.getElementById("ins").checked = false;
		document.getElementById("lis_sua_na").checked = false;
		document.getElementById("lis_sua_a").checked = false;
		document.getElementById("lis_ger_na").checked = false;
		document.getElementById("lis_ger_a").checked = false;
		document.getElementById("alt_sua_na").checked = false;
		document.getElementById("alt_sua_a").checked = false;
		document.getElementById("alt_ger_na").checked = false;
		document.getElementById("alt_ger_a").checked = false;
		document.getElementById("exc_sua_na").checked = false;
		document.getElementById("exc_sua_a").checked = false;
		document.getElementById("exc_ger_na").checked = false;
		document.getElementById("exc_ger_a").checked = false;
		document.getElementById("dup_sua_na").checked = false;
		document.getElementById("dup_sua_a").checked = false;
		document.getElementById("dup_ger_na").checked = false;
		document.getElementById("dup_ger_a").checked = false;
		document.getElementById("des").checked = false;
		document.getElementById("apr").checked = false;
	}
</script>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Administração - Permissões</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
<div>


<form action="<?= base_url(); ?>admin/aplica_permissao" method="post">
	<div class="form-group">
		<label>Sistema: </label>
		<select id="teste" class="form-control" name="sistema">
	        <option>Escolha um sistema</option>
	        <?php foreach ($todos_sistemas as $n){ ?>
	        	<option onclick="ajax('permissao_nucleos', 'permissao_mostra_nucleos', '<?= $n->sis_id; ?>');" value="<?= $n->sis_id; ?>"><?= $n->sis_nome; ?></option>
	        <?php } ?>
	    </select>
	</div>

	<div class="form-group" id="permissao_nucleos">
		
	</div>

	<div class="form-group" id="permissao_usuarios">
		
	</div>

	<div class="form-group" id="permissao_permissao">
		
	</div>

	<div align="right">
		<input name="puxar" type="submit" class="btn btn-success" value="Gravar">
	</div>

	<div id="teste" class="row" style="display: none;">
	<input onclick="aax('permissao_nucleos', 'permissao_mostra_nucleos', '1')" value="teste" />

	

	<p onclick="alert('Click event triggered')">This is a paragraph.</p>

	</div>
</form>





</div>
    <!-- /.row -->
    <div class="row">
        
    </div>
</div>
