using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AminClientesAPI.Servicios;
using core.Interface;
using core.Modelos;
using Microsoft.AspNetCore.Mvc;

namespace AminClientesAPI.Controllers
{

      
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {

        private IUsuarios _usuarioServicios;


        public UsuarioController(IUsuarios usuarioServicios)
        {

            _usuarioServicios = usuarioServicios;



        }


        [HttpGet("lista-usuarios")]
        public ActionResult<List<Usuarios_Master_Paging_Consulta>> Lista_Usuarios([FromQuery] int PageIndex, int PageSize, string Empleado_Cedula_Nombre)
        {
            try
            {
                return _usuarioServicios.Proc_Usuarios_Master_Paging_Consulta(PageIndex, PageSize, Empleado_Cedula_Nombre);
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }

        }

        [HttpGet("detalle-usuario")]
        public ActionResult<Usuarios_Master_Consulta> Usuario_Detalle_Consulta([FromQuery] int Usuario_ID)
        {
            try
            {
                return Ok(_usuarioServicios.Proc_Usuarios_Master_Consulta(Usuario_ID));
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }

        }


        [HttpGet("lista-departamentos-usuarios")]
        public ActionResult<List<Departamentos_Cata_Consulta>> Lista_Departamentos_Usuarios()
        {
            try
            {
                return _usuarioServicios.Proc_Departamentos_Cata_Consulta();
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }

        }



        [HttpPost("insertar-usuario")]
        public ActionResult<Usuarios_Master_Inserta> Insertar_Usuario([FromBody]Usuarios_Master_Inserta parametros)
        {
            try
            {
                return Ok(_usuarioServicios.Proc_Usuarios_Master_Inserta(parametros));
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }

        }



        [HttpPost("inactivar-usuario")]
        public ActionResult<Usuarios_Master_Inactiva> inactivar_usuario(int Usuario_ID)
        {
            try
            {
                return Ok(_usuarioServicios.Proc_Usuarios_Master_Inactiva(Usuario_ID));
            }
            catch (Exception ex)
            {

                return BadRequest(ex.Message);
            }

        }


    }
}