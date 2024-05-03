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
        $conexion = $this->db->getConexion();

        // Consulta 
        $query = "SELECT vuelo.identificador AS id_vuelo, origen.codigo AS codigo_origen, origen.nombre AS nombre_origen, origen.pais AS pais_origen, destino.codigo AS codigo_destino, destino.nombre AS nombre_destino, destino.pais AS pais_destino, vuelo.tipo, COUNT(pasaje.identificador) AS num_pasajeros FROM vuelo INNER JOIN aeropuerto AS origen ON vuelo.origen = origen.codigo INNER JOIN aeropuerto AS destino ON vuelo.destino = destino.codigo LEFT JOIN pasaje ON vuelo.identificador = pasaje.identificador WHERE vuelo.identificador = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param("i", $id_vuelo);
        $stmt->execute();
        $result = $stmt->get_result();

        $vuelo = $result->fetch_assoc();

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
