<?php
require_once __DIR__ . '/../models/Hospedaje.php';

class HospedajeController {

    public function buscar() {
        // Obtener las primeras 3 letras desde la entrada estándar o un parámetro
        $input = trim(fgets(STDIN)); // para entrada estándar
        $prefijo = substr($input, 0, 3);

        $modelo = new Hospedaje();
        $resultados = $modelo->buscarPorPrefijoNombre($prefijo);

        foreach ($resultados as $hospedaje) {
            if ($hospedaje['type'] === 'hotel') {
                echo "Hotel {$hospedaje['name']}, {$hospedaje['stars']} estrellas, habitación {$hospedaje['room_type']}, {$hospedaje['city']}, {$hospedaje['province']}\n";
            } elseif ($hospedaje['type'] === 'apartment') {
                echo "Apartamentos {$hospedaje['name']}, {$hospedaje['total_apartments']} apartamentos, {$hospedaje['max_adults']} adultos, {$hospedaje['city']}, {$hospedaje['province']}\n";
            }
        }
    }
}
