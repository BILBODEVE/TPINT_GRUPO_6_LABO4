package entidades;

public class Pais {
	  private int id;
	  private String nombre;
	  
	public Pais(int id, String nombre) {
		super();
		this.id = id;
		this.nombre = nombre;
	}
	
	public Pais() {}
	
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
	
	@Override
	public String toString() {
	    return this.nombre;
	}
}
