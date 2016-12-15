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
  
    ArrayList<Pregunta> preguntas =  Pregunta.all("DESC");
    ArrayList<Categoria> categorias = Categoria.all("DESC");
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../includes/head.jsp" %> 
        <title>CompraFy | Foro </title>
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
                                <h3 class="title-forum">Foro CompraFy</h3>
                            </div>
                        </div>
                        
                        <hr>
                        
                        <% for(Pregunta p : preguntas) { %>
                        
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="media">
                                        <div class="media-left">
                                          <a href="#">
                                            <img class="media-object" src="http://placehold.it/80x80" alt="...">
                                          </a>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading">
                                                <a href="<%= Url.linkTo("foro/ver.jsp?id=" + p.getId()) %>"><strong><%= p.getPregunta() %></strong></a>
                                            </h4>
                                          <div class="details">
                                              <strong class="text-warning">
                                                  <a href="<%= Url.linkTo("foro?categoria=" + p.getCategoria().getAlias()) %>">
                                                      <%= p.getCategoria().getNombre() %>
                                                  </a>
                                              </strong> 
                                              
                                              <span class="text-muted date"><%= p.getCreadoEl() %></span>
                                              Por <strong><%= p.getUser().getNombre() %></strong>
                                          </div>
                                          <p class="text-muted">
                                             <%= p.getDescripcion() %>
                                          </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    0 respuestas
                                </div>
                            </div>
                        <% } %>
                        <hr>
                        
                       
                        
                        
                        
                    </div>
                </div>

            </div>

            <%@include file="../includes/footer.jsp" %>
            
        </div>
    </body>
</html>
