package entidades;

public class Direccion {
	private int id;
	private String direccion;
	private Localidad localidad;
	private Provincia provincia;
	
	public Direccion(int id, String direccion, Localidad localidad, Provincia provincia) {
		super();
		this.id = id;
		this.direccion = direccion;
		this.localidad = localidad;
		this.provincia = provincia;
	}
	
	public Direccion(int id, String direccion) {
		super();
		this.id = id;
		this.direccion = direccion;
	}
	
	public Direccion() {}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Localidad getLocalidad() {
		return localidad;
	}

	public void setLocalidad(Localidad localidad) {
		this.localidad = localidad;
	}
	
	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	@Override
	public String toString() {
		return "Direccion [id=" + id + ", direccion=" + direccion + ", localidad=" + localidad + ", provincia="
				+ provincia + "]";
	}
	
	
}
