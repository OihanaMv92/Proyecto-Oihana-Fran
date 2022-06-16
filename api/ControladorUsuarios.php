<?php

include("BaseDeDatos.php");

class ControladorUsuarios {

    public $basededatos = null;

    public function __construct() {
        $this->basededatos = new BaseDeDatos();
    }

    public function iniciarsesion($usuario,$password){
        $where = "WHERE nombreUsuario = '$usuario' AND passwordUsuario = MD5('$password');";

        // pide a la base de datos, si hay alguna fila con ese nombre y esa contraseña
        $users = $this->basededatos->select("usuarios", $where);
        
        if(mysqli_num_rows($users)==0){
            return 0;
        } else {
            $user = $users->fetch_assoc();
            return $user["idUsuario"];
        }
        // // devuelve el número de resultados
        // return mysqli_num_rows();
    }

    private function nombre_repetido($nombre){
        $where = "WHERE nombreUsuario = '$nombre';";
        $respuesta = $this->basededatos->select("usuarios",$where);
        $repetido = mysqli_num_rows($respuesta);
        return $repetido != 0;
    }

    public function register($usuario, $password, $alias, $permisos){

        $nombrerepetido = $this->nombre_repetido($usuario);

        if($nombrerepetido){
            return "Nombre de usuario ya en uso.";
        }

        $values = "(NULL, '$usuario', MD5('$password'), '$alias', $permisos)";
        $respuesta = $this->basededatos->insertar("usuarios", $values);

        if($respuesta){
            return true;
        } else {
            return "Error al registrarse";
        }

    }

}