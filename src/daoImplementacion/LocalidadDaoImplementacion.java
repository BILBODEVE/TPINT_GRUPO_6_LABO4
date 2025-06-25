package daoImplementacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.LocalidadDao;
import entidades.Localidad;

public class LocalidadDaoImplementacion implements LocalidadDao {

	private String listarQuery = "SELECT id, nombre FROM Localidades WHERE id_provincia = 1";

	@Override
	public List<Localidad> listarLocalidadesBuenosAires() {
		List<Localidad> localidades = new ArrayList<>();

		try {
			Connection conexion = Conexion.getConexion().getSQLConexion();
			PreparedStatement stmt = conexion.prepareStatement(listarQuery);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Localidad l = new Localidad();
				l.setId(rs.getInt("id"));
				l.setNombre(rs.getString("nombre"));
				localidades.add(l);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return localidades;
	}
}
