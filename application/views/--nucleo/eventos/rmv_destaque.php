<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Remover destaque <small><?= $evento->eve_titulo; ?></small></h1>
            <h3><b>Tem certeza que deseja remover o destaque da evento: </b><?= $evento->eve_titulo; ?> <b>?</b></h3>
            <br>
            <form action="" method="post">
                <input type="hidden" name="id_evento" value="<?= $evento->eve_id ?>">
                <input type="submit" name="rmv_destaque_evento" value="Sim" class="btn btn-success">  
                
                    <a href="../../eventos" class="btn btn-danger">Não</a>
                
            </form>

        </div>
    </div>
<div>