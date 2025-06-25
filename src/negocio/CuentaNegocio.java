package negocio;

import java.util.List;

import entidades.Cuenta;

public interface CuentaNegocio {
	public boolean insertarCuenta(Cuenta cuenta);
	public List<Cuenta> listarCuentas();
	public boolean existeCuenta(Cuenta cuenta);
	List<Cuenta> listarCuentasPorDNI(int dni);
	public Cuenta obtenerCuentaPorCBU(String cbu);
	public Cuenta obtenerCuentaPorId(int id);
	List<Cuenta> listarCuentasPorClienteId(int clienteId);
}


