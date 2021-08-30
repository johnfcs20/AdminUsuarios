using System;
using System.Collections.Generic;
using System.Text;

namespace core.Modelos
{
    public class Usuarios_Master_Consulta
    {
        public int Usuario_ID { get; set; }
        public string Usuario_Nombres { get; set; }
        public string Usuario_Apellidos { get; set; }
        public string Usuario_Nombres_Combianados { get; set; }
        public string Usuario_Genero { get; set; }
        public string Usuario_Cedula { get; set; }
        public DateTime Usuario_Fecha_Nacimiento { get; set; }
        public byte Depatamento_ID { get; set; }

    }
}
