
    </div>
    <!-- jQuery -->
    <script src="<?= base_url(); ?>assets/admin/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<?= base_url(); ?>assets/admin/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="<?= base_url(); ?>assets/admin/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="<?= base_url(); ?>/assets/admin/vendor/datatables/js/jquery.dataTables.js"></script>
    <script src="<?= base_url(); ?>/assets/admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="<?= base_url(); ?>/assets/admin/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<?= base_url(); ?>assets/admin/vendor/raphael/raphael.min.js"></script>
    <script src="<?= base_url(); ?>assets/admin/vendor/morrisjs/morris.min.js"></script>
    <script src="<?= base_url(); ?>assets/admin/data/morris-data.js"></script>

    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
    
    <script>
    // tooltip demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })
    // popover demo
    $("[data-toggle=popover]")
        .popover()
    </script>
    <!-- Custom Theme JavaScript -->
    <script src="<?= base_url(); ?>assets/admin/dist/js/sb-admin-2.js"></script>
    <script type="text/javascript">
    $(document).on("input", "#not_titulo", function() {
        var limite = 60;
        var informativo = "caracteres restantes.";
        var caracteresDigitados = $(this).val().length;
        var caracteresRestantes = limite - caracteresDigitados;

        if (caracteresRestantes <= 0) {
            var not_titulo = $("textarea[name=not_titulo]").val();
            $("textarea[name=not_titulo]").val(not_titulo.substr(0, limite));
            $(".caracteres").text("0 " + informativo);
        } else {
            $(".caracteres").text(caracteresRestantes + " " + informativo);
        }
    });
    </script>

</body>

</html>
