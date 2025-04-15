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
                <a id="logo-container" href="#" class="brand-logo">
                    <?php echo __('accommodation_finder'); ?>
                </a>
                <div class="right" style="display: flex; gap: 10px; align-items: center;">
                <a href="?lang=es" title="Español">🇪🇸</a>
                <a href="?lang=en" title="English">🇺🇸</a>
                <a href="?lang=fr" title="Français">🇫🇷</a>
                <a href="?lang=zh" title="中文">🇨🇳</a>
                <a href="?lang=ar" title="العربية">🇸🇦</a>
                </div>

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