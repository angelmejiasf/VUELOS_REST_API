<?php

require_once './db/BaseDatos.php';
require_once './models/PasajeModel.php';
$pasajemodel = new PasajeModel();
@header("Content-type: application/json");



if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idpasaje'])) {
        $idPasaje = $_GET['idpasaje'];
        $res = $pasajemodel->obtenerPasajePorId($idPasaje);
    } else {
        $res = $pasajemodel->mostrarPasajes();
    }

    echo json_encode($res);
    exit();
}


// Crear un nuevo pasaje (POST)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener los datos del cuerpo de la solicitud
    $post = json_decode(file_get_contents('php://input'), true);
    // Guardar el pasaje en la base de datos
    $res = $pasajemodel->insertarPasaje($post);
    $resul['resultado'] = $res;
    echo json_encode($resul);
    exit();
}

// Actualizar un pasaje (PUT)
if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    // Obtener los datos del cuerpo de la solicitud
    $post = json_decode(file_get_contents('php://input'), true);
    // Actualizar el pasaje en la base de datos
    $res = $pasajemodel->actualizarPasaje($post);
    $resul['mensaje'] = $res;
    echo $resul['mensaje'];
    exit();
}

// Borrar un pasaje (DELETE)
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    // Obtener el ID del pasaje a borrar
    $id = $_GET['id'];
    // Borrar el pasaje de la base de datos
    $res = $pasajemodel->borrarPasaje($id);
    $resul['resultado'] = $res;
    echo $resul['resultado'];
    exit();
}