<?php

class PasajeModel {

    private $db;
    private $table;

    /**
     * Constructor de la clase PasajeModel.
     * Establece la conexión a la base de datos y define el nombre de la tabla.
     */
    public function __construct() {
        $this->db = new Basedatos();
        $this->table = "pasaje";
    }

    /**
     * Inserta un nuevo pasaje en la base de datos.
     *
     * @param array $post Datos del pasaje a insertar.
     * @return string Mensaje indicando el resultado de la operación.
     */
    public function insertarPasaje($post) {
        try {
            // Comprobar si el pasajero y el vuelo ya existen en la tabla pasajes
            $query = "SELECT * FROM $this->table WHERE pasajerocod = ? AND identificador = ?";
            $stmt = $this->db->getConexion()->prepare($query);
            $stmt->bindParam(1, $post['pasajerocod']);
            $stmt->bindParam(2, $post['identificador']);
            $stmt->execute();
            if ($stmt->rowCount() > 0) {
                return "<h2>ERROR AL INSERTAR. EL PASAJERO " . $post['pasajerocod'] . " YA ESTÁ EN EL VUELO " . $post['identificador'] . "</h2>";
            }

            // Comprobar si el asiento está ocupado en el mismo vuelo
            $query = "SELECT * FROM $this->table WHERE identificador = ? AND numasiento = ?";
            $stmt = $this->db->getConexion()->prepare($query);
            $stmt->bindParam(1, $post['identificador']);
            $stmt->bindParam(2, $post['numasiento']);
            $stmt->execute();
            if ($stmt->rowCount() > 0) {
                return "<h2>ERROR AL INSERTAR. EL NÚMERO DE ASIENTO " . $post['numasiento'] . " YA ESTÁ OCUPADO EN EL VUELO " . $post['identificador'] . "</h2>";
            }

            // Si no hay problemas, insertar el pasaje
            $sql = "INSERT INTO $this->table (pasajerocod, identificador, numasiento, clase, pvp) VALUES (?, ?, ?, ?, ?)";
            $sentencia = $this->db->getConexion()->prepare($sql);
            $sentencia->bindParam(1, $post['pasajerocod']);
            $sentencia->bindParam(2, $post['identificador']);
            $sentencia->bindParam(3, $post['numasiento']);
            $sentencia->bindParam(4, $post['clase']);
            $sentencia->bindParam(5, $post['pvp']);
            $num = $sentencia->execute();

            // Verificar si la inserción fue exitosa
            if ($num) {
                return "<h2>REGISTRO INSERTADO CORRECTAMENTE</h2>";
            } else {
                return "<h2>ERROR: No se ha podido insertar el pasaje</h2>";
            }
        } catch (PDOException $e) {
            return "<h2>ERROR: No se ha podido insertar el pasaje</h2>";
        }
    }

    public function borrarPasaje($idpasaje) {
        $conexion = $this->db->getConexion();

// Verificar si el pasaje existe
        $query = "SELECT * FROM pasaje WHERE idpasaje = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param("i", $idpasaje);
        $stmt->execute();
        $stmt->store_result();

        if ($stmt->num_rows === 0) {
            return "ERROR AL BORRAR. EL PASAJE NO EXISTE";
        }

// Borrar el pasaje
        $query = "DELETE FROM pasaje WHERE idpasaje = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param("i", $idpasaje);

        if ($stmt->execute()) {
            return "PASAJE BORRADO CORRECTAMENTE";
        } else {
            return "ERROR AL BORRAR EL PASAJE";
        }
    }

    public function actualizarPasaje($pasaje) {
        $conexion = $this->db->getConexion();

// Verificar si el pasajero y el vuelo ya existen en la tabla pasajes
        $query = "SELECT * FROM pasaje WHERE pasajerocod = ? AND identificador = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param("is", $pasaje->pasajerocod, $pasaje->identificador);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            return "ERROR AL ACTUALIZAR. EL PASAJERO " . $pasaje->pasajerocod . " YA ESTÁ EN EL VUELO " . $pasaje->identificador;
        }
        $stmt->close();

// Verificar si el asiento está ocupado en el mismo vuelo
        $query = "SELECT * FROM pasaje WHERE identificador = ? AND numasiento = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param("si", $pasaje->identificador, $pasaje->numasiento);
        $stmt->execute();
        $stmt->store_result();
        if ($stmt->num_rows > 0) {
            return "ERROR AL ACTUALIZAR. EL NÚMERO DE ASIENTO " . $pasaje->numasiento . " YA ESTÁ OCUPADO EN EL VUELO " . $pasaje->identificador;
        }
        $stmt->close();

// Actualizar el pasaje
        $query = "UPDATE pasaje SET pasajerocod = ?, identificador = ?, numasiento = ?, clase = ?, pvp = ? WHERE idpasaje = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param("issidi", $pasaje->pasajerocod, $pasaje->identificador, $pasaje->numasiento, $pasaje->clase, $pasaje->pvp, $pasaje->idpasaje);

        if ($stmt->execute()) {
            return "REGISTRO ACTUALIZADO CORRECTAMENTE";
        } else {
            return "ERROR AL ACTUALIZAR EL PASAJE";
        }
    }
}
