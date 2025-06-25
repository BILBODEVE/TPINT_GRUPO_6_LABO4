package daoImplementacion;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dao.PlazoDao;
import entidades.Cliente;
import entidades.Plazo;
import entidades.Usuario;

public class PlazoDaoImplementacion implements PlazoDao {

	@Override
	public ArrayList<Plazo> listar() {
		ArrayList<Plazo> listaPlazos= new ArrayList<Plazo>();
		String query= "Select P.id, P.cantidad_cuotas, P.tasaAnual from opciones_plazo P";

		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			Statement stmt = conexion.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				Plazo p = new Plazo();
				p.setId(rs.getInt("id"));
				p.setCantidadCuotas(rs.getInt("cantidad_cuotas"));
				p.setTasaAnual(rs.getBigDecimal("tasaAnual"));
				listaPlazos.add(p);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listaPlazos;
	}

}
