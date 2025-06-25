package dao;

import entidades.Usuario;

public interface UsuarioDao {
    public Usuario validarUsuario(String nombreUsuario, String contrasenia);
    
 
    public boolean actualizarPassword(String usuario, String nuevaClave);
    
    public boolean existeUsuarioActivo(String nombreUsuario);
    
    boolean validarPassword(String nombreUsuario, String password);
}
