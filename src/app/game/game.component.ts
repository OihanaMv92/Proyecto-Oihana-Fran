import { Component, OnInit } from '@angular/core';
import { HttpService } from '../http.service';
import { ActivatedRoute, Router } from '@angular/router';

interface Respuesta{
	idpartida:number;
	acierto:boolean;
	tiempo:number;
	idcancion:number;
	idcancionrespuesta:number;
	puntos:number;
}
interface Cancion {
	id: number;
	titulo: string;
	carpeta: string;
	fichero: string;
	artistas: string[];
}

@Component({
	selector: 'app-game',
	templateUrl: './game.component.html',
	styleUrls: ['./game.component.css']
})
export class GameComponent implements OnInit {


	canciones: Cancion[];
	partida_canciones: Cancion[];
	// almacena el índice de la canción por donde va la partida
	indice_ganador: number;
	cancion_acabada: boolean;
	posiblesrespuestas: string[];
	clase_play_button: string;
	audio_cancion: HTMLAudioElement;
	indicepartida:number = 0;

	colorrespuestas:string[] = ["","","",""];
	respuestasrespondidas:Respuesta[] = [];

	idusuario:number = 0;
	tiempoempezarrespuesta:number = 0;
	tiempoacabarrespuesta:number = 0;

	numero_partidas:number = 10;

	constructor(private httpservice: HttpService,private router: Router, private route: ActivatedRoute) {

		this.comprobarlogin(),

		this.canciones = [];
		this.partida_canciones = [];
		this.indice_ganador = 0;
		this.posiblesrespuestas = new Array(4).fill("- - -");  
		this.cancion_acabada = true;
		this.clase_play_button = "playbutton";
		this.audio_cancion = new Audio();
		this.crear_partida_bd();
		
	}

	comprobarlogin(){
		// devuelve NULL si no estás logueado, de lo contrario devuelve el nombre del usuario
		let id = localStorage.getItem("id"); 
		
		if (!id) {
			this.redirigirAlLogin();
		} else {
			this.idusuario = parseInt(id);			
		}
	}
	redirigirAlLogin() {		
		this.router.navigate(["../iniciarsesion"], { relativeTo: this.route });
	}

	id_partida:number = 0;
	crear_partida_bd(){
		this.httpservice.crearpartida(this.idusuario).subscribe((response) => {
			let id = response.data;
			if(id){
				this.id_partida = parseInt(id);
				this.cargar_canciones();
			} else {
				this.redirigirAlLogin();
			}
		});
	}

	ngOnInit(): void {}

	cargar_canciones(){
		this.httpservice.canciones().subscribe((response) => {
			if(response.data){
				let raw = JSON.parse(response.data);
				
				// transformar respuesta en lista de Partidas
				for (let x = 0; x < raw.length; x++) {
					const cancion : Cancion = {
						id : raw[x].idCancion,
						titulo : raw[x].tituloCancion,
						carpeta : raw[x].folderCancion,
						fichero : raw[x].filenameCancion,
						artistas : raw[x].artidastas
					}
					this.canciones.push(cancion);
				}				
				this.desordenar_canciones();

			}
		});
	}

	getcancion(id:number){
		return this.canciones.filter((c) => c.id == id)[0];
	}

	desordenar_canciones(){
		
		// desordenar las canciones
		this.canciones = this.canciones.sort(() => 0.5 - Math.random());
		console.log(this.canciones);
		
		
		// solo 4 canciones por partida
		this.partida_canciones = this.canciones.slice(0,this.numero_partidas);
		
		this.empezar_juego();
		
	}

