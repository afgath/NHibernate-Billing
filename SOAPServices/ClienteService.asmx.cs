using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using InvoiceServices.Logic;
using InvoiceServices.Logic.Classes;

namespace InvoiceServices.SOAPServices
{
    /// <summary>
    /// Summary description for ClienteService
    /// </summary>
    [WebService(Namespace = "http://afgath.com")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ClienteService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public string CrearCliente(int Cedula, string Nombre, string Direccion, int Telefono)
        {
            ClienteDB clienteDB = new ClienteDB();
            return clienteDB.InsertarCliente(Cedula, Nombre, Direccion, Telefono);
        }
    }
}
