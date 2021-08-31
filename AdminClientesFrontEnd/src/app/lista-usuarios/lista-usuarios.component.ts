import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IAngularMyDpOptions, IMyDateModel } from 'angular-mydatepicker';
import { IMyDpOptions } from 'mydatepicker';
import { ToastrService } from 'ngx-toastr';
import { usuarioInserta } from '../modelos/usuarioInserta';
import { usuarioLista } from '../modelos/usuariosLista';
import { ListaUsuariosService } from './lista-usuarios.service';


@Component({
  selector: 'app-lista-usuarios',
  templateUrl: './lista-usuarios.component.html',
  styleUrls: ['./lista-usuarios.component.css']
})







export class ListaUsuariosComponent implements OnInit {

    myDatePickerOptions: IMyDpOptions = {
        // other options...
        dateFormat: 'dd/mm/yyyy',
    };




  usuariosLista: any[] = [];
  departamentoLista: any[] =[];
  sexo: any[] = [
    {descripcion: "Masculino", value: "M"},
    {descripcion: "Femenino", value: "F"}
  ]
  loading: boolean = false;
  public utlimaLinea: number = 0;
  public cantidad: number = 0;
  public linea: number = 0;
  public idUsuario: number = 0;
  public fecha: string = "";
    
  public crudUsuario!: FormGroup;

  

  constructor( private _listaUsuariosService: ListaUsuariosService, public fb: FormBuilder,  private _toast: ToastrService,) { }

  ngOnInit(): void {
  
    this.listaUsuarios();
    this.createForm();
    this.listaDepartamentos();
  
  }


    createForm() {
  /*<summary>
     Este metodo se einicializar los formularios que seran utilizados en el componente
  </summary>*/
    this.crudUsuario = this.fb.group({
      nombres: ["", Validators.required],
      apellidos: ["", Validators.required],
      genero: ["", Validators.required],
      cedula: ["", Validators.required],
      fechaNacimineto:  [""],
      departamento: ["", Validators.required],
      cargo:  ["", Validators.required],
      supervisor:  ["", Validators.required]
    });
    


  }


  listaUsuarios(){

    this._listaUsuariosService.listaUsuarios(this._listaUsuariosService.filtro).subscribe((data: any)=>{
        
        this.loading = true;
        if (data.length > 0) {
        this.usuariosLista = data;
        this.linea = data[0].Linea;
        this.utlimaLinea = data[data.length - 1].Linea;
        this.cantidad = data[0].Cantidad_Registros;
        this._listaUsuariosService.filtro.PageSize = 10;
        this.loading = false;
      } else {
        this.utlimaLinea = 0;
        this.cantidad = 0;
        this._listaUsuariosService.filtro.PageSize = 10;
        this.loading = false;
      }

    });

  }


  
  listaDepartamentos(){

    this._listaUsuariosService.listaDepartamentos().subscribe((data: any)=>{

      this.departamentoLista = data;

    });

  }


  limpiarForm(){

    this.crudUsuario.reset();
    this.fecha = "";

   
  }

    onDateChanged(event: any) {
        this.fecha = event.formatted;
    }

    insertarUsuarios(){

      var parametros: usuarioInserta = {
        Usuario_ID:  0,
        Usuario_Nombres: this.crudUsuario.controls.nombres.value,
        Usuario_Apellidos: this.crudUsuario.controls.apellidos.value,
        Usuario_Genero:  this.crudUsuario.controls.genero.value,
        Usuario_Cedula:  this.crudUsuario.controls.cedula.value,
        Usuario_Fecha_Nacimiento: this.fecha,
        Depatamento_ID: this.crudUsuario.controls.departamento.value,
        Cargo: this.crudUsuario.controls.cargo.value,
        Supervisor_Inmediato: this.crudUsuario.controls.supervisor.value,
        Registro_Usuario: "ALOE"
      }


      this._listaUsuariosService.insertarEmpleado(parametros).subscribe((data: any)=>{


        this._toast.success("Usuario agregado", data.datos)
        this.listaUsuarios();
      });
      
    }

  }

