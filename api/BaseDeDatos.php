<?php

class BaseDeDatos {

    public $host = '127.0.0.1';
    public $username = 'root';
    public $password = 'Studium2020;';
    public $name = 'juegocanciones';
    public $conexion = null;

    public function __construct() {

        $this->conexion = mysqli_init();
        mysqli_real_connect($this->conexion, $this->host, $this->username, $this->password, $this->name);
        $this->conexion->set_charset("utf8");

    }

    public function close() {

        $this->conexion->close();

    }
    
    public function select($table, $join="", $where="") {

        $sentencia = "SELECT * FROM $table $join $where";
        
        return mysqli_query($this->conexion, $sentencia);

    }

    public function insertar($table, $values) {

        $sentencia = "INSERT INTO $table VALUES $values";

        return mysqli_query($this->conexion, $sentencia);

    }
    public function ranking() {

        $sentencia = "SELECT idPartida, aliasUsuario, tiempoPartida, fechaPartida, SUM(puntuacionRespuesta) puntuacion 
                        FROM respuestas 
                        JOIN partidas ON idPartida = idPartidaFK 
                        JOIN usuarios ON idUsuarioFK = idUsuario
                        GROUP BY idPartida 
                        ORDER BY puntuacion 
                        DESC LIMIT 10;";

        return mysqli_query($this->conexion, $sentencia);

    }

}