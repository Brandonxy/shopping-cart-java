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
    String parametroCategoria = "";
    if(request.getParameterMap().containsKey("categoria")) {
        parametroCategoria = request.getParameter("categoria");
    }
    ArrayList<Pregunta> preguntas =  Pregunta.todas("DESC", parametroCategoria);
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
        <title>CompraFy | Foro </title>
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
                    <%@include file="../includes/mensajes.jsp"%>
                    <% for(Pregunta p : preguntas) { %>
                    <div class="item-foro">
                        <div class="cuerpo-item">
                            <h4 class="titulo-item">
                                <a href="<%= Url.linkTo("foro/ver.jsp?id=" + p.getId()) %>">
                                    <strong><%= p.getPregunta() %></strong>
                                </a>
                            </h4>
                            <div class="detalles">
                                <strong class="categoria-item">
                                    <a href="<%= Url.linkTo("foro?categoria=" + p.getCategoria().getAlias()) %>">
                                        <%= p.getCategoria().getNombre() %>
                                    </a>
                                </strong>

                                <span class="texto-gris date"><%= p.getCreadoEl() %></span>
                                Por <strong><%= p.getUser().getNombre() %></strong>
                            </div>
                            <p class="texto-gris">
                                <%= p.getDescripcion() %>
                            </p>
                        </div>
                        <hr><br>
                    </div>
                    <% } %>
                </div>

            </div>

            <%@include file="../includes/footer.jsp" %>
            
        </div>
    </body>
</html>
