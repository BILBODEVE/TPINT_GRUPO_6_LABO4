package negocioImplementacion;

import javax.servlet.http.HttpSession;

import entidades.Usuario;

public class Seguridad {
	 
		public static boolean sesionActiva(Object user) {
	        Usuario usuario = (user != null && user instanceof Usuario) ? (Usuario) user : null;
	        return usuario != null && usuario.getId() != 0;
	    }

	    public static boolean esAdministrador(Object user) {	      
	        if (user instanceof Usuario usuario) {
	            return usuario.getIdRol() == 1;
	        }
	        return false;	   
	    }
}
