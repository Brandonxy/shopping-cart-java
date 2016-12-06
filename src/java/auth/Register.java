package auth;

import bd.ConexionBD;
import bd.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.codec.binary.StringUtils;

/**
 *
 * @author unknown
 */
public class Register extends HttpServlet {

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
            
            
            //Recuperar Datos
            String run = request.getParameter("runUs");
            String dv  = request.getParameter("dv");
            String cla = request.getParameter("passUs");
            
            String nom = request.getParameter("nomUs");
            
            String ape = request.getParameter("apeUs");
            
            String tel = request.getParameter("telUs");
            
            int edad = 0;
            int pais  = 0;
            int region = 0;
            int comuna = 0;
            
            HttpSession hs = request.getSession(true);
            
            hs.setAttribute("oldNombre", nom);
            hs.setAttribute("oldApellido", ape);
            hs.setAttribute("oldRun", run);
            hs.setAttribute("oldDv", dv);
            hs.setAttribute("oldTelefono", tel);
            
            
            if(nom.equalsIgnoreCase("")) {
                hs.setAttribute("error", "El Nombre no puede estar vacío.");
                hs.setAttribute("oldnombre", nom);
                response.sendRedirect("register.jsp");
                return;
            }
            if(nom.length() > 50) {
                hs.setAttribute("error", "El Nombre no puede ser mayor a 50 caracteres.");
                response.sendRedirect("register.jsp");
                return;
            }
            if(ape.equalsIgnoreCase("")) {
                hs.setAttribute("error", "El Apellido no puede estar vacío.");
                response.sendRedirect("register.jsp");
                return;
            }
            if(ape.length() > 50) {
                hs.setAttribute("error", "El Apellido no puede ser mayor a 50 caracteres.");
                response.sendRedirect("register.jsp");
                return;
            }
            
            if(run.equalsIgnoreCase("")) {
                hs.setAttribute("error", "El Run no puede estar vacío.");
                response.sendRedirect("register.jsp");
                return;
            }
            if(run.length() > 8) {
                hs.setAttribute("error", "El Run no puede ser mayor a 8 caracteres.");
                response.sendRedirect("register.jsp");
                return;
            }
            
            if(dv.equalsIgnoreCase("")) {
                hs.setAttribute("error", "El Digito verificador no puede estar vacío.");
                response.sendRedirect("register.jsp");
                return;
            }
            if(dv.length() > 1) {
                hs.setAttribute("error", "El Digito verificador no puede ser mayor a 1 caracter.");
                response.sendRedirect("register.jsp");
                return;
            }
            try {
                edad = Integer.parseInt(request.getParameter("edUs"));
                hs.setAttribute("oldEdad", edad);
            } catch(NumberFormatException e) {
                hs.setAttribute("error", "La Edad debe ser un valor numerico.");
                response.sendRedirect("register.jsp");
                return;
            }
            
            if(tel.equals("")) {
                hs.setAttribute("error", "El Telefóno no puede estar vacío.");
                response.sendRedirect("register.jsp");
                return;
            }
            try {
                pais    = Integer.parseInt(request.getParameter("pais"));
                region  = Integer.parseInt(request.getParameter("region"));
                comuna  = Integer.parseInt(request.getParameter("comuna"));
            } catch(NumberFormatException e) {
                hs.setAttribute("error", "Pais, Región o comuna seleccion incorrecta.");
                response.sendRedirect("register.jsp");
                return;
            }
            
            if(cla.equals("")) {
                hs.setAttribute("error", "Debes escribir una contraseña.");
                response.sendRedirect("register.jsp");
                return;
            }
            if(cla.length() < 6) {
                hs.setAttribute("error", "Contraseña debe tener minimo 6 caracteres.");
                response.sendRedirect("register.jsp");
                return;
            }
            if(cla.length() > 64) {
                hs.setAttribute("error", "La contraseña es demasiado larga");
                response.sendRedirect("register.jsp");
                return;
            }
            
            
            
            
           
            try
            {
                
                Connection conn = ConexionBD.getConexion();

                String sql = "insert into inacap.clientes (pais_id, region_id, comuna_id,"
                        + "activado, nombre, apellido, run, password, "
                        + "edad, telefono, creado_el, actualizado_el) " +
                             "values (?,?,?,?,?,?,?,?,?,?,?,?)";

                PreparedStatement pst = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); 
                
                pst.setInt(1, pais);
                pst.setInt(2, region);
                pst.setInt(3, comuna);
                pst.setInt(4, 0);
                pst.setString(5, nom);
                pst.setString(6, ape);
                pst.setString(7, run + "-" + dv);
                pst.setString(8, cla);
                pst.setInt(9, edad);
                pst.setString(10, tel);
                
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = new Date();
                
                pst.setString(11, dateFormat.format(date));
                pst.setString(12, "0000-00-00 00:00:00");
                

                
                
                
                
                pst.executeUpdate();
                
                ResultSet rs = pst.getGeneratedKeys();
                rs.next();
                out.println(rs);    
                int userId = rs.getInt(1);
                
                
                
                
                /**
                 * Return the id of the registered user
                 */
        
                ResultSet user = User.find("clientes", userId);
                user.next();
                
                hs.setAttribute("User", new User(
                                                user.getInt("id"), 
                                                user.getString("nombre"), 
                                                user.getString("apellido"),
                                                user.getString("run"), 
                                                user.getInt("edad"), 
                                                user.getString("telefono")));
                hs.removeAttribute("error");
                hs.removeAttribute("oldNombre");
                hs.removeAttribute("oldApellido");
                hs.removeAttribute("oldRun");
                hs.removeAttribute("oldDv");
                hs.removeAttribute("oldEdad");
                hs.removeAttribute("oldTelefono");

                response.sendRedirect("administrador/BienvenidaAdmin.jsp");
            } catch(SQLException e) {
                out.println("Excepción de SQL :" + e.getMessage());
            }
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
    
    public static boolean ValidarRut(int rut, char dv)
    {
        int m = 0, s = 1;
        for (; rut != 0; rut /= 10)
        {
            s = (s + rut % 10 * (9 - m++ % 6)) % 11;
        }
        return dv == (char) (s != 0 ? s + 47 : 75);
    }
}
