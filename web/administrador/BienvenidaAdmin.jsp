<%@page import="java.sql.ResultSet"%>
<%@page import="bd.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    HttpSession hs = request.getSession(false);
    
    User user = (User) hs.getAttribute("User");
    
    if(hs.getAttribute("User") == null){
        response.sendRedirect("../index.jsp");
    }
    
%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../assets/css/app.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <%@include file="../includes/head.jsp" %>
        <title>Bienvenida Administrador</title>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../includes/header.jsp" %>
                <div class="wrapper text-center">
                    <h1><strong>Bienvenido <%= user.getNombre() %></strong></h1>
                    <h1><strong>Sección Administrador</strong></h1>
                    <p>Menú de Opciones para el Administrador</p>
                    <p>Seleccione aquí todas las operaciones</p>
                </div>
                <div class="container">
                  <div class="row">
                    <div class="col-sm-4">
                        <h3><i>Clientes</i></h3>
                        <ul style="disc">
                            <li><a href="<%= Url.linkTo("administrador/register.jsp") %>">Registro Clientes</a></li>
                            <li><a href="<%= Url.linkTo("cliente/ListaCliente.jsp") %>">Listado de Clientes <label class="label label-success">Link bueno</label></a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4">
                      <h3><i>Vendedores</i></h3>
                        <ul style="disc">
                            <li><a href="<%= Url.linkTo("cliente/BienvenidaVendedor.jsp") %>">Página principal vendedor</a></li>
                            <li><a href="<%= Url.linkTo("cliente/ListadoVendedor.jsp") %>">Listado de Vendedores</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-4">
                      <h3><i>Administrador</i></h3>
                        <ul style="disc">
                            <li><a href="<%= Url.linkTo("cliente/ListadoVendedor.jsp") %>">Listado de Administrador</a></li>
                        </ul>
                    </div>
                  </div>
                </div>
            <%@include file="../includes/footer.jsp" %>
        </div>

    </body>
</html>