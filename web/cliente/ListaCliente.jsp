<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, bd.ConexionBD" %>
<%
    ResultSet rs = null;
    try
    {
        Connection con = ConexionBD.getConexion();
        String sql = "SELECT run, nombre, apellido, edad, sexo, telefono, tipo_cliente, fecha_registro,pais,comuna,ciudad, rol, estado from clientes";         
        Statement st = con.createStatement();
        rs = st.executeQuery(sql);
    }
    catch(Exception e){
        System.out.println("Excepción de SQL: " + e);
    }    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Clientes</title>
    </head>
    <body>
        <table border="1" width="800" align="center">
            <tr>
                <td><b>RUN</b></td>
                <td><b>Nombre</b></td>
                <td><b>Apellido</b></td>
                <td><b>Edad</b></td>
                <td><b>Sexo</b></td>
                <td><b>Teléfono</b></td>
                <td><b>Tipo Cliente</b></td>
                <td><b>Fecha_registro</b></td>
                <td><b>País</b></td>
                <td><b>Comuna</b></td>
                <td><b>Ciudad</b></td>
                <td><b>ROL</b></td>
                <td><b>Estado</b></td>
                <td><b>Operaciones</b></td>                
            </tr>
            
            <% while(rs.next()) { %>
            <tr>
                <td align="center"><b><%= rs.getLong("run") %></b></td>
                <td align="center"><%= rs.getString("nombre") %></td>
                <td align="center"><%= rs.getString("apellido") %></td>
                <td align="center"><%= rs.getString("edad") %></td>
                <td align="center"><%= rs.getString("sexo") %></td>
                <td align="center"><%= rs.getString("telefono") %></td>
                <td align="center"><%= rs.getString("fecha_registro") %></td>
                <td align="center"><%= rs.getString("pais") %></td>
                <td align="center"><%= rs.getString("comuna") %></td>
                <td align="center"><%= rs.getString("rol") %></td>
                <td align="center"><%= rs.getString("estado") %></td>
                <td>
                    <a href="EliminarUsuario.jsp?id=<%= rs.getLong("run") %>">
                        <img src="images/delete.png" width="16" height="16" />
                    </a>
                    &nbsp;
                    <a href="FormModificarUsuario.jsp?id=<%= rs.getLong("run") %>">
                        <img src="images/modified.png" width="16" height="16" />
                    </a>
                    
                </td>                
            </tr>
            <% } %>
            
        </table>
    </body>
</html>