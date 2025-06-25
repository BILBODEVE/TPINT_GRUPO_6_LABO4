package negocioImplementacion;

import java.util.ArrayList;

import daoImplementacion.PlazoDaoImplementacion;
import entidades.Plazo;
import negocio.PlazoNegocio;

public class PlazoNegocioImplementacion implements PlazoNegocio{

	@Override
	public ArrayList<Plazo> listarOpcionesPlazo() {
		PlazoDaoImplementacion pdi= new PlazoDaoImplementacion();
		return pdi.listar();
	}

}
