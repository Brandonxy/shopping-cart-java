<% if(User.auth(request) != null) { %>
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
                        <h3 class="title-forum">
                            <i class="fa fa-edit fa-3x"></i> Modificar: <%= pregunta.getDescripcion() %>
                        </h3>

                        <%@include file="../includes/mensajes.jsp"%>
                        <form action="<%= Url.linkTo("nueva_pregunta.do") %>" method="post">
                            <select class="textfield" name="categoriaId">
                                <% for(Categoria c : categorias) { %>                                        
                                    <option value="<%= c.getId() %>"
                                            <% if(c.getId() == pregunta.getCategoriaId()){ %>
                                                selected
                                            <% } %>
                                        >
                                        <%= c.getNombre() %>
                                    </option>
                                <% } %>
                            </select>
                            <br><br>
                            <label>Pregunta</label>
                            <input type="text" class="textfield" name="pregunta" 
                                   value="<%= pregunta.getPregunta() %>"
                                   />
                            <br><br>
                            <label>Detalles</label>
                            <textarea class="textfield" name="descripcion" placeholder="Describe tu pregunta..."><%= pregunta.getDescripcion() %></textarea>
                            <button type="submit" class="btn">Publicar pregunta</button>
                        </form>
                    </div>
             </div>

            <%@include file="../includes/footer.jsp" %>
            
        </div>
    </body>
</html>
<% } else { %>
<% response.sendRedirect(Url.linkTo("login.jsp")); %>
<% } %>
