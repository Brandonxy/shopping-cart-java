<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/head.jsp" %>
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <div class="wrapper">
            
            <%@include file="includes/header.jsp" %>
            
            <section class="content">
                <form action="" methdo="post">
                    <div class="username-ctn">
                        <label>Nombre de usuario</label>
                        <input type="text" name="username">
                    </div>
                    <div class="password">
                        <label>Contraseña</label>
                        <input type="password" name="password">
                    </div>
                </form>
            </section>

            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
