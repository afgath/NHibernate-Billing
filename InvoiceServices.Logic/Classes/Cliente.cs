using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InvoiceServices.Logic.Classes
{
    class Cliente
    {
        public virtual int Id { get; set; }
        public virtual int Cedula { get; set; }
        public virtual string Nombre { get; set; }
        public virtual string Direccion { get; set; }
        public virtual int Telefono { get; set; }
    }
}
