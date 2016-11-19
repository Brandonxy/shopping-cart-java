<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../assets/css/app.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../includes/head.jsp" %>
        <title>Resgistro de Usuarios</title>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../includes/header.jsp" %>
            <h1>Resgistro de Nuevos Usuarios</h1>
            <form action="registroNuevoUsuario.jsp" method="get" >
            Run:      
            <input type="text" name="runUs" size="30" placeholder="11223344-k"/>
            <br/>
            Nombre:   
            <input type="text" name="nomUs" size="30" placeholder="ej. Juan"/>
            <br/>
            Apellido:  
            <input type="text" name="apeUs" size="30" placeholder="ej. Rojas"/>
            <br/>
            Edad:    
            <input type="text" name="edUs" size="30" placeholder="ej. 40" />
            <br/>
            Telefono:
            <input type="text" name="telUs" size="30" placeholder="ej. 228887766"/>
            <br/>
            Pais:    
            <input type="text" name="paisUs" size="30" placeholder="Chile"/>
            <br/>
            Ciudad:
            <input type="text" name="ciuUs" size="30" placeholder="ej. Talca"/>
            <br/>
            Comuna:
            <input type="text" name="comUs" size="30"/>
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
            <%@include file="../includes/footer.jsp" %>
        </div>
    </body>
</html>