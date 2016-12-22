<%@page import="java.util.LinkedList"%>
<%@page import="comprafy.cart.CartItem"%>
<%
    HttpSession hs = request.getSession(false);
    
    LinkedList<CartItem> cartItems = (LinkedList<CartItem>) hs.getAttribute("Cart");
        
    Object temp = hs.getAttribute("error");
    
    hs.removeAttribute("error");
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
                <h4><span class="fa fa-shopping-cart"></span> Carro de compras</h4>
                
               
                <%@include file="includes/mensajes.jsp" %>
                <table class="tabla-productos">
                    <thead>
                        <th>Imagen</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Cantidad</th>
                        <th>Total</th>
                        <th>Acciones</th> 
                    </thead>
                    <tbody>
                        <% if(cartItems != null) { %>
                            <% for(CartItem p : cartItems) { %>
                                
                                <tr>
                                    
                                    <td>
                                        <img 
                                            class="img-p" src="<%= Url.linkTo("images/") + p.getFoto() %>">
                                    </td>

                                    <td>
                                        <h4 class="product-name"><strong><%= p.getNombre() %></strong></h4>
                                    </td>

                                    <td><h4><small><%= p.getDescripcion() %></small></h4></td>

                                    <td><strong> <i class="fa fa-dollar"></i> <%= p.getPrecio() %><span class="text-muted">x</span></strong></td>
                                    
                                <form action="update_cart.do" method="get">
                                    <input type="hidden" name="productId" value="<%= p.getId()%>">
                                    <td><div class="col-xs-2"><input type="text" class="textfield" name="cantidad" value="<%= p.getCantidad() %>"></div>
                                        <button type="submit" class="btn">Actualizar</button></td>
                                </form>
                                    <td>
                                    <strong> <i class="fa fa-dollar"></i><%= p.getPrecio() * p.getCantidad() %></strong>
                                </td>

                                    <td><a href="remove_item.do?productId=<%= p.getId() %>" class="btn btn-link btn-xs"><span class="fa fa-trash"> </span></a></td>


                                </tr>
                            <% } %>
                        <% } else  { %>
                            <div class="alert alert-info">
                                Tu carro de compras esta vacío.
                            </div>
                        <% } %>

                    </tbody>
                </table>
                        
                        
                    
                                    
            </div>

            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>

