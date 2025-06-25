package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import negocio.UsuarioNegocio;
import negocioImplementacion.UsuarioNegocioImpl;

@WebServlet("/CambiarPasswordServlet")
public class CambiarPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UsuarioNegocio usuarioNeg = new UsuarioNegocioImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        String usuario = request.getParameter("usuario");

        if ("validarUsuario".equals(accion)) {
            if (usuario == null || usuario.trim().isEmpty()) {
                request.setAttribute("mensajeError", "Debe ingresar el usuario para validar.");
                request.setAttribute("habilitarCampos", false);
            } else {
                boolean existe = usuarioNeg.existeUsuarioActivo(usuario);
                if (existe) {
                    request.setAttribute("mensaje", "Usuario válido, puede cambiar la contraseña.");
                    request.setAttribute("habilitarCampos", true);
                } else {
                    request.setAttribute("mensajeError", "Usuario no existe o no está activo.");
                    request.setAttribute("habilitarCampos", false);
                }
            }
            request.getRequestDispatcher("/vistas/RecuperarContrasenia.jsp").forward(request, response);
            return;
        }

        if ("cambiarPassword".equals(accion)) {
            String nuevaClave = request.getParameter("nuevaClave");
            String confirmarClave = request.getParameter("confirmarClave");

            if (usuario == null || usuario.trim().isEmpty()) {
                request.setAttribute("mensajeError", "Debe ingresar el usuario.");
                request.getRequestDispatcher("/vistas/RecuperarContrasenia.jsp").forward(request, response);
                return;
            }

            if (nuevaClave == null || confirmarClave == null || !nuevaClave.equals(confirmarClave)) {
                request.setAttribute("mensajeError", "Las contraseñas no coinciden.");
                request.setAttribute("habilitarCampos", true);
                request.getRequestDispatcher("/vistas/RecuperarContrasenia.jsp").forward(request, response);
                return;
            }

            boolean actualizada = usuarioNeg.actualizarPassword(usuario, nuevaClave);

            if (actualizada) {
           
                HttpSession nuevaSesion = request.getSession(true); 
                nuevaSesion.setAttribute("mensajeLogin", "Contraseña actualizada correctamente. Inicie sesión nuevamente.");
                response.sendRedirect(request.getContextPath() + "/vistas/Login.jsp");
                return;
            } else {
                request.setAttribute("mensajeError", "Error al actualizar la contraseña.");
                request.setAttribute("habilitarCampos", true);
                request.getRequestDispatcher("/vistas/RecuperarContrasenia.jsp").forward(request, response);
                return;
            }
        }
        
        
        if ("cambiarDesdePerfil".equals(accion)) {
            String actual = request.getParameter("actual");
            String nueva = request.getParameter("nueva");
            String confirmar = request.getParameter("confirmar");

            boolean datosValidos = true;
            String mensajeError = "";

            if (actual == null || actual.trim().isEmpty()) {
                mensajeError += "Debe ingresar su contraseña actual.<br>";
                datosValidos = false;
            }
            if (nueva == null || nueva.trim().isEmpty()) {
                mensajeError += "Debe ingresar la nueva contraseña.<br>";
                datosValidos = false;
            }
            if (confirmar == null || confirmar.trim().isEmpty()) {
                mensajeError += "Debe confirmar la nueva contraseña.<br>";
                datosValidos = false;
            }
            if (!nueva.equals(confirmar)) {
                mensajeError += "La nueva contraseña y su confirmación no coinciden.<br>";
                datosValidos = false;
            }

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("nombreUsuario") == null) {
            	request.setAttribute("mensajeError", "Debe iniciar sesión para cambiar su contraseña.");
            	request.getRequestDispatcher("/vistas/Login.jsp").forward(request, response);
            	return;
            }
            
            if (!datosValidos) {
            	session.setAttribute("mensajeError", mensajeError);
                response.sendRedirect(request.getContextPath() + "/PerfilServlet");
                return;
            }


            String nombreUsuarioSesion = (String) session.getAttribute("nombreUsuario");

            boolean passCorrecta = usuarioNeg.validarPassword(nombreUsuarioSesion, actual);

            if (!passCorrecta) {
            	session.setAttribute("mensajeError", "La contraseña actual es incorrecta.");
                response.sendRedirect(request.getContextPath() + "/PerfilServlet");
                return;
            }

            boolean cambiada = usuarioNeg.actualizarPassword(nombreUsuarioSesion, nueva);

            if (cambiada) {
                session.invalidate(); 
                HttpSession nuevaSesion = request.getSession(true); 
                nuevaSesion.setAttribute("mensajeLogin", "Contraseña cambiada correctamente. Inicie sesión nuevamente.");
                response.sendRedirect(request.getContextPath() + "/vistas/Login.jsp");
            } else {
            	session.setAttribute("mensajeError", "No se pudo cambiar la contraseña.");
                response.sendRedirect(request.getContextPath() + "/PerfilServlet");
            }
        }
    }
}
;

