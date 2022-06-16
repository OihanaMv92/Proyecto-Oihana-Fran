<?php

// los putos CORS de los cojones 
header('Access-Control-Allow-Origin: *'); 
header("Access-Control-Allow-Credentials: true");
// header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, HEAD, OPTIONS");
header('Access-Control-Max-Age: 1000');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization');


// la api :)
$request = $_SERVER['REQUEST_URI'];
$request = explode("/",$request);

# al menos 1 parametro
if(count($request) >= 3){

    $root = $request[2];

    # parametro dentro de lo buscado
    switch ($root) {
        case 'canciones':
            
            // pide a la base de datos las canciones
            include("ControladorCanciones.php");
            $controladorcanciones = new ControladorCanciones();
            $canciones = $controladorcanciones->canciones();
        
            // de volver canciones
            response(200, "Canciones", $canciones);

            break;

        case 'login':
            
            // odio angular
            $_POST = json_decode(file_get_contents('php://input'), true);

            if( isset($_POST["nombre"]) && isset($_POST["contrasena"]) ){
                $nombre = $_POST["nombre"];
                $contrasena = $_POST["contrasena"];
                iniciarsesion($nombre, $contrasena);
            } else {
                response(200, "Faltan credenciales", NULL);
            }
            
            break;
        case 'ranking':
            
            ranking();

            break;
        case 'partida':
            
            // odio angular
            $_POST = json_decode(file_get_contents('php://input'), true);
            
            // hay que tener el ID del usuario a quien poner en la partida
            if( isset($_POST["idusuario"]) ){
                $idusuario = $_POST["idusuario"];
                insertar_partida($idusuario);
            } else {
                response(200, "Falta id", NULL);
            }

            break;
        case 'respuesta': 

            // odio angular
            $_POST = json_decode(file_get_contents('php://input'), true);

            // ID de la partida a la que está relacioada la respuesta
            // puntos que se ha llevado por la respuesta, 
            // id de la cancion que era la respuesta correcta,
            // id de la cancion que se ha respondido
            if( isset($_POST["idpartida"]) && isset($_POST["puntos"]) && isset($_POST["idcancion"]) && isset($_POST["idcancionrespuesta"]) ){
                $idpartida          = $_POST["idpartida"];
                $puntos             = $_POST["puntos"];
                $idcancion          = $_POST["idcancion"];
                $idcancionrespuesta = $_POST["idcancionrespuesta"];
                insertar_respuesta($idpartida, $puntos, $idcancion, $idcancionrespuesta);
            } else {
                response(200, "Faltan datos", NULL);
            }

            break;
        case 'register':

            // odio angular
            $_POST = json_decode(file_get_contents('php://input'), true);
            
            // datos de credenciales
            if( isset($_POST["nombre"]) && isset($_POST["contrasena"]) && isset($_POST["contrasenarepetida"]) ){
                # alias y permisos
                if(isset($_POST["alias"])){
                    if(isset($_POST["permisos"])){

                        # register
                        $nombre             = $_POST["nombre"];
                        $contrasena         = $_POST["contrasena"];
                        $contrasenarepetida = $_POST["contrasenarepetida"];
                        $alias              = $_POST["alias"];
                        $permisos           = $_POST["permisos"];
        
                        if(strlen($nombre) >= 3){
                            if(strlen($alias) >= 3){
                                if($contrasena == $contrasenarepetida){
                                    register($nombre, $contrasena, $alias, $permisos);
                                } else { // las contraseñas no coinciden
                                    response(200, "Las contraseñas no coinciden", NULL);
                                }
                            } else {
                                response(200, "Error", "Alias muy corto.");
                            }
                        } else {
                            response(200, "Error", "Nombre muy corto.");
                        }
                    } else {
                        response(200, "Error", "Faltan los permisos.");
                    }
                } else {
                    response(200, "Error", "Falta el Alias.");
                }
            } else {
                response(200, "Error", "Faltan credenciales.");
            }
            
            break;
        default:
            // error 200
            response(404, "Error 2, no existe esta ruta: ".$root, NULL);
    }

} else {
    // error 200
    response(404,"Error 1, no existe esta ruta", count($request));
}




function response($status, $status_message, $data){
	header("HTTP/1.1 ".$status);
	
	$response['status'] = $status;
	$response['status_message'] = $status_message;

    if(gettype($data) == "array"){
        $response['data'] = json_encode($data);
    } else {
        $response['data'] = $data;
    }
	
	$json_response = json_encode($response);
	echo $json_response;
}

function insertar_respuesta($idpartida,$puntos,$idcancion,$idcancionrespuesta){

    include("ControladorPartidas.php");

    $controladorPartidas = new ControladorPartidas();

    if($controladorPartidas->insertar_respuesta($idpartida,$puntos,$idcancion,$idcancionrespuesta)){
        response(200, "Insertado correctamente", NULL);
    } else {
        response(404, "Error", NULL);
    }

}
function insertar_partida($idusuario){

    include("ControladorPartidas.php");

    $controladorPartidas = new ControladorPartidas();

    // insertar partida
    if($controladorPartidas->insertar_partida($idusuario)){
        response(200, "Insertado correctamente", mysqli_insert_id($controladorPartidas->basededatos->conexion));
    } else {
        response(404, "Error", NULL);
    }

}
function iniciarsesion($nombre, $contrasena){

    include("ControladorUsuarios.php");

    $controladorusuarios = new ControladorUsuarios();

    // mira si hay algun usuario con esa contraseña
    $id = $controladorusuarios->iniciarsesion($nombre, $contrasena);

    # si el login ha ido bien
    if($id != 0){
        
        // devuelve el nombre del inicio de sesion
        $respuesta = Array("nombre"=> $nombre,"id"=> $id);
        // print_r($respuesta);
        response(200, "Log In", $respuesta);

    } else { # login incorreto

        response(200, "Credenciales incorrectas", NULL);

    }

}
function register($username, $password, $alias, $permisos){

    include("ControladorUsuarios.php");

    $controladorusuarios = new ControladorUsuarios();

    $register_success = $controladorusuarios->register($username, $password, $alias, $permisos);

    # si el registro ha ido bien
    if($register_success === true){
        // devuelve el nombre del inicio de sesion
        $respuesta = Array("nombre"=> $username,"id"=> mysqli_insert_id($controladorusuarios->basededatos->conexion));
        // print_r($respuesta);
        response(200, "Register", $respuesta);
    } else {
        response(200, "Error", "Error: ".mysqli_error($controladorusuarios->basededatos->conexion));
    }

}

function ranking(){

    include("ControladorPartidas.php");

    $controladorPartidas = new ControladorPartidas();

    # comprueba que no haya un error
    if($ranking = $controladorPartidas->ranking()){

        response(200, "Ranking", $ranking);

    } else { # error

        response(200, "Error", NULL);

    }
}
