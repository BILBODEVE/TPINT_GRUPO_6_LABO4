package servlets;

import entidades.Cliente;
import entidades.Usuario;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.UsuarioNegocio;
import negocioImplementacion.ClienteNegocioImplementacion;
import negocioImplementacion.UsuarioNegocioImpl;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UsuarioNegocio usuarioNeg = new UsuarioNegocioImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombreUsuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        Usuario usuario = usuarioNeg.validarUsuario(nombreUsuario, clave);

        if (usuario != null) {
        	if( usuario.isEstado()) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioId", usuario.getId());
            session.setAttribute("nombreUsuario", usuario.getNombreUsuario());
            session.setAttribute("rol", usuario.getIdRol() == 1 ? "administrador" : "cliente");
            
            session.setAttribute("usuario", usuario);
            int idUsuario = (int) session.getAttribute("usuarioId");
            ClienteNegocioImplementacion clni = new ClienteNegocioImplementacion();
            Cliente clienteActivo = clni.obtenerClientePorIdUsuario(idUsuario);
            session.setAttribute("clienteActivo", clienteActivo);
            
            response.sendRedirect(request.getContextPath() + "/vistas/Inicio.jsp");
        	
        } else {
        	request.setAttribute("error", "Usuario inhabilitado. Comuníquese con el administrador.");
            request.getRequestDispatcher("/vistas/Login.jsp").forward(request, response);
         }
        }else {
        	
        	request.setAttribute("error", "Usuario o contraseña incorrecta");
        	request.getRequestDispatcher("/vistas/Login.jsp").forward(request, response);
        }
    }
}