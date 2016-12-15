<%@page import="bd.Url"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="bd.Producto"%>
<%@page import="java.util.LinkedList"%>
<%@page import="comprafy.cart.CartItem"%>
<%
    ResultSet productos = Producto.all("productos", "DESC");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/head.jsp" %> 
        <title>Taller de programacion 2</title>
    </head>
    <body>
        <div class="wrapper">
            
            <%@include file="includes/header.jsp"%>
            <div class="jumbotron slide-home">
                <div class="fade-home">
                    <div class="ctn-slide">
                        <h1>Bienvenido a CompraFy!</h1>
                        <p>Podrás encontrar todo tipo de productos, desde computadores hasta doctops!.</p>
                        <p><a class="btn btn-primary btn-lg" href="#" role="button">Saber mas</a></p>
                    </div>
                </div>
            </div>
            <div class="container content">
                
                <div class="row">
                    <% if(productos != null) { %>
                        <% while(productos.next()) { %>
                            <div class="col-sm-6 col-md-3">
                                <div class="thumbnail">
                                    <img src="<%= Url.linkTo("images/") + productos.getString("foto") %>" alt="..." class="img-responsive img-product">
                                    <div class="caption">
                                        <p class="product-title">
                                            <%= productos.getString("nombre") %>
                                        </p>

                                    <p class="product-desc"><%= productos.getString("descripcion") %></p>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="text-muted">Stock: </label>    
                                            <span><%= productos.getInt("stock") %></span>
                                        </div>
                                        <div class="col-md-6">
                                            <strong>$ <%= productos.getInt("precio") %></strong>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <a href="add_item.do?productId=<%= productos.getInt("id") %>" class="btn btn-primary btn-block" role="button">
                                                <i class="fa fa-shopping-cart"></i> Añadir
                                            </a> 
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                    <% } %>
                </div>

            </div>

            <%@include file="includes/footer.jsp" %>
            
        </div>
    </body>
</html>
