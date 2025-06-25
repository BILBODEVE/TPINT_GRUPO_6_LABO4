package entidades;

public class CuentaTipo {
	
	private int id;
	private String descripcion;
	
	public CuentaTipo() {
		this.id = 0;
		this.descripcion = "";
	}
	
	public CuentaTipo(int id, String descripcion) {
		this.id = id;
		this.descripcion = descripcion;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "Id tipo Cta: " + id + ", descripcion: " + descripcion;
	}
}
