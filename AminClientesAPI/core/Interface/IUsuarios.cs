using core.Modelos;
using System;
using System.Collections.Generic;
using System.Text;

namespace core.Interface
{
    public interface IUsuarios
    {
        List<Usuarios_Master_Paging_Consulta> Proc_Usuarios_Master_Paging_Consulta(int PageIndex, int PageSize, string Empleado_Cedula_Nombre);
        Usuarios_Master_Consulta Proc_Usuarios_Master_Consulta(int Usuario_ID);
        List<Departamentos_Cata_Consulta> Proc_Departamentos_Cata_Consulta();
        Usuarios_Master_Inserta Proc_Usuarios_Master_Inserta(Usuarios_Master_Inserta parametros);
        Usuarios_Master_Inactiva Proc_Usuarios_Master_Inactiva(int Usuario_ID);

    }
}
