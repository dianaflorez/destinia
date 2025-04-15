<?php
$controllerName = isset($_GET['controller']) ? ucfirst($_GET['controller']) . 'Controller' : 'HospedajeController';
$action = $_GET['action'] ?? 'index';

$controllerFile = "../controllers/{$controllerName}.php";

if (file_exists($controllerFile)) {
    require_once $controllerFile;

    if (class_exists($controllerName)) {
        $controller = new $controllerName();

        if (method_exists($controller, $action)) {
            $controller->$action();
        } else {
            echo "Error: El método '$action' no existe en el controlador '$controllerName'.";
        }
    } else {
        echo "Error: Clase '$controllerName' no encontrada.";
    }
} else {
    echo "Error: Archivo del controlador '$controllerFile' no encontrado.";
}
