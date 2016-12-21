package comprafy.forum;

import bd.Conexion;
import bd.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class Pregunta extends Conexion {
    
    private static final String table = "preguntas";
    
    private Long id;
    private Long categoriaId;
    private Categoria categoria;
    private User user;
    private Long clienteId;
    private String pregunta;
    private String descripcion;
    private Date creadoEl;
    
    private ArrayList<Respuesta> respuestas;
    
    private int respuestasTotales;

    public Pregunta(Long id, Long categoriaId, Long clienteId, String pregunta, String descripcion, Date creadoEl) {
        this.id = id;
        this.categoriaId = categoriaId;
        this.clienteId = clienteId;
        this.pregunta = pregunta;
        this.descripcion = descripcion;
        this.creadoEl = creadoEl;
    }
    
    public Pregunta() {
        this.id = null;
        this.categoriaId = null;
        this.clienteId = null;
        this.pregunta = null;
        this.descripcion = null;
        this.creadoEl = null;
        this.respuestas = null;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCategoriaId() {
        return categoriaId;
    }

    public void setCategoriaId(Long categoriaId) {
        this.categoriaId = categoriaId;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    public Long getClienteId() {
        return clienteId;
    }

    public void setClienteId(Long clienteId) {
        this.clienteId = clienteId;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
        
    public Date getCreadoEl() {
        return creadoEl;
    }

    public void setCreadoEl(Date creadoEl) {
        this.creadoEl = creadoEl;
    }

    public ArrayList<Respuesta> getRespuestas() {
        return respuestas;
    }

    public void setRespuestas(ArrayList<Respuesta> respuestas) {
        this.respuestas = respuestas;
    }

    public int getRespuestasTotales() {
        return respuestasTotales;
    }

    public void setRespuestasTotales(int respuestasTotales) {
        this.respuestasTotales = respuestasTotales;
    }
    
    public static int guardarRespuesta(Respuesta respuesta) {
        
        try {
            String query = "insert into respuestas (pregunta_id,cliente_id,respuesta, creado_el) values "
                    + "(?,?,?,?)";
            
            PreparedStatement pst = conn.prepareStatement(query);
            
            pst.setLong(1, respuesta.getPreguntaId());
            pst.setLong(2, respuesta.getClientId());
            pst.setString(3, respuesta.getRespuesta());
            pst.setString(4, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
            
            return pst.executeUpdate();
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        
        
        return 0;
    }

    public static ArrayList<Pregunta> todas(String orderBy, String valueWhere)
    {
        try {
            
            
            
            String Query = "select clientes.*, c.nombre as nombre_categoria, c.alias, " +
                    "p.id as idPregunta,p.categoria_id,p.cliente_id,p.pregunta,p.descripcion,p.creado_el " +
                    "from preguntas p, categorias c, clientes where p.categoria_id = c.id and p.cliente_id = clientes.id " + ((!valueWhere.equals("") ? " and c.alias = '" + valueWhere  + "'" : "")) +" order by p.id DESC ";
            
            Statement st = conn.createStatement();
            
            ResultSet rs = st.executeQuery(Query);
            
            ArrayList<Pregunta> preguntas = new ArrayList<>();
            
            while(rs.next()) {
                
                Pregunta pregunta = new Pregunta();
                pregunta.setId(rs.getLong("idPregunta"));
                pregunta.setCategoriaId(rs.getLong("categoria_id"));
                pregunta.setClienteId(rs.getLong("cliente_id"));
                pregunta.setPregunta(rs.getString("pregunta"));
                pregunta.setDescripcion(rs.getString("descripcion"));
                pregunta.setCreadoEl(rs.getDate("creado_el"));
                
                
                User user = new User();
                user.setNombre(rs.getString("nombre"));
                user.setApellido(rs.getString("apellido"));
                
                pregunta.setUser(user);
                
                Categoria categoria = new Categoria();
                categoria.setId(rs.getLong("categoria_id"));
                categoria.setAlias(rs.getString("alias"));
                categoria.setNombre(rs.getString("nombre_categoria"));
                
                pregunta.setCategoria(categoria);
                
                preguntas.add(pregunta);
            }
            
            return preguntas;
            
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public static Pregunta find(Long id) {
        try {
            
            Statement st = conn.createStatement();
            
            String Query = "select clientes.*, c.nombre as nombre_categoria , p.id as idPregunta,p.categoria_id,p.cliente_id,p.pregunta,p.descripcion,p.creado_el from preguntas p, categorias c, clientes where  p.categoria_id = c.id and p.cliente_id = clientes.id and p.ID = " + id;

            ResultSet rs = st.executeQuery(Query);
            
            rs.next();
                            
            Pregunta pregunta = new Pregunta();
            pregunta.setId(rs.getLong("idPregunta"));
            pregunta.setCategoriaId(rs.getLong("categoria_id"));
            pregunta.setClienteId(rs.getLong("cliente_id"));
            pregunta.setPregunta(rs.getString("pregunta"));
            pregunta.setDescripcion(rs.getString("descripcion"));
            pregunta.setCreadoEl(rs.getDate("creado_el"));
            
            /**
             * Cargar respuestas para esta pregunta
             */
            
            String getRespuestas = "select count(respuestas.id) as respuestas_totales, respuestas.*, clientes.nombre as nombre_cliente"
                    + " from respuestas, clientes "
                    + " where respuestas.cliente_id = clientes.id and pregunta_id=" + pregunta.getId()
                    + " group by respuestas.id, respuestas.pregunta_id, respuestas.cliente_id,"
                    + " respuestas.respuesta, respuestas.creado_el, clientes.nombre order by respuestas.id DESC";
            
            Statement st2 = conn.createStatement();
            
            ResultSet rs2 = st2.executeQuery(getRespuestas);
            ArrayList<Respuesta> respuestas = new ArrayList<>();
            
            int totalResp = 0;
            
            while(rs2.next()) {
                Respuesta respuesta = new Respuesta();
                respuesta.setId(rs.getLong("id"));
                respuesta.setPreguntaId(rs2.getLong("pregunta_id"));
                respuesta.setClientId(rs2.getLong("cliente_id"));
                respuesta.setRespuesta(rs2.getString("respuesta"));
                respuesta.setCreadoEl(rs2.getDate("creado_el"));
                respuestas.add(respuesta);
                
                User userResp = new User();
                userResp.setNombre(rs2.getString("nombre_cliente"));
                respuesta.setUser(userResp);
                
                totalResp += rs2.getInt("respuestas_totales");
            }
            
            pregunta.setRespuestasTotales(totalResp);
            pregunta.setRespuestas(respuestas);
            
            User user = new User();
            user.setNombre(rs.getString("nombre"));
            user.setApellido(rs.getString("apellido"));

            pregunta.setUser(user);

            Categoria categoria = new Categoria();
            categoria.setId(rs.getLong("categoria_id"));
            categoria.setNombre(rs.getString("nombre_categoria"));

            pregunta.setCategoria(categoria);

           return pregunta;
            
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
    public static  int eliminar(Long id) {
        
        try {
            String delete = "delete from preguntas where preguntas.id = " + id;
            Statement pst = conn.createStatement();
            
            return pst.executeUpdate(delete);
            
            
        } catch (SQLException ex) {
            
        }
        return 0;
    }
    
    public static int modificar(Long id, Long categoriaId, String pregunta, String descripcion) {
        
       try {
            String sql = "update preguntas set categoria_id = ?, pregunta=?, descripcion=?"
                    + " where id = ?" ;
            PreparedStatement pst = conn.prepareStatement(sql);
            
            pst.setLong(1, categoriaId);
            pst.setString(2, pregunta);
            pst.setString(3, descripcion);
            pst.setLong(4, id);
            return pst.executeUpdate();
            
        } catch (SQLException ex) {
            
        }
        return 0; 
    }
        
}
