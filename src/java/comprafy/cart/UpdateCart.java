/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package comprafy.cart;

import bd.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author unknown
 */
public class UpdateCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            Long productId = Long.parseLong(request.getParameter("productId"));
            
            ResultSet p = Producto.find("productos", productId);
            
            int newQuantity  = Integer.parseInt(request.getParameter("cantidad"));

            HttpSession hs = request.getSession(false);
            
            LinkedList<CartItem> cartItems = (LinkedList<CartItem>) hs.getAttribute("Cart");
            try {
                if(p.next()) {
                    
                    for(CartItem ci : cartItems) {
                        
                            /* El producto existe en la carro de compras */

                            if(ci.getId() == productId) {
                                
                                /* La cantidad nueva es 0 por ende borramos el producto 
                                 * del carro de compras 
                                 */

                                if(newQuantity == 0) {
                                    cartItems.remove(ci);
                                }


                                // La cantidad nueva es menor a ala actual
                                // por ende debemos devolver stock a la base de datos
                                if(newQuantity < ci.getCantidad())
                                {
                                    /**
                                     * si hay "x numero" en cantidad actual  y llego aqui
                                     * significa que yo pedi menos de "x numero" y por ende
                                     * tengo que devolver la diferencia de 
                                     * (la cantidad actual - la cantidad nueva)
                                     */

                                    int aux = ci.getCantidad() - newQuantity;

                                    // actualizamos la cantidad del carro
                                    // a la cantidad nueva solicitada
                                    ci.setCantidad(newQuantity);

                                    /** 
                                     * 
                                     * Actualizamos el stock devolviendole la diferencia 
                                     * que se obtiene de restar la cantidad actual a la 
                                     * cantidad nueva.
                                     * 
                                     */
                                    
                                    Producto.updateStock(p.getInt("stock") + aux, productId);
                                }

                                /**
                                 * La cantidad nueva es mayor a la cantidad actual
                                 */
                                if(newQuantity > ci.getCantidad()) {
                                    
                                    /* Aún queda stock disponible */
                                    if(p.getInt("stock") > 0) {
                                        
                                        /**
                                         * Stock maximo disponible es el stock 
                                         * que se obtiene de sumar lo ya 
                                         * solicitado mas el stock que
                                         * existe actualmente en la 
                                         * base de datos
                                         */
                                        int stock_maximo = p.getInt("stock") + ci.getCantidad();

                                        /**
                                         * Diferencia entre la cantidad nueva que se solicita
                                         * y la cantidad que ya se habia solicitado antes
                                         * este valor es el que se debe restar en 
                                         * el stock de la base de datos
                                         */

                                        int aux = newQuantity - ci.getCantidad(); 
                                        
                                        /**
                                         * Si la nueva cantidad solicitada es mayor
                                         * al stock maximo entonces no puede
                                         * actualizarse la cantidad por
                                         * falta de stock
                                         */

                                        if( newQuantity  <= stock_maximo) {
                                            ci.setCantidad(newQuantity);
                                            Producto.updateStock(p.getInt("stock") - aux, productId);
                                        }
                                    }
                                // la cantidad solicitada es igual por lo tanto
                                // no se hace nada y continua igual
                                }
                        }
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(UpdateCart.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("cart.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
