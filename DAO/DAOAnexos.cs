﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Npgsql;
using Entidad;
using System.Data;
using System.Data.SqlClient;
using NpgsqlTypes;

namespace DAO
{
    public class DAOAnexos
    {
        AccesoBase ds = new AccesoBase();

        public Anexos getAnexosID(String IdAnexo)
        {
            Anexos an = new Anexos();
            DataTable tabla = ds.ObtenerTabla("ANEXOS", "select * from \"ANEXOS\" where \"Id\" like " + "'"+IdAnexo+"'");
            an.Id = IdAnexo;
            an.Nombre = tabla.Rows[0][1].ToString();
            an.FechaBaja = tabla.Rows[0][2].ToString();
            an.CausaBaja = tabla.Rows[0][3].ToString();
            return an;
        }

        public DataTable getAnexosAll()
        {
            List<Anexos> lista = new List<Anexos>();
            DataTable tabla = ds.ObtenerTabla("ANEXOS", "select * from \"ANEXOS\" " );
          
            return tabla;
        }
        public int  Insertar(Anexos an)
        {
            NpgsqlCommand com = new NpgsqlCommand("call pdinsertaranexos(:na, :f, :cb )");
            com.Parameters.Add("na", NpgsqlDbType.Varchar, 255).Value = an.Nombre;
            com.Parameters.Add("f", NpgsqlDbType.Date).Value = DateTime.Parse(an.FechaBaja).Date;
            com.Parameters.AddWithValue("cb", NpgsqlDbType.Text).Value = an.CausaBaja.Trim();
            return ds.EjecutarProcedimientoAlmacenado(com, "pdinsertaranexos");

        }
        /*Create or replace procedure pdinsertaranexos (na character varying ,
                                               f date,
                                               cb text)
             as 
             $$
                 begin
                     insert into "ANEXOS" ("Nombre", "Fechabaja",
                                 "Causabaja")
                     values(p_nombre,p_fecha,
                            p_causa);
                     end;
             $$
             language plpgsql;*/
        public int Actualizar(Anexos an)
        {
            NpgsqlCommand com = new NpgsqlCommand("call pdupdateanexos(:p_id, :p_nombre, :p_fecha, :p_causa )");
            com.Parameters.AddWithValue("p_id", DbType.Int32).Value = an.Id;
            com.Parameters.Add("p_nombre", NpgsqlDbType.Varchar, 255).Value = an.Nombre;
            com.Parameters.Add("p_fecha", NpgsqlDbType.Date).Value = DateTime.Parse(an.FechaBaja).Date;
            com.Parameters.AddWithValue("p_causa", NpgsqlDbType.Text).Value = an.CausaBaja.Trim();
            return ds.EjecutarProcedimientoAlmacenado(com, "pdupdateanexos");
        }
        /*create or replace procedure pdupdateanexos(p_id integer,
                                               p_nombre character varying,
                                               p_fecha date,
                                               p_causa text)
        as
        $$
	        begin
                update "ANEXOS" set "Nombre" = p_nombre,  
					                    "Fechabaja" = p_fecha, "Causabaja" = p_causa
                                        where "Id" = p_id;		
            end;
        $$
        language plpgsql;*/

        /*Create or replace procedure PDBajaAnexos (p_fecha DATE ,
										 p_causa TEXT,
										 p_id integer)
            as 
            $$
	            begin
		            update "ANEXOS" set "Fechabaja" = p_fecha , "Causabaja"=p_causa where Id = p_id;
		            end;
            $$
            language plpgsql;*/
    }
}
