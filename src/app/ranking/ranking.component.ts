import { Component, OnInit } from '@angular/core';
import { HttpService } from '../http.service';

interface Partida {
	id: number;
	tiempo: number;
	alias: number;
	fecha: string;
	puntuacion: number;
}

@Component({
	selector: 'app-ranking',
	templateUrl: './ranking.component.html',
	styleUrls: ['./ranking.component.css']
})
export class RankingComponent implements OnInit {

	partidas: Partida[];

	constructor(private httpservice: HttpService) {
		this.partidas = [];
		this.ranking();
	}

	ngOnInit(): void {

	}


	ranking() {
		this.httpservice.ranking().subscribe((response) => {
			// console.log(response.data);
			if (response.data) {
				let raw = JSON.parse(response.data);

				// transformar respuesta en lista de Partidas
				for (let x = 0; x < raw.length; x++) {
					let fecha:string = raw[x].fechaPartida;
					let fechas:string[] = raw[x].fechaPartida.split(" ")[0].split("-");
					let horas:string[] = raw[x].fechaPartida.split(" ")[1];
					let fechafinal:string = fechas[2] + "-" + fechas[1] + "-" + fechas[0] + " " + horas

					const partida: Partida = {
						id: x+1,
						alias: raw[x].aliasUsuario,
						tiempo: raw[x].tiempoPartida,
						fecha: fechafinal,
						puntuacion: raw[x].puntuacion
					}
					this.partidas.push(partida);
				}

			}
		});
	}



}
