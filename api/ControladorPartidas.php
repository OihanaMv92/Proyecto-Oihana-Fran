<?php

include("BaseDeDatos.php");

class ControladorPartidas
{

    public $basededatos = null;

    public function __construct() {
        $this->basededatos = new BaseDeDatos();
    }

    public function ranking() {

        $ranking = $this->basededatos->ranking();

        # crear array de respuesta con el ranking
        $respuesta = array();
        # rellenar la respuesta con las canciones
        while ($fila = $ranking->fetch_assoc()) {
            array_push($respuesta, $fila);
        }

        return $respuesta;
    }
    public function insertar_partida($idusuario){
        return $this->basededatos->insertar("partidas", "(NULL, NULL, NOW(), $idusuario)");
    }
    public function insertar_respuesta($idpartida,$puntos,$idcancion,$idcancionrespuesta){
        return $this->basededatos->insertar("respuestas", "(NULL, $puntos, $idpartida, $idcancion, $idcancionrespuesta)");
    }
}
