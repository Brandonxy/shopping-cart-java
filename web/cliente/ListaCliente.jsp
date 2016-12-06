<%@page import="bd.Url"%>
<%@page import="bd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, bd.ConexionBD" %>
<%
    ResultSet users = User.all("clientes", "DESC");
%>
<!DOCTYPE html>
<html>
    <head>
        <head>
        <link rel="stylesheet" type="text/css" href="../assets/css/app.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <%@include file="../includes/head.jsp" %>
        <title>Listado de clientes</title>
    </head>
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="container">
            <div class="row">
                
                <div class="col-md-4 col-md-offset-1">
                    <h3>Listado de clientes</h3><hr>
                    <table class="table table-bordered">
                        <tr>
                            <td><b>RUN</b></td>
                            <td><b>Nombre</b></td>
                            <td><b>Apellido</b></td>
                            <td><b>Edad</b></td>
                            <td><b>Teléfono</b></td>
                            <td><b>Fecha_registro</b></td>
                            <td><b>Estado</b></td>
                            <td><b>Operaciones</b></td>                
                        </tr>

                        <% while(users.next()) { %>
                        <tr>
                            <td align="center"><b><%= users.getString("run") %></b></td>
                            <td align="center"><%= users.getString("nombre") %></td>
                            <td align="center"><%= users.getString("apellido") %></td>
                            <td align="center"><%= users.getString("edad") %></td>
                            <td align="center"><%= users.getString("telefono") %></td>
                            <td align="center"><%= users.getDate("creado_el") %></td>
                            <% if(users.getShort("activado") == 0) { %>
                                <td align="center"><label class="label label-danger">Desactivado</label></td>
                            <% } else { %>   
                                <td align="center"><label class="label label-success">Activado</label></td>
                            <% } %>
                            <td>
                                <a href="EliminarUsuario.jsp?id=<%= users.getInt("id") %>">
                                    <img src="images/delete.png" width="16" height="16" />
                                </a>
                                &nbsp;
                                <a href="FormModificarUsuario.jsp?id=<%= users.getInt("id") %>">
                                    <img src="images/modified.png" width="16" height="16" />
                                </a>

                            </td>                
                        </tr>
                        <% } %>

                    </table>
                </div>
            </div>
        </div>
    </body>
</html>