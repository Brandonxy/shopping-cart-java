<%@page import="comprafy.forum.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%
    ArrayList<Categoria> categorias = Categoria.all("DESC");
    HttpSession hs = request.getSession(false);
    
    // Mensajes de error
    Object temp = hs.getAttribute("error");
    hs.removeAttribute("error");
    
    /* Recordar valores despues de la validación */
    Object oldPregunta = hs.getAttribute("old_pregunta");
    Object oldDescripcion = hs.getAttribute("old_descripcion");
    
    hs.removeAttribute("old_pregunta");
    hs.removeAttribute("old_descripcion");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear pregunta</title>
        <%@include file="../includes/head.jsp" %>
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
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
                <% if(User.auth(request) != null) { %>
                    <h3 class="title-forum">Nueva pregunta en el foro.</h3>
                    <%@include file="../includes/mensajes.jsp"%>
                    <form action="<%= Url.linkTo("nueva_pregunta.do") %>" method="post">
                        <select class="textfield" name="categoriaId">
                            <% for(Categoria c : categorias) { %>
                            <option value="<%= c.getId() %>"><%= c.getNombre() %></option>
                            <% } %>
                        </select>
                        <br><br>
                        <label>Pregunta</label>
                        <input type="text" class="textfield" name="pregunta" 
                               <% if(oldPregunta != null) { %> value="<%= oldPregunta %>"<% } %>
                               />
                        <br><br>
                        <label>Detalles</label>
                        <textarea class="textfield" name="descripcion" placeholder="Describe tu pregunta..."><% if(oldDescripcion != null) { %><%= oldDescripcion %><% } %></textarea>
                        <button type="submit" class="btn">Publicar pregunta</button>
                    </form>
                <%  } else { %>
                    <div class="mensaje-error">
                        Debes iniciar sesión para participar en el foro.
                    </div>
                <% } %>
            </div>
        </div>
    </body>
</html>
