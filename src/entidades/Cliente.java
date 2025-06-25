package entidades;

import java.sql.Date;

public class Cliente {
	
	int id;
	String DNI;
	String CUIL;
	String nombre;
	String apellido;
	String sexo;
	Pais nacionalidad;
	Date fecha_nacimiento;
	Direccion domicilio;
	String email;
	String telefono;
	Usuario usuario;
	Boolean estado;
	
	public Cliente() {
		nacionalidad = new Pais();
		domicilio = new Direccion();
		usuario = new Usuario();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDNI() {
		return DNI;
	}
	public void setDNI(String dNI) {
		DNI = dNI;
	}
	public String getCUIL() {
		return CUIL;
	}
	public void setCUIL(String cUIL) {
		CUIL = cUIL;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getSexo() {
		return sexo;
	}
	public void setSexo(String sexo) {
		this.sexo = sexo;
	}
	public Pais getNacionalidad() {
		return nacionalidad;
	}
	public void setNacionalidad(Pais nacionalidad) {
		this.nacionalidad = nacionalidad;
	}
	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}
	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}
	public Direccion getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(Direccion domicilio) {
		this.domicilio = domicilio;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Boolean getEstado() {
		return estado;
	}
	public void setEstado(Boolean estado) {
		this.estado = estado;
	}

	
	@Override
	public String toString() {
		return "Cliente [id=" + id + ", DNI=" + DNI + ", CUIL=" + CUIL + ", nombre=" + nombre + ", apellido=" + apellido
				+ ", sexo=" + sexo + ", nacionalidad=" + nacionalidad + ", fecha_nacimiento=" + fecha_nacimiento
				+ ", domicilio=" + domicilio + ", email=" + email + ", telefono=" + telefono + ", usuario=" + usuario
				+ ", estado=" + estado + "]";
	}
}
