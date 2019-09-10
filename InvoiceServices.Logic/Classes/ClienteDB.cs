using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using NHibernate;
using NHibernate.Cfg;

namespace InvoiceServices.Logic.Classes
{
    public class ClienteDB
    {
        private ISessionFactory mySessionFactory;
        private ISession mySession;

        public ClienteDB()
        {
            Configuration cfg = new Configuration();
            cfg.AddAssembly("InvoiceServices.Logic");

            mySessionFactory = cfg.BuildSessionFactory();
            mySession = mySessionFactory.OpenSession();

        }

        public string InsertarCliente(int Cedula, string Nombre, string Direccion, int Telefono)
        {
            try
            {
                using (mySession.BeginTransaction())
                {
                    Cliente cliente = new Cliente
                    {
                        Cedula = Cedula,
                        Nombre = Nombre,
                        Direccion = Direccion,
                        Telefono = Telefono
                    };
                    mySession.Save(cliente);
                    mySession.Transaction.Commit();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            return "Se realizó el proceso correctamente";
        }

        public string ActualizarCliente(int Id, int Cedula, string Nombre, string Direccion, int Telefono)
        {
            try
            {
                using (mySession.BeginTransaction())
                {
                    Cliente cliente = (Cliente)mySession.Load(typeof(Cliente), Id);
                    cliente.Cedula = Cedula;
                    cliente.Nombre = Nombre;
                    cliente.Direccion = Direccion;
                    cliente.Telefono = Telefono;
                    mySession.Update(cliente);
                    mySession.Transaction.Commit();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            return "Se realizó el proceso correctamente";
        }

        public string EliminarCliente(int Id)
        {
            try
            {
                using (mySession.BeginTransaction())
                {
                    Cliente cliente = (Cliente)mySession.Load(typeof(Cliente), Id);
                    mySession.Delete(cliente);
                    mySession.Transaction.Commit();
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            return "Se realizó el proceso correctamente";
        }

        public IList ConsultarCliente(int Id)
        {
            try
            {
                IList ilCliente = mySession.CreateCriteria(typeof(Cliente)).List();
                return ilCliente;
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}
