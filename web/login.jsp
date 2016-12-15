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
            
            <div class="container content">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h1>Inicia <strong>Sesión</strong></h1>
                    </div>
                    <div class="col-md-4 col-md-offset-4 text-center">
                        <hr>
                        <form class="form-vertical" role="form" method="POST" 
                              action="login_post.do">

                                    <div class="form-group">
                                        <label for="email">Run</label>
                                        <input id="email" type="text" class="form-control textfield" name="run" required autofocus>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Contraseña</label>

                                        <input id="password" type="password" class="form-control textfield" name="password" required>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" name="remember"> Remember Me
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-lg btn-block">
                                            Login
                                        </button>
                                    </div>
                                </form>
                    </div>
                </div>
            </div>

            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
