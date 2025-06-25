package daoImplementacion;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import dao.PrestamoDao;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.Prestamo;

public class PrestamoDaoImplementacion implements PrestamoDao{

	@Override
	public boolean ejecutarSPsolicitarPrestamo(int idCliente, int idCuenta, BigDecimal monto, int idPlazo) {
		 try
		  {
			 Connection conexion = Conexion.getConexion().getSQLConexion();
			 CallableStatement cst = conexion.prepareCall("CALL banco.SolicitarPrestamo(?,?,?,?)");
			 cst.setInt(1, idCliente);  		
		     cst.setInt(2, idCuenta);             
		     cst.setBigDecimal(3, monto); 
		     cst.setInt(4, idPlazo);  
			 cst.execute();		
			 conexion.commit();

		    return true;
		  }
		  catch (Exception e) {
			e.printStackTrace();
			return false;
		  }
	}

	@Override
	public BigDecimal obtenerCuotaDesdeBD(BigDecimal monto, int idPlazo) {
	    BigDecimal cuota = BigDecimal.ZERO;
	    
	    String sql = "SELECT CalcularCuotaPrestamo(?, ?) AS importeMensual";
	    try (Connection conexion = Conexion.getConexion().getSQLConexion();
	         PreparedStatement ps = conexion.prepareStatement(sql)) {
	        
	        ps.setBigDecimal(1, monto);
	        ps.setInt(2, idPlazo);
	        
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                cuota = rs.getBigDecimal("importeMensual");
	            }
	        }
	    }catch(SQLException e) {
	    	e.printStackTrace();
	        return BigDecimal.ZERO; 
	    }
	    return cuota;
	}
}
