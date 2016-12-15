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
            
            <div class="container content">
                
                <div class="row">
                    <div class="col-md-3">
                        
                        
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-block">Nueva discución</button>
                            </div>
                        </div>
                        <br>
                        <ul class="nav nav-pills nav-stacked text-left">
                            <h4>Elige una categoria</h4>
                            <% for(Categoria c : categorias) { %>
                            <li><a href="<%= Url.linkTo("foro?categoria=" + c.getAlias()) %>"><%= c.getNombre() %></a></li>
                            <% } %>
                            
                            
                        </ul>
                    </div>
                    <div class="col-md-8">
                        
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="title-forum"><strong><%= pregunta.getPregunta() %></strong></h3>
                                <span class="text-muted date">
                                    Publicado: <%= pregunta.getCreadoEl() %>
                                </span>
                                Por <strong><%= pregunta.getUser().getNombre() %></strong>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-10">
                                <p class="text-muted">
                                    <%= pregunta.getDescripcion() %>
                                </p>
                            </div>
                        </div>
                        <br>

                        <h4><%= pregunta.getRespuestasTotales() %> Respuestas</h4>
                        <br>
                        <% if(temp != null) { %>
                            <div class="alert alert-danger">
                                <%= temp %>
                            </div>
                        <% } %>
                        <hr>
                        <div class="row">
                            <div class="col-md-12">
                                <% for(Respuesta respuesta : pregunta.getRespuestas()) { %>
                                    <div class="row">

                                      <div class="col-md-2">
                                        <div class="thumbnail">
                                            <img class="img-responsive" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="Generic placeholder image">
                                        </div>
                                      </div>

                                      <div class="col-md-10">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <strong>
                                                    <%= respuesta.getUser().getNombre() %>
                                                </strong> <span class="text-muted"><%= respuesta.getCreadoEl() %></span>
                                            </div>
                                            <div class="panel-body">
                                                <%= respuesta.getRespuesta() %>
                                            </div>
                                        </div>
                                      </div>

                                    </div>
                                <% } %>

                            </div>
                        </div>
                                
                                
                        <div class="row">
                            <div class="col-md-12">
                                <form action="<%= Url.linkTo("respond.do?idPregunta=" + pregunta.getId()) %>" method="post">
                                    <div class="row">

                                      <div class="col-md-2">
                                        <div class="thumbnail">
                                            <img class="img-responsive" src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="Generic placeholder image">
                                        </div>
                                      </div>

                                      <div class="col-md-10">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <textarea class="form-control" name="respuesta" placeholder="Responder a este topico..."></textarea>
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

            </div>

            <%@include file="../includes/footer.jsp" %>
            
        </div>
    </body>
</html>
