<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="bd.ConexionBD"%>
<%@page import="java.sql.Connection"%>
<%@page import="bd.Comuna"%>
<%@page import="bd.Region"%>
<%@page import="bd.Pais"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession old = request.getSession(false);
    
    Object temp        = old.getAttribute("error");
    Object oldNombre   = old.getAttribute("oldNombre");
    Object oldApellido = old.getAttribute("oldApellido");
    Object oldRun      = old.getAttribute("oldRun");
    Object oldDv       = old.getAttribute("oldDv");
    Object oldEdad     = old.getAttribute("oldEdad");
    Object oldTelefono = old.getAttribute("oldTelefono");
    
    old.removeAttribute("error");
    old.removeAttribute("oldNombre");
    old.removeAttribute("oldApellido");
    old.removeAttribute("oldRun");
    old.removeAttribute("oldDv");
    old.removeAttribute("oldEdad");
    old.removeAttribute("oldTelefono");
    
    

    ResultSet paises = Pais.all("paises", "DESC");
    ResultSet regiones = Region.all("regiones", "DESC");
    ResultSet comunas = Comuna.all("comunas", "DESC");
    
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="../assets/css/app.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="includes/head.jsp" %>
        <title>Crear una nueva cuenta</title>
    </head>
    <body>
        
        <div class="wrapper">
            <%@include file="includes/header.jsp" %>
            
            <div class="container" style="padding-top: 20px;">

                <div class="row">
                    <div class="col-md-4 col-md-offset-4">
                        <% if(temp != null) { %>
                            <div class="alert alert-danger">
                                <%= temp %>
                            </div>
                        <% } %>
                        
                        <div class="panel panel-default form">
                        <div class="panel-body">

                            <h3>Crea una <strong>cuenta</strong></h3>
                            <small>
                                Registrate para empezar a comprar todo tipo de productos.
                            </small>
                            <hr>
                            
                            <form action="register.do" method="post" class="inline-form">
                                
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Nombre</label>
                                        <input type="text" name="nomUs" size="30" 
                                               placeholder="ej. Juan" class="form-control textfield" 
                                               value="<% if(oldNombre != null) { %><%= oldNombre %><% } %>"/>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <label>Apellido</label>
                                        <input type="text" name="apeUs" size="30" 
                                               placeholder="ej. Rojas" class="form-control textfield" 
                                               value="<% if(oldApellido != null) { %><%= oldApellido %><% } %>"/>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Run</label>
                                        <input type="text" name="runUs" size="30" 
                                               placeholder="11223344" class="form-control textfield" 
                                               value="<% if(oldRun != null) { %><%= oldRun %><% } %>"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Dv</label>
                                        <input type="text" name="dv" size="30" 
                                               placeholder="k" class="form-control textfield" 
                                               value="<% if(oldDv != null) { %><%= oldDv %><% } %>"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label>Edad</label>
                                        <input type="number" name="edUs" size="30" 
                                               placeholder="ej. 40"  class="form-control textfield" 
                                               value="<% if(oldEdad != null) { %><%= oldEdad %><% } %>"/>
                                    </div>
                                    <br/>
                                </div>
                                <br />
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <input type="text" name="telUs" size="30" 
                                           placeholder="ej. 228887766" class="form-control textfield" 
                                           value="<% if(oldTelefono != null) { %><%= oldTelefono %><% } %>"/>
                                </div>
                                <div class="form-group">
                                    <label>Pais</label>
                                    <select name="pais" class="form-control">
                                        <% while(paises.next()) { %>
                                            <option value="<%= paises.getInt("id") %>"><%= paises.getString("nombre") %></option>
                                        <% }%>
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label>Region</label>
                                    <select name="region" class="form-control">
                                        <% while(regiones.next()) { %>
                                            <option value="<%= regiones.getInt("id") %>"><%= regiones.getString("nombre") %></option>
                                        <% }%>
                                    </select>
                                </div>
                                
                                <div class="form-group">
                                    <label>Comuna</label>
                                    <select name="comuna" class="form-control">
                                        <% while(comunas.next()) { %>
                                            <option value="<%= comunas.getInt("id") %>"><%= comunas.getString("nombre") %></option>
                                        <% }%>
                                    </select>
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
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>