using core.Interfaces;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace core.Repositorio
{
    public class GestorDB: IGestorDB
    {

        private readonly SqlConnection con;
        private readonly IConfiguration _Config;

        public GestorDB(string ConnectionString, IConfiguration config)
        {

            con = new SqlConnection(ConnectionString);
            _Config = config;
        }


        public Task<DataTable> SimpleConnection(string sp, object[] parameters)
        {
            return Task.Run(() =>
            {
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand()
                {
                    CommandText = sp,
                    CommandType = CommandType.StoredProcedure,
                    Connection = con
                };
                if (parameters.Count<object>() != 0)
                {
                    cmd.Parameters.AddRange(parameters.ToArray<object>());
                }
                con.Open();
                (new SqlDataAdapter(cmd)).Fill(dt);
                con.Close();
                return dt;

            });
        }

    }
}
