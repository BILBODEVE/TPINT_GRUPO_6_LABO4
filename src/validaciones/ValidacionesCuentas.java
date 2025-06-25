package validaciones;

public class ValidacionesCuentas {

	public boolean campoVacio(String campo) {
		if(campo.isEmpty() || campo == null)
		return false;
		
		return true;
	}
}
