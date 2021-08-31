
import { Injectable } from "@angular/core";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Observable, throwError } from "rxjs";
import { map, catchError } from "rxjs/operators";
import { usuarioLista } from "../modelos/usuariosLista";
import { usuarioInserta } from "../modelos/usuarioInserta";


@Injectable({
  providedIn: "root",
})




export class ListaUsuariosService {
  constructor(
    private http: HttpClient,

  ) {}


    httpOptions = {
    headers: new HttpHeaders({
      "Content-Type": "application/json",
    }),
  };

    public url: string = "https://localhost:44312/api/Usuario/";



    filtro: usuarioLista = {
        PageIndex: 0,
        PageSize: 100,
        Empleado_Cedula_Nombre: ""
    }


    listaUsuarios(parametros: usuarioLista): Observable<any> {
    /*<summary>
        Este metodo se encarga de hacer la peticion al API que retorna la lista de ususarios registrados
    </summary>*/
    // <returns> Retorna una lista de ususarios registrados</returns>
  
    const url = this.url + "lista-usuarios?PageIndex=" +  parametros.PageIndex + "&PageSize=" + parametros.PageSize + "&Empleado_Cedula_Nombre=" + parametros.Empleado_Cedula_Nombre;

    return this.http.get<usuarioLista>(url)
      .pipe(catchError(this.handleError));
  }

  
    listaDepartamentos(): Observable<any> {
    /*<summary>
        Este metodo se encarga de hacer la peticion al API que retorna la lista de ususarios registrados
    </summary>*/
    // <returns> Retorna una lista de ususarios registrados</returns>
  
    const url = this.url + "lista-departamentos-usuarios";

    return this.http.get<any>(url)
      .pipe(catchError(this.handleError));
  }


  insertarEmpleado(parametros: usuarioInserta): Observable<any>{
      
    const url = this.url + "insertar-usuario";

    return this.http.post<any>(url, parametros, this.httpOptions)
      .pipe(catchError(this.handleError));
  }



////////////////////////////////////////////////////////// ERROR /////////////////////////////////////////////////////////////

  private handleError(error) {
    // debugger
    // <param name = "error"> En este parametro se alamacena un error que ocurra</param>
    /*<summary>
          Este metodo se encarga de capturar un error y enviar una respuesta de acuerdo al tipo.
      </summary>*/
    // <returns> retorna un mensaje y el estatus de acuerdo al error </returns>

    if (error.error instanceof ErrorEvent) {
      console.error("Ocurrio un error:", error.error.message);
    } else {
      // De lo contrario retorna un error de repuesta por parte del Back End
      // El ( Body ) va a contener la pista de lo que salio mal en el Backe End

      // tslint:disable-next-line:no-unused-expression
      ` Backend tiene el error ${error.status},` +
        ` el error es : ${error.error} `;
    }
    // // Devuelve un Observable con con un mensaje de error
    return throwError(" Algo malo paso; intente mas tarde por favor ");
  }

}