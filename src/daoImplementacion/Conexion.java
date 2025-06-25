package daoImplementacion;

import java.sql.Connection;	
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {
	public static Conexion instancia;
	private Connection connection;
	
	private Conexion()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8", "root", "root");
			//this.connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/banco?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8", "root", "root");
			try {
			    // Asegurar que la base de datos esté en UTF-8
			    this.connection.createStatement().execute("SET NAMES 'utf8mb4'");
			    this.connection.createStatement().execute("SET CHARACTER SET utf8mb4");
			    this.connection.createStatement().execute("SET collation_connection = 'utf8mb4_general_ci'");
			    
			    System.out.println("Configuración UTF-8 aplicada a la conexión MySQL");
			} catch (SQLException e) {
			    e.printStackTrace();
			}
			System.out.println("Conexión obtenida: " + this.connection); 

			this.connection.setAutoCommit(false);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public static Conexion getConexion() 
	{	
		try {
			if (instancia == null || instancia.connection == null || instancia.connection.isClosed()) {
				instancia = new Conexion();
			}	 
		} catch(SQLException e)
		{
			e.printStackTrace();
		}
		 return instancia;	
	}

	public Connection getSQLConexion() 
	{
		return this.connection;
	}
	
	public void cerrarConexion()
	{
	    try 
	    {
	        if (this.connection != null && !this.connection.isClosed()) {
	            this.connection.close();
	        }
	    }
	    catch (SQLException e) 
	    {
	        e.printStackTrace();
	    }
	    finally {
	        instancia = null;
	    }
	}
	
	public void cerrarResultSet(ResultSet rs) {
		try {
			if(rs != null && !rs.isClosed())
				rs.close();
		} catch (Exception e) {
			System.err.println("Error al cerrar el resultSet: " + e.getMessage());
		}
	}
	
	public void cerrarPrepared(PreparedStatement prepared) {
		try {
			if(prepared != null && !prepared.isClosed())
				prepared.close();
		} catch (Exception e) {
			System.err.println("Error al cerrar PreparedStatement: " + e.getMessage());
		}
	}
}
