import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

interface LoginResponse{
	nombre:string;
	id:string;
}
interface ApiLoginResponse {
	status: number;
	status_message: string;
	data: LoginResponse | null;
}
interface ApiResponse {
	status: number;
	status_message: string;
	data: string | null;
}

@Injectable({
	providedIn: 'root'
})
export class HttpService {

	// apiurl: string = "./api/"
	apiurl: string = "http://localhost/api/"

	constructor(private http: HttpClient) { }


	login(nombre: string, contrasena: string): Observable<ApiResponse> {

		const url = this.apiurl + "login";
		const body = { "nombre": nombre, "contrasena": contrasena };
		const headers = { "Content-Type": "application/json" };

		return this.http.post<any>(url, body, { headers })
	}
	register(nombre: string, contrasena: string, repetircontrasena: string, alias: string): Observable<ApiResponse> {

		const url = this.apiurl + "register";
		const body = { "nombre": nombre, "contrasena": contrasena, "contrasenarepetida": repetircontrasena, "alias": alias, "permisos": 1 };
		const headers = { "Content-Type": "application/json" };

		return this.http.post<any>(url, body, { headers })
	}
	ranking(): Observable<ApiResponse> {
		return this.http.post<any>(this.apiurl + "ranking", {});
	}
	canciones(): Observable<ApiResponse> {
		return this.http.post<any>(this.apiurl + "canciones", {});
	}
	crearpartida(idusuario: number): Observable<ApiResponse> {
		return this.http.post<any>(this.apiurl + "partida", {idusuario:idusuario});
	}
	crearrespuesta(idpartida:number,puntos:number,idcancion:number,idcancionrespuesta:number): Observable<ApiResponse> {
		return this.http.post<any>(this.apiurl + "respuesta", {
			idpartida:idpartida,
			puntos:puntos,
			idcancion:idcancion,
			idcancionrespuesta:idcancionrespuesta
		});
	}

}