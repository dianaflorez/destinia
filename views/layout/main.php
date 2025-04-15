<!DOCTYPE html>
<html>
<head>
    <title>Hospedajes</title>
    <link rel="stylesheet" href="css/materialize.min.css">
    <link rel="stylesheet" href="css/general.css">
    <title>Buscador de Hospedajes</title>
</head>
<body>
    <header class="page-header">
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="#" class="brand-logo">Buscador de Hospedajes</a>
            </div>
        </nav>
    </header>

    <main class="container">
        <?php if (isset($content)) { include $content; } ?>
    </main>

    <footer class="page-footer light-blue lighten-1 footer-general">
        <div class="footer-copyright">
            <div class="container">
                © <?php echo date("Y"); ?> Mi Sitio de Hospedajes
            </div>
        </div>
    </footer>

    <script src="js/materialize.min.js"></script>
</body>
</html>