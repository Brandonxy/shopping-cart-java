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
        <%@include file="../includes/head.jsp" %>
        <title>Listado de clientes</title>
    </head>
        <style>
            table {
                background: #ffffff;
                border: 1px solid #c0c0c0;
            }
            td {
                text-align: left;
                padding: 15px;
                border-bottom: 1px solid #c0c0c0;
            }
        </style>
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="content">
            <div class="col-md-4 col-md-offset-1">
                    <h3>Listado de clientes</h3><hr>
                    <table class="table table-bordered">
                        <tr>
                            <td><b>RUN</b></td>
                            <td><b>Nombre</b></td>
                            <td><b>Apellido</b></td>
                            <td><b>Edad</b></td>
                            <td><b>Teléfono</b></td>
                            <td><b>Registro</b></td>
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
                                <td align="center"><label class="label label-error">Desactivado</label></td>
                            <% } else { %>   
                                <td align="center"><label class="label label-verde">Activado</label></td>
                            <% } %>
                            <td>
                                <a href="FormModificarUsuario.jsp?id=<%= users.getInt("id") %>" class="btn">
                                    Editar
                                </a>

                            </td>
                            <td>
                                <a href="EliminarUsuario.jsp?id=<%= users.getInt("id") %>" class="btn btn-eliminar">
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <% } %>

                    </table>
                </div>
        </div>
    </body>
</html>