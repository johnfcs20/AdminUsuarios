using core.Interface;
using core.Interfaces;
using core.Modelos;
using Helper.Converts;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace AminClientesAPI.Servicios
{
    public class UsuariosServicios: IUsuarios
    {
        private IGestorDB _db;
        ConvertDataTableToListGeneric _Convert;

        public UsuariosServicios(IGestorDB db)
        {
            _db = db;
            _Convert = new ConvertDataTableToListGeneric();
        }


        public UsuariosServicios()
        {

        }

       public List<Usuarios_Master_Paging_Consulta> Proc_Usuarios_Master_Paging_Consulta(int PageIndex, int PageSize, string Empleado_Cedula_Nombre)
       {

            List<SqlParameter> parammeters = new List<SqlParameter>()  {

                new SqlParameter("@PageIndex", PageIndex),
                new SqlParameter("@PageSize", PageSize),
                new SqlParameter("@Empleado_Cedula_Nombre",  Empleado_Cedula_Nombre)

              };


            DataTable datatable = _db.SimpleConnection("Proc_Usuarios_Master_Paging_Consulta", parammeters.ToArray()).Result;

            List<Usuarios_Master_Paging_Consulta> result = _Convert.DataTableToList<Usuarios_Master_Paging_Consulta>(datatable);

            return result;

        }


        public Usuarios_Master_Consulta Proc_Usuarios_Master_Consulta(int Usuario_ID)
        {

            List<SqlParameter> parammeters = new List<SqlParameter>()  {

                new SqlParameter("@Usuario_ID", Usuario_ID)

              };


            DataTable datatable = _db.SimpleConnection("Proc_Usuarios_Master_Consulta", parammeters.ToArray()).Result;

            Usuarios_Master_Consulta result = _Convert.DataTableToList<Usuarios_Master_Consulta>(datatable).FirstOrDefault();


            return result;

        }



        public List<Departamentos_Cata_Consulta> Proc_Departamentos_Cata_Consulta()
        {

            List<SqlParameter> parammeters = new List<SqlParameter>()  { };


            DataTable datatable = _db.SimpleConnection("Proc_Departamentos_Cata_Consulta", parammeters.ToArray()).Result;

            List<Departamentos_Cata_Consulta> result = _Convert.DataTableToList<Departamentos_Cata_Consulta>(datatable);

            return result;

        }



        public Usuarios_Master_Inserta Proc_Usuarios_Master_Inserta(Usuarios_Master_Inserta parametros)
        {

            List<SqlParameter> parammeters = new List<SqlParameter>()  {

                new SqlParameter("@Usuario_ID", parametros.Usuario_ID),
                new SqlParameter("@Usuario_Nombres", parametros.Usuario_Nombres),
                new SqlParameter("@Usuario_Apellidos", parametros.Usuario_Apellidos),
                new SqlParameter("@Usuario_Genero", parametros.Usuario_Genero),
                new SqlParameter("@Usuario_Cedula", parametros.Usuario_Cedula),
                new SqlParameter("@Usuario_Fecha_Nacimiento", parametros.Usuario_Fecha_Nacimiento),
                new SqlParameter("@Depatamento_ID ", parametros.Depatamento_ID ),
                new SqlParameter("@Cargo", parametros.Cargo),
                new SqlParameter("@Supervisor_Inmediato ", parametros.Supervisor_Inmediato),
                new SqlParameter("@Registro_Usuario ", parametros.Registro_Usuario )

              };


            DataTable datatable = _db.SimpleConnection("Proc_Usuarios_Master_Inserta", parammeters.ToArray()).Result;

            Usuarios_Master_Inserta result = _Convert.DataTableToList<Usuarios_Master_Inserta>(datatable).FirstOrDefault();


            return result;

        }

        public Usuarios_Master_Inactiva Proc_Usuarios_Master_Inactiva(int Usuario_ID)
        {

            List<SqlParameter> parammeters = new List<SqlParameter>()  {

                new SqlParameter("@Usuario_ID", Usuario_ID)

              };


            DataTable datatable = _db.SimpleConnection("Proc_Usuarios_Master_Inactiva", parammeters.ToArray()).Result;

            Usuarios_Master_Inactiva result = _Convert.DataTableToList<Usuarios_Master_Inactiva>(datatable).FirstOrDefault();


            return result;

        }

    }
}
