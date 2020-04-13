<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Remover destaque <small><?= $noticia->not_titulo; ?></small></h1>
            <h3><b>Tem certeza que deseja remover o destaque da noticia: </b><?= $noticia->not_titulo; ?> <b>?</b></h3>
            <br>
            <form action="" method="post">
                <input type="hidden" name="id_noticia" value="<?= $noticia->not_id ?>">
                <input type="submit" name="remover_destaque" value="Sim" class="btn btn-success">  
                
                    <a href="../../noticias" class="btn btn-danger">Não</a>
                
            </form>

        </div>
    </div>
<div>