<?php if($avisos == 0){ ?>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Apagar evento <small><?= $evento->eve_titulo; ?></small></h1>
            <h3><b>Tem certeza que deseja apagar o evento: </b><?= $evento->eve_titulo; ?> <b>?</b></h3>
            <br>
            <form action="" method="post">
                <input type="submit" name="apagar_evento" value="Sim" class="btn btn-warning">  
                
                    <a href="../../eventos" class="btn btn-danger">Não</a>
                
            </form>

        </div>
    </div>
<div>
<?php }else{ ?>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <?php if(isset($sucesso)){ ?>
                <div class="alert alert-success alert-dismissible" role="alert" style="margin-top: 15px;">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>Sucesso!</strong> <?= $sucesso; ?>
                </div>
            <?php } if(isset($erro)){ ?>
                <div class="alert alert-danger alert-dismissible" role="alert" style="margin-top: 15px;">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>Erro!</strong> <?= $erro; ?>
                </div>
            <?php } ?>
        </div>
    </div>
<div>
<?php } ?>