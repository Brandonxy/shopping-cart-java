package comprafy.forum;

import bd.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author BrandonG
 */
public class ModificarPregunta extends HttpServlet {

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
            HttpSession hs = request.getSession(false);
                
            Long id = Long.parseLong(request.getParameter("id"));
            Long categoriaId = Long.parseLong(request.getParameter("categoriaId"));
            String preguntaText = request.getParameter("pregunta");
            String descripcion = request.getParameter("descripcion");
            
            Pregunta pregunta = Pregunta.find(id);
            /**
             * Solo si el usuario inicio sesión
             * y la pregunta le pertenece
             * puede modificarla
             */
            if(User.auth(request) != null && pregunta.getClienteId().equals(User.auth(request).getId())) {
                
                
                if(descripcion.equals("")) {
                    hs.setAttribute("error", "La descripción no puede estar vacia.");
                    response.sendRedirect("foro/crear.jsp");
                    return;
                }
                if(descripcion.length() > 400) {
                    hs.setAttribute("error", "La descripción no puede tener mas de 400 letra.s");
                    response.sendRedirect("foro/crear.jsp");
                    return;
                }

                if(preguntaText.equals("")) {
                    hs.setAttribute("error", "La pregunta no puede estar vacía.");
                    response.sendRedirect("foro/crear.jsp");
                    return;
                }
                if(preguntaText.length() > 100) {
                    hs.setAttribute("error", "La pregunta no puede tener mas de 100 letras.");
                    response.sendRedirect("foro/crear.jsp");
                    return;
                }
                
                Pregunta.modificar(id,categoriaId,preguntaText,descripcion);
                
                request.setAttribute("error", "Pregunta modificada exitosamente");
                response.sendRedirect("foro/ver.jsp?id=" + id);
            } else {
                // No tiene permisos para eliminar esta pregunta
                response.sendRedirect("foro");
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
