<?php

include("BaseDeDatos.php");

class ControladorCanciones {

    private $basededatos = null;

    public function __construct() {
        $this->basededatos = new BaseDeDatos();
    }
    public function canciones() {
        
        # obtener las canciones de la base de datos
        $canciones = $this->basededatos->select("canciones");
        

        # crear array de respuesta con las canciones
        $respuesta = array();
        # rellenar la respuesta con las canciones
        while ($fila = $canciones->fetch_assoc()) {

            $idCancion = $fila["idCancion"];
            $artistas = $this->get_artistas($idCancion);

            $fila["artistas"] = $artistas;
            array_push($respuesta, $fila);
        }

        # cerrar la conexion
        $this->basededatos->close();

        # devolver la respuesta
        return $respuesta;

    }


    private function get_artistas($idCancion){
        $join = "JOIN artistas ON idArtistaFK = idArtista";
        $where = "WHERE idCancionFK = $idCancion;";
        $respuesta_artistas = $this->basededatos->select("cancionartista", $join, $where);
        $artistas = array();
        while ($artista = $respuesta_artistas->fetch_assoc()) {
            array_push($artistas, $artista["nombreArtista"]);
        }
        return $artistas;
    }


}