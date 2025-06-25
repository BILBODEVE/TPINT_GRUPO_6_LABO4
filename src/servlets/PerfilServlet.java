package servlets;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entidades.Cliente;
import negocio.ClienteNegocio;
import negocioImplementacion.ClienteNegocioImplementacion;

@WebServlet("/PerfilServlet")
@MultipartConfig(maxFileSize = 16177215)
public class PerfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClienteNegocio clienteNeg = new ClienteNegocioImplementacion();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuarioId") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        int idUsuario = (int) session.getAttribute("usuarioId");
        
      
        String mensajeError = (String) session.getAttribute("mensajeError");
        String mensajeInformativo = (String) session.getAttribute("mensajeInformativo");

        if (mensajeError != null) {
            request.setAttribute("mensajeError", mensajeError);
            session.removeAttribute("mensajeError");
        }

        if (mensajeInformativo != null) {
            request.setAttribute("mensajeInformativo", mensajeInformativo);
            session.removeAttribute("mensajeInformativo");
        }

        Cliente cliente = clienteNeg.obtenerClientePorIdUsuario(idUsuario);
        request.setAttribute("cliente", cliente);

        request.getRequestDispatcher("/vistas/Perfil.jsp").forward(request, response);
    	}
    
}