package entidades;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Prestamo {
	private int id;
	private Cuenta cuenta;
	private LocalDate fechaAlta;
	private BigDecimal importePedido;
	private Plazo plazo;
	boolean estado;
	
	public Prestamo() {
	}
	
	public Prestamo(int id, Cuenta cuenta, LocalDate fechaAlta, BigDecimal importePedido, Plazo plazo,
			boolean estado) {	
		this.id = id;
		this.cuenta= cuenta;
		this.fechaAlta = fechaAlta;
		this.importePedido = importePedido;
		this.plazo = plazo;
		this.estado = estado;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Cuenta getCuenta() {
		return cuenta;
	}
	
	public void setCuenta(Cuenta cuenta) {
		this.cuenta= cuenta;
	}
	
	public LocalDate getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(LocalDate fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public BigDecimal getImportePedido() {
		return importePedido;
	}

	public void setImportePedido(BigDecimal importePedido) {
		this.importePedido = importePedido;
	}

	public Plazo getPlazo() {
		return plazo;
	}

	public void setPlazo(Plazo plazo) {
		this.plazo = plazo;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	
}
