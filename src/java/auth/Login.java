package auth;

import bd.ConexionBD;
import bd.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brandon
 */
public class Login extends HttpServlet {

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
            
            String run = request.getParameter("run");
            String pass = request.getParameter("password");
            HttpSession hs;
            if(request.getSession(false) == null) {
                 hs = request.getSession(true);
            } else {
                hs = request.getSession(false);
            }

            try
            {
                Connection conn = ConexionBD.getConexion();

                String sql      = "select * from inacap.Clientes where run=? and password=? ";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setString(1, run);
                pst.setString(2, pass);
                ResultSet rs = pst.executeQuery();
                //out.println(run + pass);
                // Validar los datos recién recuperados.
                if( rs.next() )
                {
                    ResultSet user = User.find("clientes", rs.getLong("id"));
                    user.next();
                
                    hs.setAttribute("User", new User(
                                                user.getLong("id"), 
                                                user.getString("nombre"), 
                                                user.getString("apellido"),
                                                user.getString("run"), 
                                                user.getInt("edad"), 
                                                user.getString("telefono")));
                    response.sendRedirect("foro/");
                }
                else
                {
                    out.println("Error: usuario o clave erróneos.");
                    out.println("<br />");
                    out.println("<a href='login.jsp'>Volver al ingreso</a>");
                }
            }
            catch (SQLException e)
            {
                out.println("Excepción de SQL: " + e);
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
