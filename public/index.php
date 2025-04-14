<?php
require_once '../config/db.php';
require_once '../controllers/HospedajeController.php';

use Controllers\HospedajeController;

$controller = new HospedajeController();
$controller->buscar($_GET['q'] ?? '');
