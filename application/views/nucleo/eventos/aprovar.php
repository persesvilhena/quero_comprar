<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Aprovar evento <small><?= $evento->eve_titulo; ?></small></h1>
            <h3><b>Tem certeza que deseja aprovar a evento: </b><?= $evento->eve_titulo; ?> <b>?</b></h3>
            <br>
            <form action="" method="post">
                <input type="submit" name="aprovar" value="Sim" class="btn btn-success">
                <a href="../../eventos" class="btn btn-danger">Não</a>
            </form>
            <div style="float: right;">
                
            </div>
        </div>
    </div>
<div>