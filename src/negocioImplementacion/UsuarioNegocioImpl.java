package negocioImplementacion;

import dao.UsuarioDao;
import daoImplementacion.UsuarioDaoImpl;
import entidades.Usuario;
import negocio.UsuarioNegocio;

public class UsuarioNegocioImpl implements UsuarioNegocio {
    private UsuarioDao usuarioDao = new UsuarioDaoImpl();

    @Override
    public Usuario validarUsuario(String nombreUsuario, String contrasenia) {
        return usuarioDao.validarUsuario(nombreUsuario, contrasenia);
    }
    
    @Override
    public boolean actualizarPassword(String usuario, String nuevaClave) {
        return usuarioDao.actualizarPassword(usuario, nuevaClave);
    }
    
    
    @Override
    public boolean existeUsuarioActivo(String nombreUsuario) {
        return usuarioDao.existeUsuarioActivo(nombreUsuario);
    }
    
    @Override
    public boolean validarPassword(String nombreUsuario, String password) {
        return usuarioDao.validarPassword(nombreUsuario, password);
    }
    
  
}