	id_cancion_ganador:number = 0;
	cancionesestapartida:Cancion[]=[];
	empezar_juego(){

		this.tiempoempezarrespuesta = Date.now();

		this.respuestacargada = true;

		this.indice_ganador = parseInt((Math.random()*4).toString());
		
		this.id_cancion_ganador = this.partida_canciones[this.indicepartida].id;

		this.cancionesestapartida = [];
		for(let indice = 0; indice < this.numero_partidas; indice++){
			let cancion = this.canciones[(this.canciones.length-1) - (indice+this.indicepartida)];
			this.cancionesestapartida.push(cancion);			
		}

		// rellenar las 4 casillas
		for(let indice = 0; indice < 4; indice++){
			
			let cancion:Cancion;
			if(indice == this.indice_ganador){
				
				cancion = this.partida_canciones[this.indicepartida];
				console.log("Canción correcta:");
				console.log(cancion);
				
				
				this.posiblesrespuestas[indice] = cancion.titulo;

			} else {
				cancion = this.cancionesestapartida[indice];
				this.posiblesrespuestas[indice] = cancion.titulo;
				
			}
			// this.idcanciones.push( cancion.id );

		}

	}

	cambiar_boton(){
		if(this.clase_play_button === "playbutton"){
			this.clase_play_button = "pausedbutton";
		} else {
			this.clase_play_button = "playbutton";
		}
	}

	
	
	play_music(){

		if(!this.clickable) return;

		console.log("CAMBIAR",this.cancion_acabada);
		

		// cambiar imagen botón
		this.cambiar_boton();

		// click solo una vez por respuesta
		if(this.cancion_acabada){ 

			this.tiempoempezarrespuesta = Date.now();

			// obtener el audio	
			const cancion = this.partida_canciones[this.indicepartida];
			console.log(this.indicepartida);
			const url_cancion = cancion.carpeta + cancion.fichero;
			this.audio_cancion = new Audio(url_cancion);
	
			// play music
			this.audio_cancion.play();

			this.cancion_acabada = false;

		} else {
			console.log(this.indicepartida);
			this.stop_music();
		}
	}

	stop_music(){
		// cambiar imagen botón
		this.clase_play_button = "playbutton";

		// parar cancion
		// this.cancion_acabada = true;
		this.audio_cancion.pause();
	}

	partidaterminada:boolean = false;
	respuestacargada:boolean = false;
	terminar_partida(){
		this.partidaterminada = true;
	}

	siguienterespuesta(){		
		this.cancion_acabada = true;
		if(this.indicepartida == this.numero_partidas-1){
			this.terminar_partida();
		} else {
			
			this.colorrespuestas = ["","","",""];
			
			this.indicepartida++;
			
			this.empezar_juego();
			this.clickable = true;

		}
		

	}

	clickable:boolean = true;

	guardarrespuestabd(respuesta:Respuesta){
		
		this.httpservice.crearrespuesta(respuesta.idpartida,respuesta.puntos,respuesta.idcancion,respuesta.idcancionrespuesta).subscribe((response) => {			
			setTimeout(this.siguienterespuesta.bind(this),500);
			
		});
	}

	puntostotal:number = 0;
	responder(indicerespuesta:number){

		this.clickable = false;

		// if(this.cancion_acabada) return;
		if(this.partidaterminada) return; // no sigue si la partida está terminada
		if(!this.respuestacargada) return; // no sigue si la respuesta no está cargada aún
		this.respuestacargada = false;
		
		let acierto:boolean = indicerespuesta==this.indice_ganador;
		let id_cancion_respuesta = this.id_cancion_ganador;
		if(acierto){
			this.colorrespuestas[indicerespuesta] = "verde"
		} else {
			this.colorrespuestas[indicerespuesta] = "rojo"
			// get id
			id_cancion_respuesta = this.cancionesestapartida[indicerespuesta].id
		}

		

		// generar respuesta
		let puntos:number = 0;
		this.tiempoacabarrespuesta = Date.now();
		let tiempo:number = this.tiempoacabarrespuesta-this.tiempoempezarrespuesta;
		
		if(acierto){			
			puntos = 20;
			// puntos = parseInt(puntos.toString());
			this.puntostotal+= puntos;
		}


		let respuesta:Respuesta = {
			acierto:acierto, 
			tiempo: tiempo,
			idcancion:this.id_cancion_ganador,
			idcancionrespuesta:id_cancion_respuesta,
			puntos:puntos,
			idpartida:this.id_partida
		}
		this.respuestasrespondidas.push(respuesta);
		
		this.stop_music();

		this.guardarrespuestabd(respuesta);

	}



}
