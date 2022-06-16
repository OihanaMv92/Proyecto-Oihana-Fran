import { Component, OnInit } from '@angular/core';
import { HttpService } from '../http.service';
import { ActivatedRoute, Router } from '@angular/router';

interface LoginResponse{
	nombre:string;
	id:string;
}
@Component({
	selector: 'app-registrarse',
	templateUrl: './registrarse.component.html',
	styleUrls: ['./registrarse.component.css']
})
export class RegistrarseComponent implements OnInit {

	nombre: string;
	alias: string;
	contrasena: string;
	repetircontrasena: string;
	register_message: string

	constructor(private httpservice: HttpService, private router: Router, private route: ActivatedRoute) {
		this.nombre = "";
		this.alias = "";
		this.contrasena = "";
		this.repetircontrasena = "";
		this.register_message = "";
	}

	ngOnInit(): void { }

	registrarse() {

		this.register_message = "";

		if (this.contrasena === this.repetircontrasena) {
			this.httpservice.register(this.nombre, this.contrasena, this.repetircontrasena, this.alias)
				.subscribe({
					next: (apiresponse) => {

						let response: string | null = apiresponse.status_message;

						if (apiresponse.data) {
							
							if (response == "Error") {
								this.register_message = "Este nombre ya está en uso.";
							} else {
								let data: string | null = apiresponse.data;
								let login:LoginResponse = JSON.parse(data);
								let nombre: string = login.nombre;
								let id: string = login.id;
								localStorage.setItem("usuario", nombre);
								localStorage.setItem("id", id);
								this.redirigirAlHome();
							}
						}

					}
				});
		} else {
			this.register_message = "Las contraseñas no coinciden";
		}


	}

	redirigirAlHome() {
		this.router.navigate(["../"], { relativeTo: this.route });
	}

}
