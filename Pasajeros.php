<?php

require_once './db/BaseDatos.php';
require_once './models/PasajerosModel.php';

$pasajerosModel = new PasajerosModel();
@header("Content-type: application/json");

if ($_SERVER['REQUEST_METHOD'] == 'GET') {


    $res = $pasajerosModel->obtenerPasajeros();
    echo json_encode($res);
    exit();
}

// En caso de que ninguna de las opciones anteriores se haya ejecutado 
header("HTTP/1.1 400 Bad Request");
