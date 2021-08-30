using System;
using System.Collections.Generic;
using System.Text;

namespace core.Modelos
{
    public class Usuarios_Master_Inserta
    {
        public int Usuario_ID { get; set; }
        public string Usuario_Nombres { get; set; }
        public string Usuario_Apellidos { get; set; }
        public string Usuario_Genero { get; set; }
        public string Usuario_Cedula { get; set; }
        public string Usuario_Fecha_Nacimiento { get; set; }
        public byte Depatamento_ID { get; set; }
        public string Cargo { get; set; }
        public string Supervisor_Inmediato { get; set; }
        public string Registro_Usuario { get; set; }
        public string Datos { get; set; }
    }
}
