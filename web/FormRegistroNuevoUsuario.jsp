<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../assets/css/app.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../includes/head.jsp" %>
        <title>Crear una nueva cuenta</title>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../includes/header.jsp" %>
            
            <div class="container" style="padding-top: 20px;">

                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <div class="panel panel-default form">
                        <div class="panel-body">

                            <h3>Crea una cuenta</h3>
                            <small>
                                Registrate para empezar a comprar todo tipo de productos.
                            </small>
                            <hr>
                            
                            <form action="registrar.do" method="post" class="inline-form">
                                
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Nombre</label>
                                        <input type="text" name="nomUs" size="30" placeholder="ej. Juan" class="form-control textfield" />
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label>Apellido</label>
                                        <input type="text" name="apeUs" size="30" placeholder="ej. Rojas" class="form-control textfield" />
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Run</label>
                                        <input type="text" name="runUs" size="30" placeholder="11223344-k" class="form-control textfield" />
                                    </div>
                                    <div class="col-md-6">
                                        <label>Edad</label>
                                        <input type="number" name="edUs" size="30" placeholder="ej. 40"  class="form-control textfield" />
                                    </div>
                                    <br/>
                                </div>
                                <br />
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <input type="text" name="telUs" size="30" placeholder="ej. 228887766" class="form-control textfield" />
                                </div>
                                
                                <div class="form-group">
                                    <label>Pais</label>
                                    <input type="text" name="paisUs" size="30" placeholder="Chile" class="form-control textfield" />
                                </div>
                                
                                <div class="form-group">
                                    <label>Ciudad</label>
                                    <input type="text" name="ciuUs" size="30" placeholder="ej. Talca" class="form-control textfield" />
                                </div>
                                
                                <div class="form-group">
                                    <label>Comuna</label>
                                    <input type="text" name="comUs" size="30" class="form-control textfield" />
                                </div>
                                <br/>
                                <div class="form-group">
                                    <label>Contraseña</label>
                                    <input type="password" name="passUs" size="30" class="form-control textfield" />
                                </div>
                                
                                <button type="submit" class="btn btn-primary btn-lg btn-block">Crea tu cuenta</button>
                                <br>
                                <p class="form-group">Al crear una cuenta aceptas los <a href="#">Terminos y Condiciones</a>.</p>
                                <hr>
                                <p></p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión</a></p>
                                
                            </form>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../includes/footer.jsp" %>
        </div>
    </body>
</html>