package negocioImplementacion;

import java.util.ArrayList;
import java.util.List;

import daoImplementacion.ClienteDaoImplementacion;
import daoImplementacion.CuentaDaoImplementacion;
import entidades.Cliente;
import negocio.ClienteNegocio;

public class ClienteNegocioImplementacion implements ClienteNegocio {
	
	private ClienteDaoImplementacion clienteNegocio;
	
	public ClienteNegocioImplementacion() {
		clienteNegocio = new ClienteDaoImplementacion();
	}
	
	public Boolean insertar(Cliente cliente) {
		
			ClienteDaoImplementacion clienteNegocio = new ClienteDaoImplementacion();
			return clienteNegocio.insertar(cliente);
	}

	public Boolean modificar(Cliente cliente) {
		return true;
	}

	public Boolean bajaLogica(String dni, String cuil) {
		return clienteNegocio.bajaLogica(dni, cuil);
	}

	public List<Cliente> listar() {
		List<Cliente> lista = new ArrayList<Cliente>();
		return lista;
	}

	public Boolean existeDNI(String DNI) {
		return clienteNegocio.existeDNI(DNI);
	}
	
	public Boolean existeCUIL(String CUIL) {
		return clienteNegocio.existeCUIL(CUIL);
	}

	public Cliente getCliente(String dni, String cuil) {
		return clienteNegocio.getCliente(dni, cuil);
	}
	
	public Cliente clientePorDNI(int dni) {
		return clienteNegocio.clientePorDNI(dni);
	}
	
	
	public Cliente obtenerClientePorIdUsuario(int idUsuario) {
	    return clienteNegocio.obtenerClientePorIdUsuario(idUsuario);
	}
	
	public Boolean tienePrestamoActivo(int idCliente) {
		return clienteNegocio.tienePrestamoActivo(idCliente);
	}
	
	@Override
	public boolean admiteNuevaCuenta(int idCliente) {
	    CuentaDaoImplementacion cuentas = new CuentaDaoImplementacion();
	    int cuentasActivas = cuentas.cuentasActivas(idCliente);
	    return cuentasActivas < 3;
	}
}
