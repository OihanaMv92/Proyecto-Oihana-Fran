import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
	selector: 'app-home',
	templateUrl: './home.component.html',
	styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

	nombreusuario:string | null;
	nombrejuego:string = "Music Quiz"

	constructor(private router: Router, private route: ActivatedRoute) {
		this.nombreusuario = "";
		this.comprobarlogin();
	}

	ngOnInit(): void {}

	comprobarlogin() {
		// devuelve NULL si no estás logueado, de lo contrario devuelve el nombre del usuario
		this.nombreusuario = localStorage.getItem("usuario"); 
		
		if (this.nombreusuario === null || this.nombreusuario === undefined || this.nombreusuario.length == 0) {
			this.redirigirAlLogin();
		} else {
			// logueado
			console.log(this.nombreusuario);
			
		}
	}
	redirigirAlLogin() {
		this.router.navigate(["iniciarsesion"], { relativeTo: this.route });
	}

	cerrarsesion(){
		localStorage.removeItem("usuario");
		this.redirigirAlLogin();
	}

}
