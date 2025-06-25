package negocio;

import entidades.Cliente;
import entidades.Prestamo;
import java.math.BigDecimal;

public interface PrestamoNegocio {

	boolean solicitarPrestamo(int idCliente, int idCuenta, BigDecimal monto, int idPlazo);
	public BigDecimal calcularCuota(BigDecimal monto, int idPlazo);
	
}