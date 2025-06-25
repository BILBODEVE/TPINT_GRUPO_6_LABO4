package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entidades.Cliente;
import negocioImplementacion.ClienteNegocioImplementacion;

/**
 * Servlet implementation class BajaClienteServlet
 */
@WebServlet("/BajaClienteServlet")
public class BajaClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	HttpSession session;
	private ClienteNegocioImplementacion clienteNegocio;
	private Cliente cliente;
	private String rutaEliminarJSP = "/vistas/Admin/ABMLCliente/EliminarCliente.jsp";

	public BajaClienteServlet() {
		super();
		clienteNegocio = new ClienteNegocioImplementacion();
		cliente = null;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (request.getParameter("vieneDeListar") == null || request.getParameter("dni") == null
				|| request.getParameter("cuil") == null)
			redirigir(request, response, "error", "Hubo un error al buscar el cliente. Intentelo manualmente",
					rutaEliminarJSP);

		String dni = (String) request.getParameter("dni");
		String cuil = (String) request.getParameter("cuil");
		cliente = clienteNegocio.getCliente(dni, cuil);

		if (cliente == null)
			redirigir(request, response, "error", "Hubo un error al buscar el cliente. Intentelo manualmente",
					rutaEliminarJSP);

		session.setAttribute("objCliente", cliente);
		response.sendRedirect(request.getContextPath() + rutaEliminarJSP);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String dni = null;
		String cuil = null;

		if (request.getParameter("btnBuscar") != null) {

			if (request.getParameter("DNICliente") == null || request.getParameter("DNICliente") == null)
				redirigir(request, response, "error", "Ingrese un número de DNI y CUIL valido", rutaEliminarJSP);

			dni = request.getParameter("DNICliente");
			cuil = request.getParameter("CUILCliente");

			cliente = clienteNegocio.getCliente(dni, cuil);
			System.out.println(cliente);
			if (cliente == null)
				redirigir(request, response, "error", "No se encontro un registro asociado", rutaEliminarJSP);

			session.setAttribute("objCliente", cliente);
			response.sendRedirect(request.getContextPath() + rutaEliminarJSP);
			return;
		}

		if (request.getParameter("btnEliminar") != null) {
			
			if (session.getAttribute("objCliente") != null) {
				cliente = (Cliente) session.getAttribute("objCliente");
			}
			else {
				redirigir(request, response, "error", "Complete los campos DNI y CUIL", rutaEliminarJSP);
				return;
			}
			
			if (!cliente.getEstado()) {
				session.removeAttribute("objCliente");
				redirigir(request, response, "error", "El cliente ya se encuentra inactivo", rutaEliminarJSP);
				return;
			}
			

			if (clienteNegocio.tienePrestamoActivo(cliente.getId())) {
				redirigir(request, response, "error", "No es posible eliminar el cliente. Posee prestamos activos",
						rutaEliminarJSP);
				return;
			}
			

			if (!clienteNegocio.bajaLogica(cliente.getDNI(), cliente.getCUIL())) {
				redirigir(request, response, "error",
						"No fue posible eliminar el Cliente " + cliente.getNombre() + ", " + cliente.getApellido(),
						rutaEliminarJSP);
				return;
			}

			session.removeAttribute("objCliente");
			redirigir(request, response, "procesoExitoso", "El cliente se elimino correctamente", rutaEliminarJSP);
			return;
		}
	}


	private void redirigir(HttpServletRequest request, HttpServletResponse response, String nombreAtributo,
			String msjError, String ruta) throws ServletException, IOException {
		request.setAttribute(nombreAtributo, msjError);
		request.getRequestDispatcher(ruta).forward(request, response);
	}

	private void redirigir(HttpServletRequest request, HttpServletResponse response, String nombreAtributo,
			Cliente cliente, String ruta) throws ServletException, IOException {
		request.setAttribute(nombreAtributo, cliente);
		request.getRequestDispatcher(ruta).forward(request, response);
	}

}
