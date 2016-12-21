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
 * @author unknown
 */
public class PublicarPregunta extends HttpServlet {

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
            
            Long categoriaId = Long.parseLong(request.getParameter("categoriaId"));
            
            String preguntaText = request.getParameter("pregunta");
            String descripcion = request.getParameter("descripcion");
            
            hs.setAttribute("old_pregunta", preguntaText);
            hs.setAttribute("old_descripcion", descripcion);
            
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
            
            Pregunta pregunta = new Pregunta();
            pregunta.setCategoriaId(categoriaId);
            pregunta.setPregunta(preguntaText);
            pregunta.setDescripcion(descripcion);
            
            out.println(User.auth(request).guardarPregunta(pregunta, request));
            
            response.sendRedirect("foro/");
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
