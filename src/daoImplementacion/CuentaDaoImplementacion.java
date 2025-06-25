package daoImplementacion;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dao.CuentaDao;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.CuentaTipo;
import utilidades.ManejoCaractEspecial;

public class CuentaDaoImplementacion implements CuentaDao {

	@Override
	public boolean insertarCuenta(Cuenta cuenta) {
		String query ="INSERT INTO cuentas (id_cliente, fecha_creacion, numero_de_cuenta, id_tipo_cuenta, cbu, saldo, estado) VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		Connection conexion = null;
        PreparedStatement statement= null;
        
		try {
			conexion = Conexion.getConexion().getSQLConexion();
			statement = conexion.prepareStatement(query);
			statement.setInt(1, cuenta.getCliente().getId());
			statement.setDate(2, new java.sql.Date(cuenta.getFechaCreacion().getTime()));
			statement.setString(3, cuenta.getNumeroCuenta());
			statement.setInt(4, cuenta.getTipoCuenta().getId());
			statement.setString(5, cuenta.getCBU().toString());
			statement.setDouble(6, cuenta.getSaldo());
			statement.setBoolean(7, cuenta.isEstado());
			
			if (statement.executeUpdate() > 0) {
				conexion.commit();
				return true;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	@Override
	public List<Cuenta> listar() {
	    List<Cuenta> cuentas = new ArrayList<Cuenta>();
	    
	    Connection conexion = null;
	    PreparedStatement statement= null;
	  	 	ResultSet rs= null;
	   
	    String query = "SELECT c.id AS cuenta_id, c.fecha_creacion, c.numero_de_cuenta, "+
	            "c.id_tipo_cuenta AS tipo_cuenta_id, c.cbu, c.saldo, c.estado, "+
	       		"cl.nombre, cl.apellido, cl.dni, "+
	            "t.descripcion AS tipo_descripcion FROM cuentas c "+
	            "INNER JOIN Clientes cl ON c.id_cliente = cl.id "+
	            "INNER JOIN Tipos_Cuentas t ON c.id_tipo_cuenta = t.id";
	    
	    try {
	       	conexion = Conexion.getConexion().getSQLConexion();
	       	 statement = conexion.prepareStatement(query);
	       	 rs = statement.executeQuery();

	        while (rs.next()) {
	            Cuenta cuenta = new Cuenta();
	            Cliente cliente = new Cliente();
	            CuentaTipo tipoCuenta = new CuentaTipo();

	            cuenta.setId(rs.getInt("cuenta_id"));
	            cuenta.setFechaCreacion(rs.getDate("fecha_creacion"));
	            cuenta.setNumeroCuenta(rs.getString("numero_de_cuenta"));

	            tipoCuenta.setDescripcion(ManejoCaractEspecial.manejarCaracterEspecial(rs.getString("tipo_descripcion")));
	            cuenta.setTipoCuenta(tipoCuenta);
	            
	            cuenta.setCBU(new BigInteger(rs.getString("cbu")));
	            cuenta.setSaldo(rs.getDouble("saldo"));
	            cuenta.setEstado(rs.getBoolean("estado"));

	            cliente.setNombre(rs.getString("nombre"));
	            cliente.setApellido(rs.getString("apellido"));
	            cliente.setDNI(rs.getString("dni"));
	            cuenta.setCliente(cliente);

	            cuentas.add(cuenta);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cuentas;
	}
	
	@Override
	public List<Cuenta> listarPorDNI(int dni) {
	    List<Cuenta> cuentas = new ArrayList<Cuenta>();
	    
	    Connection conexion = null;
	    PreparedStatement statement= null;
	  	 	ResultSet rs= null;
	   
	    String query = "SELECT c.id AS cuenta_id, c.fecha_creacion, c.numero_de_cuenta, "+
	            "c.id_tipo_cuenta AS tipo_cuenta_id, c.cbu, c.saldo, c.estado, "+
	       		"cl.nombre, cl.apellido, cl.dni, "+
	            "t.descripcion AS tipo_descripcion FROM cuentas c "+
	            "INNER JOIN Clientes cl ON c.id_cliente = cl.id "+
	            "INNER JOIN Tipos_Cuentas t ON c.id_tipo_cuenta = t.id "+
	            "WHERE cl.dni LIKE ?";
	    
	    try {
	       	conexion = Conexion.getConexion().getSQLConexion();
	       	 statement = conexion.prepareStatement(query);
	       	 statement.setString(1, "%" + dni + "%");
	       	 rs = statement.executeQuery();
	       	 
	        while (rs.next()) {
	            Cuenta cuenta = new Cuenta();
	            Cliente cliente = new Cliente();
	            CuentaTipo tipoCuenta = new CuentaTipo();

	            cuenta.setId(rs.getInt("cuenta_id"));
	            cuenta.setFechaCreacion(rs.getDate("fecha_creacion"));
	            cuenta.setNumeroCuenta(rs.getString("numero_de_cuenta"));

	            tipoCuenta.setDescripcion(ManejoCaractEspecial.manejarCaracterEspecial(rs.getString("tipo_descripcion")));
	            cuenta.setTipoCuenta(tipoCuenta);
	            
	            cuenta.setCBU(new BigInteger(rs.getString("cbu")));
	            cuenta.setSaldo(rs.getDouble("saldo"));
	            cuenta.setEstado(rs.getBoolean("estado"));

	            cliente.setNombre(rs.getString("nombre"));
	            cliente.setApellido(rs.getString("apellido"));
	            cliente.setDNI(rs.getString("dni"));
	            cuenta.setCliente(cliente);

	            cuentas.add(cuenta);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cuentas;
	}	

 	
	public List<Cuenta> listarCuentasPorClienteId(int clienteId) {
	    List<Cuenta> lista = new ArrayList<>();
	    
	    Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
	   
	    String query = "SELECT c.id, c.cbu, c.saldo, c.numero_de_cuenta, c.fecha_creacion, c.estado, " +
                "tc.id AS id_tipo_cuenta, tc.descripcion AS tipo_descripcion " +
                "FROM cuentas c " +
                "INNER JOIN tipos_cuentas tc ON c.id_tipo_cuenta = tc.id " +
                "WHERE c.id_cliente = ? AND c.estado = 1 AND tc.descripcion IN ('Caja de ahorro', 'Cuenta corriente')";

	    try {
	    	conexion = Conexion.getConexion().getSQLConexion();
	    	statement = conexion.prepareStatement(query);
	    	statement.setInt(1, clienteId);
	    	rs = statement.executeQuery();

	        while (rs.next()) {
	        	 Cuenta cuenta = new Cuenta();
	             cuenta.setId(rs.getInt("id"));
	             cuenta.setCBU(new BigInteger(rs.getString("cbu")));
	             cuenta.setSaldo(rs.getDouble("saldo"));
	             cuenta.setNumeroCuenta(rs.getString("numero_de_cuenta"));
	             cuenta.setFechaCreacion(rs.getDate("fecha_creacion"));
	             cuenta.setEstado(rs.getBoolean("estado"));
	            
	            CuentaTipo tipoCuenta = new CuentaTipo();
	            tipoCuenta.setId(rs.getInt("id_tipo_cuenta")); 
	            tipoCuenta.setDescripcion(rs.getString("tipo_descripcion"));
	            cuenta.setTipoCuenta(tipoCuenta);

	            lista.add(cuenta);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return lista;
	}
	
	
	@Override
	public Cuenta obtenerCuentaPorCBU(String cbu) {
	    Cuenta cuenta = null;
	    Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
   	 	
	    String query = "SELECT * FROM cuentas WHERE cbu = ?";

	    try { 
	    	conexion = Conexion.getConexion().getSQLConexion();
	    	statement = conexion.prepareStatement(query);
	    	statement.setString(1, cbu);
	    	rs = statement.executeQuery();

	        if (rs.next()) {
	            cuenta = new Cuenta();
	            cuenta.setId(rs.getInt("id"));
	            cuenta.setCBU(new BigInteger(rs.getString("cbu")));
	            cuenta.setSaldo(rs.getDouble("saldo"));
	            cuenta.setNumeroCuenta(rs.getString("numero_de_cuenta"));
	            cuenta.setEstado(rs.getBoolean("estado"));
	           
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return cuenta;
	}

	@Override
	public Cuenta obtenerCuentaPorId(int id) {
	    Cuenta cuenta = null;
	    Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
   	 	
	    String query = "SELECT * FROM cuentas WHERE id = ?";

	    try{ 
	    	conexion = Conexion.getConexion().getSQLConexion();
	    	statement = conexion.prepareStatement(query);
	        
	    	statement.setInt(1, id);
	    	rs = statement.executeQuery();

	        if (rs.next()) {
	            cuenta = new Cuenta();
	            cuenta.setId(rs.getInt("id"));
	            cuenta.setCBU(new BigInteger(rs.getString("cbu")));
	            cuenta.setSaldo(rs.getDouble("saldo"));
	            cuenta.setNumeroCuenta(rs.getString("numero_de_cuenta"));
	            cuenta.setEstado(rs.getBoolean("estado"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cuenta;
	}


	@Override
    public int cuentasActivas(int idCliente) {
        int cuentasActivas = 0;
        Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
       
        String query = "SELECT COUNT(*) AS cantidad_cuentas FROM Cuentas WHERE id_cliente = ? AND estado = 1";

        try {
        	conexion = Conexion.getConexion().getSQLConexion();
       	 statement = conexion.prepareStatement(query);
       	 statement.setInt(1, idCliente);
       	 rs = statement.executeQuery();

            if (rs.next()) {
            	cuentasActivas = rs.getInt("cantidad_cuentas");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cuentasActivas;
    }

	@Override
	public boolean existeCbu(BigInteger cbu) {
        Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
       
        String query = "SELECT COUNT(*) AS coincidencias FROM Cuentas WHERE cbu = ?";

        try {
        	conexion = Conexion.getConexion().getSQLConexion();
       	 statement = conexion.prepareStatement(query);
       	 statement.setString(1, cbu.toString());
       	 rs = statement.executeQuery();

            if (rs.next()) {
            	 int count = rs.getInt("coincidencias");
                 return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
		return false;
	}
	
	@Override
	public String obtenerUltimoNumeroCuenta() {
		String nroCta="";
		Connection conexion = null;
        PreparedStatement statement= null;
   	 	ResultSet rs= null;
	    String query = "SELECT numero_de_cuenta FROM Cuentas WHERE numero_de_cuenta LIKE '12345678-%' ORDER BY numero_de_cuenta DESC LIMIT 1";
	    try {
        	conexion = Conexion.getConexion().getSQLConexion();
       	 statement = conexion.prepareStatement(query);
       	 rs = statement.executeQuery();

            if (rs.next()) {
            	nroCta = rs.getString("numero_de_cuenta");
         		return nroCta;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return nroCta;
	}	
}
