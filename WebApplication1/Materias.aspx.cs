﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidad;

namespace WebApplication1
{
    public partial class Materias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            
            Usuarios usuario = (Usuarios)Session["Usuario"];

            if (usuario == null)
            {
                Response.Redirect("Login.aspx");
            }

            lblNombreUsuario.Text = usuario.Usuario;

            if (!IsPostBack)
            {
                CargarTabla();
            }
        }
        
        public void CargarTabla()
        {
            NEGMaterias mat = new NEGMaterias();
            gv.DataSource = mat.GetTable();
            gv.DataBind();
        }

        protected void gv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv.EditIndex = -1;
            CargarTabla();
        }

        protected void gv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv.EditIndex = e.NewEditIndex;
            CargarTabla();
        }
        protected void gv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            NEGMaterias NegMat = new NEGMaterias();

            Label lbl_ID = gv.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox txtNombre = gv.Rows[e.RowIndex].FindControl("tbxNombre") as TextBox;
            TextBox txtFechabaja = gv.Rows[e.RowIndex].FindControl("tbxFechabaja") as TextBox;
            TextBox txtCausabaja = gv.Rows[e.RowIndex].FindControl("tbxCausabaja") as TextBox;
           
            NegMat.ActualizarTabla (lbl_ID.Text, txtNombre.Text, txtFechabaja.Text, txtCausabaja.Text);
            gv.EditIndex = -1;
            CargarTabla();
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void btn_aceptar_Click(object sender, EventArgs e)
        {
            NEGMaterias materias = new NEGMaterias();

            materias.AgregarMateria(tbxNombre.Text);

            CargarTabla();
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session["Usuario"] = null;

            Response.Redirect("Login.aspx");
        }
    }
}