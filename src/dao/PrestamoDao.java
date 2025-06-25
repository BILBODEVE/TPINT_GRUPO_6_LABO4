package dao;

import java.math.BigDecimal;
import java.sql.SQLException;

public interface PrestamoDao {
	public boolean ejecutarSPsolicitarPrestamo(int idCliente, int idCuenta, BigDecimal monto, int idPlazo);
	public BigDecimal obtenerCuotaDesdeBD(BigDecimal monto, int idPlazo);
}
