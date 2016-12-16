/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class ResponderPregunta extends HttpServlet {

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
            
            User authUser = User.auth(request);

            Long idPregunta = Long.parseLong(request.getParameter("idPregunta"));
            
            if(authUser == null) {
                hs.setAttribute("error", "Debes iniciar sesión para responder a esta pregunta.");
                response.sendRedirect("foro/ver.jsp?id=" + idPregunta);
                return;
            }
            
            if(request.getParameter("respuesta").equals("")) {
                hs.setAttribute("error", "El comentario no puede estar vacío.");
                response.sendRedirect("foro/ver.jsp?id=" + idPregunta);
                return;
            }
            
            Respuesta respuesta = new Respuesta();
            respuesta.setPreguntaId(idPregunta);

            respuesta.setClientId(authUser.getId());

            respuesta.setRespuesta(request.getParameter("respuesta"));

            Pregunta.guardarRespuesta(respuesta);

            response.sendRedirect("foro/ver.jsp?id=" + idPregunta);
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
