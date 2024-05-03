<?php

require_once './db/BaseDatos.php';
require_once './models/VuelosModel.php';
$vuelosModel = new VuelosModel();
@header("Content-type: application/json");

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idpasaje'])) {
        $res = $vuelosModel->obtenerInfoVuelo($_GET['idpasaje']);
        echo json_encode($res);
        exit();
    } else {
        $res = $vuelosModel->obtenerTodosLosVuelos();
        
        echo json_encode($res);
        exit();
    }
    
    
}

// En caso de que ninguna de las opciones anteriores se haya ejecutado 
header("HTTP/1.1 400 Bad Request"); 