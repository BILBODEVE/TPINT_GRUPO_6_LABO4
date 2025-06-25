package daoImplementacion;

import java.sql.*;
import dao.UsuarioDao;
import entidades.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {
    private static final String VALIDAR_USUARIO = 
        "SELECT * FROM usuarios WHERE nombre_usuario = ? AND contrasenia = ? AND estado = true";

    @Override
    public Usuario validarUsuario(String nombreUsuario, String contrasenia) {
    	Usuario usuario = null;

        Connection conexion = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            
            conexion = Conexion.getConexion().getSQLConexion();

            statement = conexion.prepareStatement("SELECT * FROM usuarios WHERE nombre_usuario=? AND contrasenia=?");
            statement.setString(1, nombreUsuario);
            statement.setString(2, contrasenia);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                usuario = new Usuario();
                usuario.setId(resultSet.getInt("id"));
                usuario.setNombreUsuario(resultSet.getString("nombre_usuario"));
                usuario.setIdRol(resultSet.getInt("id_rol"));
                usuario.setEstado(resultSet.getBoolean("estado"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }
    
    
    @Override
    public boolean existeUsuarioActivo(String nombreUsuario) {
        boolean existe = false;
        
        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conexion = Conexion.getConexion().getSQLConexion();
            ps = conexion.prepareStatement("SELECT 1 FROM usuarios WHERE nombre_usuario = ? AND estado = true");
            ps.setString(1, nombreUsuario);

            rs = ps.executeQuery();
            if (rs.next()) {
                existe = true;
            }

        }  catch (Exception e) {
                e.printStackTrace();
            }
        return existe;
    }
    
    
    
    @Override
    public boolean actualizarPassword(String usuario, String nuevaClave) {
        Connection conexion = null;
        PreparedStatement statement = null;
        boolean exito = false;

        try {
            conexion = Conexion.getConexion().getSQLConexion();
            conexion.setAutoCommit(false); 

            statement = conexion.prepareStatement("UPDATE usuarios SET contrasenia=? WHERE nombre_usuario=? AND estado=true");
            statement.setString(1, nuevaClave);
            statement.setString(2, usuario);

            int filas = statement.executeUpdate();
            if (filas > 0) {
                conexion.commit(); 
                exito = true;
            } else {
                conexion.rollback(); 
            }

        } catch (Exception e) {
                e.printStackTrace();
            }

        return exito;
    }
    
    
    
    @Override
    public boolean validarPassword(String nombreUsuario, String password) {
        boolean valido = false;
        Connection conexion = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conexion = Conexion.getConexion().getSQLConexion();
            String sql = "SELECT 1 FROM usuarios WHERE nombre_usuario = ? AND contrasenia = ? AND estado = true";
            ps = conexion.prepareStatement(sql);
            ps.setString(1, nombreUsuario);
            ps.setString(2, password); 

            rs = ps.executeQuery();
            if (rs.next()) {
                valido = true;
            }

        }  catch (Exception e) {
                e.printStackTrace();
            }
   
        return valido;
    }
    
}