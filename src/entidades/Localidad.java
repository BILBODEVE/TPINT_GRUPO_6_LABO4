package entidades;

public class Localidad {
	private int id;
	private String nombre;
	Provincia provincia;

	public Localidad() {
	}

	public Localidad(int id, String nombre) {
		this.id = id;
		this.nombre = nombre;
	}
	
	public Localidad(int id, String nombre, Provincia provincia) {
		this.id = id;
		this.nombre = nombre;
		this.provincia = provincia;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	@Override
	public String toString() {
		return "Localidad [id=" + id + ", nombre=" + nombre + ", provincia=" + provincia + "]";
	}
	
}
