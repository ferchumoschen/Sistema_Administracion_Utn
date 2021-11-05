using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Npgsql;

namespace DAO
{
    public class AccesoBase
    {

        String RutaBase = "Server = localhost;Port=5432;Database=utn;User Id=postgres;Password=1234;";


        public NpgsqlConnection ObtenerConexion()
        {
            NpgsqlConnection cn = new NpgsqlConnection(RutaBase);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public NpgsqlDataAdapter ObtenerAdaptador(String consultaSql, NpgsqlConnection cn)
        {
            NpgsqlDataAdapter adaptador;
            try
            {
                adaptador = new NpgsqlDataAdapter(consultaSql, cn);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable ObtenerTabla(String NombreTabla, String Sql)
        {
            DataSet ds = new DataSet();
            NpgsqlConnection Conexion = ObtenerConexion();
            NpgsqlDataAdapter adp = ObtenerAdaptador(Sql, Conexion);
            adp.Fill(ds, NombreTabla);
            Conexion.Close();
            return ds.Tables[NombreTabla];
        }
        public int EjecutarProcedimientoAlmacenado(NpgsqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            NpgsqlConnection Conexion = ObtenerConexion();
            NpgsqlCommand cmd = new NpgsqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.Text;
            
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }
        public int Cantidad(string NombreTabla, String sql)
        {
            NpgsqlConnection conexion = ObtenerConexion();
            try
            {
                using (NpgsqlCommand cantcom = new NpgsqlCommand(sql, conexion))
                {
                    Int32 cant = (Int32)cantcom.ExecuteScalar();
                    return cant;
                }
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        public int ObtenerInt(string NombreTabla, String sql)
        {
            NpgsqlConnection conexion = ObtenerConexion();
            try
            {
                using (NpgsqlCommand cantcom = new NpgsqlCommand(sql, conexion))
                {
                    int cant = (int)cantcom.ExecuteScalar();
                    return cant;
                }
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        public Double ObtenerFloat(string NombreTabla, String sql)
        {
            NpgsqlConnection conexion = ObtenerConexion();
            try
            {
                using (NpgsqlCommand cantcom = new NpgsqlCommand(sql, conexion))
                {
                    Double cant = (Double)cantcom.ExecuteScalar();
                    return cant;
                }
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        public string ObtenerUnString(string NombreTabla, String sql)
        {
            NpgsqlConnection conexion = ObtenerConexion();
            try
            {
                using (NpgsqlCommand stringcom = new NpgsqlCommand(sql, conexion))
                {
                    string cant = (string)stringcom.ExecuteScalar();
                    return cant;
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
