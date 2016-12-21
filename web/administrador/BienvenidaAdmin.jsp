<%@page import="java.sql.ResultSet"%>
<%@page import="bd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/head.jsp" %>
        <title>Bienvenida Administrador</title>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../includes/header.jsp" %>
                <div class="content">
                    <div class="seccion">
                        <div class="titulo">Configuración</div>

                        <div class="contenido-sec">

                            <h3>Clientes</h3>
                            <ul style="disc">
                                <li><a href="<%= Url.linkTo("administrador/register.jsp") %>">Registro Clientes</a></li>
                                <li><a href="<%= Url.linkTo("cliente/ListaCliente.jsp") %>">Listado de Clientes <label class="label label-success">Link bueno</label></a></li>
                            </ul>

                            <h3>Vendedores</h3>
                            <ul style="disc">
                                <li><a href="<%= Url.linkTo("cliente/BienvenidaVendedor.jsp") %>">Página principal vendedor</a></li>
                                <li><a href="<%= Url.linkTo("cliente/ListadoVendedor.jsp") %>">Listado de Vendedores</a></li>
                            </ul>

                            <h3>Administrador</h3>
                            <ul style="disc">
                                <li><a href="<%= Url.linkTo("cliente/ListadoVendedor.jsp") %>">Listado de Administrador</a></li>
                            </ul>

                        </div>
                    </div>
                </div>
                    
                
                    
                <div class="container">
                  <div class="row">
                    <div class="col-sm-4">
                        
                    </div>
                    <div class="col-sm-4">
                      
                    </div>
                    <div class="col-sm-4">
                      
                    </div>
                  </div>
                </div>
            <%@include file="../includes/footer.jsp" %>
        </div>

    </body>
</html>