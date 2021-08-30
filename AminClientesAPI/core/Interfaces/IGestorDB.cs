using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace core.Interfaces
{
    public interface IGestorDB
    {

        Task<DataTable> SimpleConnection(string sp, object[] parameters);

    }
}
