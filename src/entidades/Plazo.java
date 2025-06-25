package entidades;

import java.math.BigDecimal;

public class Plazo {
	private int id;
	private int cantidadCuotas;
	private BigDecimal tasaAnual;
	
	public Plazo() {
		
	}
	
	public Plazo(int id, int cantidadCuotas, BigDecimal tasaAnual) {
		this.id = id;
		this.cantidadCuotas = cantidadCuotas;
		this.tasaAnual = tasaAnual;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCantidadCuotas() {
		return cantidadCuotas;
	}

	public void setCantidadCuotas(int cantidadCuotas) {
		this.cantidadCuotas = cantidadCuotas;
	}

	public BigDecimal getTasaAnual() {
		return tasaAnual;
	}

	public void setTasaAnual(BigDecimal tasaAnual) {
		this.tasaAnual = tasaAnual;
	}

	@Override
	public String toString() {
		return "Plazo: \n"
				+ "Id=" + id + "\n"
				+ "Cantidad de Cuotas=" + cantidadCuotas + "\n"
				+ "Tasa Anual=" + tasaAnual  + "%" + "\n";
	}

	
	
}
