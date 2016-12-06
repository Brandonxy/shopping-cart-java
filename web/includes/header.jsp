<%@page import="bd.Url"%>
<%@page import="bd.User"%>
<% 
    User loggedUser = null;
    if(request.getSession(false) != null) {

        loggedUser = (User) request.getSession(false).getAttribute("User");
    }
%>
<header class="header">
    <div class="header-ctn">
        <div class="logo-container">
            <img src="<%= Url.linkTo("assets/img/logo.png") %>">
        </div>
        <nav>
            <ul>
                <li><a href="<%= Url.linkTo("index.jsp")%>">Inicio</a></li>
                <li><a href="<%= Url.linkTo("about.jsp")%>">Acerca de Nosotros</a></li>
                <% if(loggedUser != null) { %>
                    <li><a href="<%= Url.linkTo("administrador/BienvenidaAdmin.jsp") %>"><%= loggedUser.getNombre()  + " " + loggedUser.getApellido() %> <i class="fa fa-user"></i></a></li>
                    <li><a href="<%= Url.linkTo("sign_out.do") %>"><i class="fa fa-sign-out"></i> Salir</a></li>    
                <% } else {%>
                    <li><a href="<%= Url.linkTo("login.jsp")%>" class="login">Iniciar Sesión</a></li>
                    <li><a href="<%= Url.linkTo("register.jsp")%>" class="register">Registrarse</a></li>
                <% } %>
                <li>
                    <a href="<%= Url.linkTo("cart.jsp") %>" class="shopping-icon">
                        <i class="fa fa-shopping-cart"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</header>
                        