<%@page import="java.util.LinkedList"%>
<%@page import="comprafy.cart.CartItem"%>
<%
    HttpSession hs = request.getSession(false);
    
    LinkedList<CartItem> cartItems = (LinkedList<CartItem>) hs.getAttribute("Cart");
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/head.jsp" %>
        <title>Mi carro de compras</title>
    </head>
    <body>
        <div class="wrapper">
            
            <%@include file="includes/header.jsp" %>
            
            <div class="container content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <h4><span class="fa fa-shopping-cart"></span> Carro de compras</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                
                                <div class="row">
                                    <div class="col-md-6">
                                        Producto
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="col-xs-2 text-right">
                                           Unidad 
                                        </div>
                                        <div class="col-xs-2">
                                            Cantidad
                                        </div>
                                        <div class="col-xs-2">
                                            Subtotal
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <% if(cartItems != null) { %>
                                    <% for(CartItem p : cartItems) { %>

                                        <div class="row">
                                            <div class="col-xs-2"><img class="img-responsive" src="<%= Url.linkTo("images/") + p.getFoto() %>">
                                            </div>
                                            <div class="col-xs-4">
                                                <h4 class="product-name">
                                                    <strong><%= p.getNombre() %></strong>
                                                </h4>

                                                <h4>
                                                    <small><%= p.getDescripcion() %></small>
                                                </h4>
                                            </div>
                                            <div class="col-xs-6">
                                                <div class="col-xs-2 text-right">
                                                    <h6>
                                                        <strong> <i class="fa fa-dollar"></i> <%= p.getPrecio() %> 
                                                            <span class="text-muted">x</span>
                                                        </strong>
                                                    </h6>
                                                </div>

                                                <form action="update_cart.do" method="get">
                                                    <input type="hidden" name="productId" value="<%= p.getId()%>">

                                                    <div class="col-xs-2">
                                                        <input type="text" class="form-control input-sm" name="cantidad" value="<%= p.getCantidad() %>">
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <h6>
                                                            <strong> <i class="fa fa-dollar"></i> 
                                                                <%= p.getPrecio() * p.getCantidad() %>
                                                            </strong>
                                                        </h6>
                                                    </div>
                                                    <div class="col-xs-2">
                                                        <button type="submit" class="btn btn-xs">
                                                            <span class="fa fa-refresh"> </span>
                                                        </button>
                                                    </div>
                                                </form>
                                                <div class="col-xs-2">
                                                    <a href="remove_item.do?productId=<%= p.getId() %>" class="btn btn-link btn-xs">
                                                        <span class="fa fa-trash"> </span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                    <% } %>
                                <% } else  { %>
                                    <div class="alert alert-info">
                                        Tu carro de compras esta vacío.
                                    </div>
                                <% } %>
                            </div>
                            <div class="panel-footer">
                                <div class="row text-center">
                                    <div class="col-xs-9">
                                        <h4 class="text-right">
                                            Total 
                                            <strong>
                                                $
                                            </strong>
                                        </h4>
                                    </div>
                                    <div class="col-xs-3">
                                        <button type="button" class="btn btn-success btn-block">
                                                Checkout
                                        </button>
                                    </div>
                                </div>
                            </div>
			</div>
                    </div>
                </div>
            </div>

            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>

