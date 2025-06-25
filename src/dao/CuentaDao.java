package dao;

import java.math.BigInteger;
import java.util.List;

import entidades.Cuenta;

public interface CuentaDao {
	public boolean insertarCuenta(Cuenta cuenta);
	public List<Cuenta> listar();
	public List<Cuenta> listarPorDNI(int dni);
	public Cuenta obtenerCuentaPorCBU(String cbu);
	public Cuenta obtenerCuentaPorId(int id);
	public List<Cuenta> listarCuentasPorClienteId(int clienteId);
	public int cuentasActivas(int idCliente);
	public boolean existeCbu(BigInteger cbu);
	public String obtenerUltimoNumeroCuenta();
}
