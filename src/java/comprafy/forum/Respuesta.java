package comprafy.forum;

import bd.User;
import java.util.Date;

public class Respuesta {
    
    private Long id;
    private Long preguntaId;
    private Long clientId;
    private String respuesta;
    private Date creadoEl;
    
    private User user;

    public Respuesta(Long id, Long preguntaId, Long clientId, String respuesta, Date creadoEl) {
        this.id = id;
        this.preguntaId = preguntaId;
        this.clientId = clientId;
        this.respuesta = respuesta;
        this.creadoEl = creadoEl;
    }
    
    public Respuesta() {
        this.id = null;
        this.preguntaId = null;
        this.clientId = null;
        this.respuesta = null;
        this.creadoEl = null;
        
        this.user = null;
    }
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPreguntaId() {
        return preguntaId;
    }

    public void setPreguntaId(Long preguntaId) {
        this.preguntaId = preguntaId;
    }

    public Long getClientId() {
        return clientId;
    }

    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public Date getCreadoEl() {
        return creadoEl;
    }

    public void setCreadoEl(Date creadoEl) {
        this.creadoEl = creadoEl;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
}
