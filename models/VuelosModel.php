<?php

require_once './db/BaseDatos.php';

class VuelosModel extends Basedatos {

    private $table;
    private $conexion;

    /**
     * Constructor de la clase VuelosModel.
     * Define el nombre de la tabla y obtiene la conexión a la base de datos.
     */
    public function __construct() {
        $this->table = "vuelos";
        $this->conexion = $this->getConexion();
    }

    /**
     * Obtiene todos los vuelos desde la base de datos.
     *
     * @return array Array asociativo con la información de todos los vuelos.
     */
    public function obtenerTodosLosVuelos() {
        $conexion = $this->getConexion();

        // Consulta para obtener todos los vuelos
        $query = "SELECT * FROM vuelo";
        // Preparar la consulta
        $stmt = $conexion->prepare($query);
        $stmt->execute();

        // Obtener los resultados como un array asociativo
        $vuelos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $vuelos;
    }

    /**
     * Obtiene la información de un vuelo por su ID desde la base de datos.
     *
     * @param int $id_vuelo ID del vuelo.
     * @return array Array asociativo con la información del vuelo.
     */
    public function obtenerInfoVuelo($id_vuelo) {
        $conexion = $this->getConexion();
        ;

        // Consulta 
        $query = "SELECT * FROM vuelo WHERE identificador=:identificador";
        $stmt = $conexion->prepare($query);
        $stmt->bindparam(":identificador", $id_vuelo);
        $stmt->execute();
       

        $vuelo = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $vuelo;
    }

    /**
     * Obtiene los identificadores de los vuelos desde la base de datos.
     *
     * @return array Array asociativo con los identificadores de los vuelos.
     */
    public function obtenerIdentificador() {
        $conexion = $this->getConexion();

        // Consulta
        $query = "SELECT v.aeropuertoorigen ,v.aeropuertodestino,v.identificador
                  FROM vuelo v";

        // Preparar la consulta
        $stmt = $conexion->prepare($query);
        $stmt->execute();

        // Obtener los nombres de los pasajeros como un array asociativo
        $identificador = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $identificador;
    }
}
