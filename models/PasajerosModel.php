<?php

require_once './db/BaseDatos.php';

class PasajerosModel extends Basedatos {

    private $table;
    private $conexion;

    /**
     * Constructor de la clase PasajerosModel.
     * Define el nombre de la tabla y obtiene la conexión a la base de datos.
     */
    public function __construct() {
        $this->table = "pasajeros";
        $this->conexion = $this->getConexion();
    }

    /**
     * Obtiene los nombres de los pasajeros desde la base de datos.
     *
     * @return array Array asociativo con los nombres de los pasajeros y sus códigos.
     */
    public function obtenerPasajeros() {
        $conexion = $this->getConexion();

        $query = "SELECT p.nombre ,p.pasajerocod
                  FROM pasajero p";

        // Preparar la consulta
        $stmt = $conexion->prepare($query);
        $stmt->execute();

        // Obtener los nombres de los pasajeros como un array asociativo
        $nombresDePasajeros = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $nombresDePasajeros;
    }
}
