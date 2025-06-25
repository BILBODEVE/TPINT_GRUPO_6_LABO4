package negocio;

import entidades.Usuario;

public interface UsuarioNegocio {
	
    public Usuario validarUsuario(String nombreUsuario, String contrasenia);
    
    public boolean actualizarPassword(String usuario, String nuevaClave);
    
    public boolean existeUsuarioActivo(String nombreUsuario);
    
    public boolean validarPassword(String nombreUsuario, String password);
}
