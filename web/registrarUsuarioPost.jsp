<%@page import="administrador.InputRule"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bd.ConexionBD"%>
<%@page import="administrador.FormValidator"%>
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
            
            //FormValidator validator = new FormValidator();
            
            String[] rules = {"required"};
            
            //validator.addInputRules(run, rules);
            
            InputRule inp = new InputRule(run);
            
            inp.setRules(rules);
            
            if(inp.validate()) {
                out.println("Validato correctamente");
            } else {
                out.println(inp.getMessages());
            }
            /*
            
            try
            {
                Connection conn = ConexionBD.getConexion();

                String sql = "insert into inacap.clientes (run,clave,nombre,apellido,edad,telefono,pais,ciudad,comuna) " +
                             "values (?,?,?,?,?,?,?,?,?,?,?)";

                PreparedStatement pst = conn.prepareStatement(sql); 

                pst.setString(1, run);pst.setString(2, cla);
                pst.setString(3, nom);pst.setString(4, ape);
                pst.setString(5, edad);pst.setString(6, tel);
                pst.setString(7, pais);pst.setString(8, ciu);
                pst.setString(9, comu);

                pst.execute();

                out.println("Ingreso exitoso!");
            }
            catch(SQLException e)
            {
                out.println("Excepción de SQL :" + e);
            }*/
%>