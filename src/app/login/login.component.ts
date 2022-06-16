import { Component, OnInit } from '@angular/core';
// import {FormsModule } from "@angular/forms";
import { HttpService } from '../http.service';
import { ActivatedRoute, Router } from '@angular/router';


// interface LoginResponse{
// 	nombre:string;
// 	id:number;
// }
interface LoginResponse{
	nombre:string;
	id:string;
}
@Component({
	selector: 'app-login',
	templateUrl: './login.component.html',
	styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

	nombre: string;
	contrasena: string;
	login_message: string

	constructor(private httpservice: HttpService, private router: Router, private route: ActivatedRoute) {
		this.nombre = "";
		this.contrasena = "";
		this.login_message = "";
	}

	ngOnInit(): void { }

	iniciarsesion() {

		if (this.nombre && this.contrasena) {

			this.httpservice.login(this.nombre, this.contrasena).subscribe((apiresponse) => {

				let data: string | null = apiresponse.data;
				
				
				if (data) {
					let login:LoginResponse = JSON.parse(data);
					let nombre: string = login.nombre;
					let id: string = login.id;
					localStorage.setItem("usuario", nombre);
					localStorage.setItem("id", id);
					
					this.redirigirAlHome();
				} else {
					this.login_message = "Credenciales incorrectas";
				}

			});

		} else {
			this.login_message = "Faltan credenciales.";
		}

	}
	redirigirAlHome() {		
		this.router.navigate(["../"], { relativeTo: this.route });
	}

}
