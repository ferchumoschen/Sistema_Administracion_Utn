<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instancias.aspx.cs" Inherits="WebApplication1.Instancias" %>

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
   <form id="form2" runat="server" class="centrarVertical">
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
                </div>
                <div>
                    <h1 class="titulo">Instancias</h1>
                </div>
                <div>
                    <hr class="hr" />
                </div>
                <div class="rows">
                    <asp:GridView ID="gv" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" OnRowCancelingEdit="gv_RowCancelingEdit" OnRowEditing="gv_RowEditing" OnRowUpdating="gv_RowUpdating" AutoGenerateColumns="False" AllowSorting="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Controles">
                                <ItemTemplate>
                                    <asp:Button Text="Editar" ID="Editbutton" CssClass="botonGrid" runat="server" CommandName="Edit" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button Text="Update" ID="UpdateButton" CssClass="botonGrid" runat="server" CommandName="Update" />
                                    <asp:Button Text="Cancel" ID="CancelButton" CssClass="botonGrid" runat="server" CommandName="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID">
                                <EditItemTemplate>
                                    <asp:Label ID="lbl_ID" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtid" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="INSCRIPCIONES_Id">
                                <FooterTemplate>
                                    <asp:TextBox ID="txtINSCRIPCIONES_Id" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblINSCRIPCIONES_Id" runat="server" Text='<%# Eval("INSCRIPCIONES_Id") %>' />

                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="tbx_Inscripcion_ID" runat="server" Text='<%# Eval("INSCRIPCIONES_Id") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <FooterTemplate>
                                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbxNombre" runat="server" Text='<%# Eval("Nombre") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Anio">
                                <FooterTemplate>
                                    <asp:TextBox ID="txtAnio" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAnio" runat="server" Text='<%# Eval("Anio") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbxAnio" runat="server" Text='<%# Eval("Anio") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado">
                                <FooterTemplate>
                                    <asp:TextBox ID="txtEstado" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("Estado") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="tbx_Estado" runat="server">
                                        <asp:ListItem>Espera</asp:ListItem>
                                        <asp:ListItem>Abierta</asp:ListItem>
                                        <asp:ListItem>Cerrado</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fechainicio">
                                <FooterTemplate>
                                    <asp:TextBox ID="txtFechainicio" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFechainicio" runat="server" Text='<%# Eval("Fechainicio","{0:dd/MM/yyyy}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbxFechainicio" runat="server" Text='<%# Eval("Fechainicio","{0:dd/MM/yyyy}") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fechafin">
                                <FooterTemplate>
                                    <asp:TextBox ID="txtFechafin" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFechafin" runat="server" Text='<%# Eval("Fechafin") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="tbxFechafin" runat="server" Text='<%# Eval("Fechafin") %>' />
                                </EditItemTemplate>
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

                    <div class="col">
                        <div>
                            <h4 class="titulo">Agregar Instancia</h4>
                        </div>
                        <div>
                            <hr class="hr" />
                        </div>
                        <div>
                            <label for="tbx_INSCRIPCIONES">Inscripcion ID:</label>
                            <asp:TextBox ID="tbx_INSCRIPCIONES" runat="server" CssClass="inputTamanio"></asp:TextBox>
                        </div>
                        <div class="label-error">
                            <asp:RequiredFieldValidator ID="RFV_Inscripcion_ID" runat="server" ControlToValidate="tbx_INSCRIPCIONES" ErrorMessage="Ingrese una inscripción existente" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label for="tbx_Nombre">Nombre:</label>
                            <asp:TextBox ID="tbx_Nombre" runat="server" CssClass="inputTamanio"></asp:TextBox>
                        </div>
                        <div class="label-error">
                            <asp:RequiredFieldValidator ID="RFV_Nombre" runat="server" ControlToValidate="tbx_Nombre" ErrorMessage="Ingrese un Nombre" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label for="tbx_Anio">Año:</label>
                            <asp:TextBox ID="tbx_Anio" runat="server" CssClass="inputTamanio"></asp:TextBox>
                        </div>
                        <div class="label-error">
                            <asp:RequiredFieldValidator ID="RFV_Anio" runat="server" ControlToValidate="tbx_Anio" ErrorMessage="Ingrese un Año" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label for="tbx_Estado">Estado:</label>
                            <asp:DropDownList ID="tbx_Estado" runat="server" CssClass="inputTamanio">
                                <asp:ListItem>Espera</asp:ListItem>
                                <asp:ListItem>Abierta</asp:ListItem>
                                <asp:ListItem>Cerrado</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="label-error">
                            <asp:RequiredFieldValidator ID="RFV_Estado" runat="server" ControlToValidate="tbx_Estado" ErrorMessage="Ingrese un Estado" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label for="tbx_FechaInicio">Fecha Inicio:</label>
                            <asp:TextBox ID="tbx_FechaInicio" runat="server" TextMode="Date" CssClass="inputTamanio"></asp:TextBox>
                        </div>
                        <div class="label-error">
                            <asp:RequiredFieldValidator ID="RFV_FechaInicio" runat="server" ControlToValidate="tbx_FechaInicio" ErrorMessage="Ingrese una fecha Inicio" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <label for="tbx_FechaFin">Fecha Fin:</label>
                            <asp:TextBox ID="tbx_FechaFin" runat="server" TextMode="Date" CssClass="inputTamanio"></asp:TextBox>
                        </div>
                        <div class="label-error">
                            <asp:RequiredFieldValidator ID="RFV_FechaFin" runat="server" ControlToValidate="tbx_FechaFin" ErrorMessage="Ingrese una Fecha Fin" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-btn">
                            <asp:Button ID="btn_aceptar" runat="server" CssClass="boton" OnClick="btn_aceptar_Click" Text="Agregar" ValidationGroup="grupo2" Width="140px" />
                        </div>
                    </div>
                </div>
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

