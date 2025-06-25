package utilidades;

import java.io.UnsupportedEncodingException;

public abstract class ManejoCaractEspecial {
	
	public static String manejarCaracterEspecial(String texto)
	{
		try {
			texto = new String(texto.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return texto;
	}
}
