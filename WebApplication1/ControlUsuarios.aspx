<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlUsuarios.aspx.cs" Inherits="WebApplication1.ControlUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" rel="stylesheet" href="Css/FontFamily.css" />
    <link type="text/css" rel="stylesheet" href="Css/Estilos.css" />
</head>
<body class="flex-body">
    <form id="form1" runat="server">
    <header class="header">
        <div class="header-container">
            <div class="header-item">
                <a href="#">
                    <img class="logo" alt="Logo UTN" src="Logo/logo-utn.png" />
                </a>
            </div>
            <div class="header-item">
                <h2>Sistema de Administración Web</h2>
            </div>
                     <div class="nav"> 
                            <asp:Button ID="Button1" CssClass="boton" runat="server" OnClick="btnVolver_Click" Text="Volver" />
                            <asp:Label ID="lblNombreUsuario" margin-left="10px" margin-right="5px" Font-Bold="true" runat="server"></asp:Label>
                            <asp:Button ID="Button2" CssClass="boton" runat="server" OnClick="btnCerrarSesion_Click"  Text="Cerrar Sesión" />     
                    </div>
        </div>
    </header>
    <main class="flex-main">
            <div class="flex-form">
                <div>
                    <h1 class="titulo">Control Usuarios</h1>
                </div>
                <div>
                    <hr class="hr" />
                </div>
                <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="gv_RowCancelingEdit" OnRowEditing="gv_RowEditing" OnRowUpdating="gv_RowUpdating" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                    <Columns>
                        <asp:TemplateField HeaderText="Editar">
                            <EditItemTemplate>
                                <asp:Button ID="UpdateButton" CssClass="botonGrid" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" CssClass="botonGrid" runat="server" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Button ID="btnEditar" CssClass="botonGrid" runat="server" Text="Editar" CommandName="Edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Usuario">
                            <EditItemTemplate>
                                <asp:Label ID="lblUsuario" runat="server" Text='<%# Eval("Usuario") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblUsuario" runat="server" Text='<%# Eval("Usuario") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Apellido">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbxApellido" runat="server" Text='<%# Eval("Apellido") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblApellido" runat="server" Text='<%# Eval("Apellido") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nombre">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbxNombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Clave">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbxClave" runat="server" Text='<%# Eval("Clave") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblClave" runat="server" Text='<%# Eval("Clave") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fechabaja">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbxFechabaja" runat="server" Text='<%# Eval("Fechabaja") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFechabaja" runat="server" Text='<%# Eval("Fechabaja") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Causabaja">
                            <EditItemTemplate>
                                <asp:TextBox ID="tbxCausabaja" runat="server" Text='<%# Eval("Causabaja") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCausabaja" runat="server" Text='<%# Eval("Causabaja") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </div>
        </form>
    </main>
    <footer class="footer">
        <div class="footer-container">
            <hr class="hr" />
            <span class="copyright">Copyright © 2021 Universidad Tecnológica Nacional</span>
        </div>
    </footer>
</body>
</html>
