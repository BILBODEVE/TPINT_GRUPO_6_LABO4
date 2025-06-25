package dao;

import java.util.ArrayList;

import entidades.CuentaTipo;

public interface CuentaTipoDao {
	public ArrayList<CuentaTipo> listar();
	public CuentaTipo buscarPorId(int tipoCuentaId);
}
