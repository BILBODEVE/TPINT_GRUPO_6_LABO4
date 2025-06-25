package daoImplementacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.CuentaTipoDao;
import entidades.CuentaTipo;
import utilidades.ManejoCaractEspecial;

public class CuentaTipoDaoImplementacion implements CuentaTipoDao {

	@Override
	public ArrayList<CuentaTipo> listar() {
		ArrayList<CuentaTipo> listaTiposCuentas = new ArrayList<CuentaTipo>();

		Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
       
        String query ="SELECT id, descripcion FROM Tipos_Cuentas";
        
		try {
			conexion = Conexion.getConexion().getSQLConexion();
			statement = conexion.prepareStatement(query);
			rs = statement.executeQuery();
			
			while (rs.next()) {
				CuentaTipo tipoCuenta = new CuentaTipo();
				tipoCuenta.setId(rs.getInt("id"));
				tipoCuenta.setDescripcion(ManejoCaractEspecial.manejarCaracterEspecial(rs.getString("descripcion")));
				listaTiposCuentas.add(tipoCuenta);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return listaTiposCuentas;
	}

	@Override
	public CuentaTipo buscarPorId(int tipoCuentaId) {
		Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
       
        String query ="SELECT id, descripcion FROM Tipos_Cuentas WHERE id= ?";
        
		try {
			conexion = Conexion.getConexion().getSQLConexion();
			statement = conexion.prepareStatement(query);
			statement.setInt(1,tipoCuentaId);
			rs = statement.executeQuery();
			
			while (rs.next()) {
				CuentaTipo tipoCuenta = new CuentaTipo();
				tipoCuenta.setId(rs.getInt("id"));
				tipoCuenta.setDescripcion(ManejoCaractEspecial.manejarCaracterEspecial(rs.getString("descripcion")));
				return tipoCuenta;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
