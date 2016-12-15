
package bd;

import javax.servlet.http.HttpServletRequest;

public class User extends Conexion {
    
    private Long id;
    private String nombre;
    private String apellido;
    private String run;
    private int edad;
    private String telefono;

    public User(Long id, String nombre, String apellido, String run, int edad, String telefono) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.run = run;
        this.edad = edad;
        this.telefono = telefono;
    }

    public User() {
        this.id = null;
        this.nombre = null;
        this.apellido = null;
        this.run = null;
        this.edad = 0;
        this.telefono = null;
    }
    
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getRun() {
        return run;
    }

    public void setRun(String run) {
        this.run = run;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public static User auth(HttpServletRequest request)
    {
        return (User) request.getSession(false).getAttribute("User");
    }
}
