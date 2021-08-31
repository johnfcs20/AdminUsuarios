export class usuarioLista {
        constructor(
                    public PageIndex?: number,
                    public PageSize?: number,
                    public Empleado_Cedula_Nombre?: string,
                    public Usuario_ID?: string,
                    public Usuario_Nombres?: string,
                    public Usuario_Apellidos?: string,     
                    public Usuario_Nombres_Combianados?: string,     
                    public Usuario_Genero?: string,     
                    public Usuario_Cedula?: string,
                    public Usuario_Fecha_Nacimiento?: Date,
                    public Depatamento_ID?: number,
                    public Departamento_Descripcion?: string,
                    public Linea?: number,
                    public Ultima_Linea?: number,
                    public Cantidad_Registros?: number
                    ) { }
}