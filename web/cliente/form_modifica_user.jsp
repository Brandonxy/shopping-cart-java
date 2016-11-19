<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, bd.ConexionBD"%>
<%
    String idUsuario = request.getParameter("id");
    ResultSet rs = null;
    try
    {
        Connection conn = ConexionBD.getConexion();
        
        String sql = "select * from inacap.Usuario where id=?" ;        
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, idUsuario);
        rs.next();  // avanzar a los datos del usuario a modificar.
    }
    catch(Exception e)
    {
        System.out.println("Excepción de SQL: " + e);
    }    
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resgistro de Usuarios</title>
    </head>
    <body>
        <h1>Resgistro de Nuevos Usuarios</h1>
        <form action="modificarUsuario.jsp" method="get" >
            <input type="hidden" name="id" value="<%=idUsuario%>" />
            Run:      
            <input type="text" name="runUs" size="30" value="<%=rs.getString("run") %>"/>
            <br/>
            Nombre:   
            <input type="text" name="nomUs" size="30" value="<%=rs.getString("Nombre") %>"/>
            <br/>
            Apellido:  
            <input type="text" name="apeUs" size="30" value="<%=rs.getString("Apellido") %>"/>
            <br/>
            Edad:    
            <input type="text" name="edUs" size="30" value="<%=rs.getShort("edad") %>"/>
            <br/>
            Telefono:
            <input type="text" name="telUs" size="30" value="<%=rs.getShort("telefono") %>"/>
            <br/>
            Pais:    
            <input type="text" name="paisUs" size="30" value="<%=rs.getString("pais")%>"/>
            <br/>
            Ciudad:
            <input type="text" name="ciuUs" size="30" value="<%=rs.getString("ciudad") %>"/>
            <br/>
            Comuna:
            <input type="text" name="comUs" size="30" value="<%=rs.getString("Comuna") %>"/>
            <br/>
            ROL:
            <select name="rolUs">
                <option value="admin">Administrador</option>
                <option value="vendedor">Vendedor</option>
                <option value="cliente">Cliente</option>
            </select>
            <br/>
            Estado:
            <select name="esUs">
                <option value="0">Activo</option>
                <option value="1">Inactivo</option>
            </select>
            <br/>
            Clave:<input type="password" name="passUs" size="30"/>
            <br/>
            <br/>
            <input type="submit" value="Registrar Nuevo Usuario" />
        </form>
    </body>
</html>