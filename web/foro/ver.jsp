<%@page import="comprafy.forum.Respuesta"%>
<%@page import="comprafy.forum.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comprafy.forum.Pregunta"%>
<%@page import="bd.Url"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bd.Producto"%>
<%@page import="java.util.LinkedList"%>
<%@page import="comprafy.cart.CartItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Pregunta pregunta =  Pregunta.find(Long.parseLong(request.getParameter("id")));
    ArrayList<Categoria> categorias = Categoria.all("DESC");
    
    // Mensajes de error
    HttpSession old = request.getSession(false);
    
    Object temp = old.getAttribute("error");
    
    old.removeAttribute("error");
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/head.jsp" %> 
        <title><%= pregunta.getPregunta() %></title>
    </head>
    <body>
        <div class="wrapper">
            
            <%@include file="../includes/header.jsp"%>
            
            <div class="content foro-ctn">
                
                    <div class="seccion-lateral">
                        <a href="<%= Url.linkTo("foro/crear.jsp") %>" class="btn btn-discucion">Nueva discución</a>
                        <nav class="menu-lateral">
                            <ul>
                                <h4 class="titulo-cat">Elige una categoria</h4>
                                <% for(Categoria c : categorias) { %>
                                <li><a href="<%= Url.linkTo("foro?categoria=" + c.getAlias()) %>"><%= c.getNombre() %></a></li>
                                <% } %>
                            </ul>
                        </nav>
                    </div>
                <div class="seccion-cont cont-foro">
                    <h3 class="title-forum">Foro CompraFy</h3>

                    <div class="item-foro">
                        <div class="cuerpo-item">
                            <h2 class="titulo-item">
                                <div class="titulo-item-inside">
                                    <%= pregunta.getPregunta() %>
                                </div>
                                <% if(User.auth(request) != null && pregunta.getClienteId() == User.auth(request).getId()) { %>
                                    <a href="<%= Url.linkTo("eliminar_pregunta.do?id=" + pregunta.getId()) %>" 
                                       class="btn btn-eliminar eliminar-pregunta">
                                    Eliminar
                                    </a>
                                    
                                    <a href="<%= Url.linkTo("foro/editar.jsp?id=" + pregunta.getId()) %>" 
                                       class="btn btn-eliminar eliminar-pregunta">
                                    Modificar 
                                    </a>
                                <% } %>
                            </h2>
                            <div class="detalles">
                                <span class="texto-gris date">
                                    Publicado: <%= pregunta.getCreadoEl() %></span>
                                    Por <strong class="nombreusuario"><%= pregunta.getUser().getNombre() %></strong>
                            </div>
                            <p class="texto-gris">
                                <%= pregunta.getDescripcion() %>
                            </p>
                        </div>
                    </div>

                    <div class="respuestas-ctn">
                        
                            
                        <%@include file="../includes/mensajes.jsp"%>
                        
                        <br>
                        Respuestas (<%= pregunta.getRespuestasTotales() %>) 
                        <div class="cont-respuestas">
                            <% for(Respuesta respuesta : pregunta.getRespuestas()) { %>
                            <div class="respuesta-item">
                                <div class="cabecera-respuesta">
                                    <strong>
                                    <%= respuesta.getUser().getNombre() %>
                                    </strong> 
                                    &middot;
                                    <span class="texto-gris">Publicada:  <%= respuesta.getCreadoEl() %></span>
                                    <br>
                                </div>
                                <div class="contenido-respuesta">
                                    <%= respuesta.getRespuesta() %>
                                </div>

                            </div>
                            <br>
                            <% } %>
                        </div>
                        <div class="formulario-responder">
                            <form action="<%= Url.linkTo("respond.do?idPregunta=" + pregunta.getId()) %>" method="post">
                                <div class="row">

                                    <div class="col-md-10">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <textarea class="textfield" name="respuesta" placeholder="Responder a este topico..."></textarea>
                                            </div>
                                            <div class="panel-footer">
                                                <button type="submit" class="btn btn-success">Responder</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

            <%@include file="../includes/footer.jsp" %>
            
        </div>
    </body>
</html>
