<%-- 
    Document   : about
    Created on : 18-11-2016, 04:32:01 PM
    Author     : erein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/head.jsp" %>
        <title>Sobre nosotros</title>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="includes/header.jsp" %>
            <div class="content sobre-nosotros">
                <div class="titulo">
                    <h2>Sobre el proyecto</h2>
                </div>
                <div class="sobre-nosotros-left">
                    <i class="fa fa-shopping-cart fa-5x icon-about"></i>
                </div>
                <ul class="about-list">
                    <li><i class="fa fa-check"></i> Comercializamos para Chile y el Mundo</li>

                    <li><i class="fa fa-check"></i> No. 1 en despacho express</li>

                    <li><i class="fa fa-check"></i> Rapidez, como ningún otro</li>
                </ul>
            </div>
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
