package negocio;

import java.util.ArrayList;

import entidades.CuentaTipo;

public interface CuentaTipoNegocio {
	public ArrayList<CuentaTipo> listarTiposCuenta();
	public CuentaTipo buscarPorId(int tipoCuentaId);
}
