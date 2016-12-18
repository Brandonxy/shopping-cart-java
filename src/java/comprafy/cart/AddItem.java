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
public class AddItem extends HttpServlet {

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
            
            /*
            ** Obtener la session
            */
            HttpSession hs = request.getSession(false);            
            
            if(hs.getAttribute("Cart") == null) {
                hs = request.getSession(true);
                hs.setAttribute("Cart", new LinkedList<CartItem>());
            }
            
            LinkedList<CartItem> cart  = (LinkedList<CartItem>) hs.getAttribute("Cart");
            
            
            /*
            ** Agregar el producto al carro
            */
            
            
            if(request.getParameter("productId") != null) {
                
                Long productId = Long.parseLong(request.getParameter("productId"));
                
                ResultSet p = Producto.find("productos", productId);
                
                try {
                    
                    if(p.next()) {
                        boolean exists = false;
                        
                        for(CartItem ci : cart) {
                            if(ci.getId() == productId && p.getInt("stock") > 0 ) {
                                
                                /* El producto existe en el carro entonces
                                ** actualizamos la cantidad y el stock
                                */
                                int aux = ci.getCantidad();
                                ci.setCantidad(aux + 1);
                                Producto.updateStock(p.getInt("stock") - 1, productId);
                                exists = true;
                            }
                        }
                        
                        if(!exists) {
                            if(p.getInt("stock") > 0) {
                                
                                cart.add(new CartItem(p.getInt("id"), 
                                   p.getString("foto"), 
                                   p.getString("nombre"),
                                   p.getString("descripcion"), 
                                   p.getInt("precio"), 1));
                                
                                /* 
                                ** Actualizar el stock despues de
                                ** agregar un producto al carro
                                */
                                Producto.updateStock(p.getInt("stock") - 1, productId);
                            }
                        }
                        
                        response.sendRedirect("cart.jsp");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(AddItem.class.getName()).log(Level.SEVERE, null, ex);
                    out.println("exception" + ex);
                }

                    
                
            } else {
                out.println(request.getParameter("productId"));
            }
            
        }
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
