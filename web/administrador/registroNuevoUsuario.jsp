<%@page import="java.sql.*, bd.ConexionBD" %>
<%
    //Recuperar Datos
    String run = request.getParameter("runUs");
    String cla = request.getParameter("passUs");
    String nom = request.getParameter("nomUs");
    String ape = request.getParameter("apeUs");
    String edad = request.getParameter("edUs");
    String tel = request.getParameter("telUs");
    String pais = request.getParameter("paisUs");
    String ciu = request.getParameter("ciuUs");
    String comu = request.getParameter("comUs");
    String rol = request.getParameter("rolUs");
    String est = request.getParameter("esUs");
    out.println(cla);
    try
    {
        Connection conn = ConexionBD.getConexion();
           
        String sql = "insert into inacap.clientes (run,clave,nombre,apellido,edad,telefono,pais,ciudad,comuna,rol,estado) " +
                     "values (?,?,?,?,?,?,?,?,?,?,?)";
        
        PreparedStatement pst = conn.prepareStatement(sql); 
        
        pst.setString(1, run);pst.setString(2, cla);
        pst.setString(3, nom);pst.setString(4, ape);
        pst.setString(5, edad);pst.setString(6, tel);
        pst.setString(7, pais);pst.setString(8, ciu);
        pst.setString(9, comu);pst.setString(10, rol); 
        pst.setString(11, est);
        
        pst.execute();
        
        out.println("Ingreso exitoso!");
    }
    catch(SQLException e)
    {
        out.println("Excepción de SQL :" /*(registroNuevoUsuario.jsp): "*/ + e);
    } 
%>