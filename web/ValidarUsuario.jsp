<%@page import="java.sql.*,javax.servlet.http.HttpSession,bd.*" %>
<%
    String run = request.getParameter("runUsuario");
    String pass = request.getParameter("passUsuario");
    
    HttpSession hs = request.getSession(true);
    
    try
    {
        Connection conn = ConexionBD.getConexion();
             
        String sql      = "select * from inacap.Clientes where run=? and clave=? ";
        PreparedStatement pst = conn.prepareStatement(sql);
        pst.setString(1, run);
        pst.setString(2, pass);
        ResultSet rs = pst.executeQuery();
        //out.println(run + pass);
        // Validar los datos recién recuperados.
        if( rs.next() == true )
        {
            hs.setAttribute( "rol", rs.getString("rol") );
            
            if( hs.getAttribute("rol").equals("admin") )
                response.sendRedirect("administrador/BienvenidaAdmin.jsp");
            else if( hs.getAttribute("rol").equals("Vendedor") )
                response.sendRedirect("vendedor/BienvenidaVendedor.jsp");
            else if( hs.getAttribute("rol").equals("Cliente") )
                response.sendRedirect("cliente/BienvenidaCliente.jsp");
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
%>