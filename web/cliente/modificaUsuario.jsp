<%@page import="java.sql.*" %>
<%
    // 1.- Recuperar los datos desde el formulario Web.
    String idUsuario = request.getParameter("id");
    String nom = request.getParameter("nomUsuario");
    String ape = request.getParameter("apeUsuario");
    String edad= request.getParameter("edadUsuario");
    String sexo = request.getParameter("sexoUsuario");
    // 2.- Insertar los datos en una tabla de la BD.
    try{
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/BDUsuario", "inacap", "inacap");
        String sql = "update inacap.Usuario set nombre='"+nom+"', apellido='"+ape+"', edad="+edad+", sexo='"+sexo+"' where id=" +idUsuario;
        Statement st = conn.createStatement();
        st.execute(sql);
        // 3.- Redireccionar el browser del usuario hacia el listado de datos.
        response.sendRedirect("ListadoUsuarios.jsp");
    }catch(Exception e)
    {
        System.out.println("Excepción de SQL: " + e);
    }

%>