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

@WebServlet("/AltaClienteServlet")
public class AltaClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClienteNegocioImplementacion clienteNegocio;
	HttpSession session;

	private String rutaAltaClienteJSP = "/vistas/Admin/ABMLCliente/AltaCliente.jsp";

	public AltaClienteServlet() {
		super();
		clienteNegocio = new ClienteNegocioImplementacion();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		session = request.getSession();
		
		Cliente cliente = new Cliente();
		cliente = capturarCampos(request);
		
		if(cliente != null) 
			session.setAttribute("cliente", cliente);
		
		request.setAttribute("cliente", cliente);

		existeCliente(request, response, cliente);
		
		if (cliente.getId() != 1) {
			redirigir(request, response, "error", "Error al capturar los campos", rutaAltaClienteJSP);
		}
		
		response.sendRedirect(request.getContextPath() + "/vistas/Admin/ABMLUsuario/AltaUsuario.jsp");
	};

	private Cliente capturarCampos(HttpServletRequest request) {

		Cliente cliente = new Cliente();

		if (request.getParameter("btnAltaCliente") != null) {

			try {
				cliente.setId(1);
				cliente.setDNI(request.getParameter("DNICliente"));
				cliente.setCUIL(request.getParameter("CUILCliente"));
				cliente.setNombre(request.getParameter("nombreCliente"));
				cliente.setApellido(request.getParameter("apellidoCliente"));
				cliente.setSexo("M");
				// cliente.getNacionalidad.setPais("Argentino");
				// cliente.setFecha_nacimiento();
				// cliente.getDireccion.setDireccion(request.getParameter("lblDireccion"));
				// cliente.getDireccion.setLocalidad(request.getParameter("lblLocalidad"));
				// cliente.getDireccion.setProvincia(request.getParameter("lblProvincia"));
				cliente.setEmail(request.getParameter("emailCliente"));
				cliente.setTelefono(request.getParameter("telefonoCliente"));
				cliente.setEstado(true);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return cliente;
	}

	private void redirigir(HttpServletRequest request, HttpServletResponse response, String nombreAtributo,
			String msjError, String ruta) throws ServletException, IOException {
		request.setAttribute(nombreAtributo, msjError);
		request.getRequestDispatcher(ruta).forward(request, response);
	}
	
	private void existeCliente(HttpServletRequest request, HttpServletResponse response, Cliente cliente) throws ServletException, IOException {
		
		Boolean dni = clienteNegocio.existeDNI(cliente.getDNI());
		Boolean cuil = clienteNegocio.existeCUIL(cliente.getCUIL());
		
		if (dni && cuil) {
			redirigir(request, response, "error", "El DNI " + cliente.getDNI() + " y el CUIL " + cliente.getCUIL() + " ya existen", rutaAltaClienteJSP);
		}

		if (dni) {
			redirigir(request, response, "error", "El DNI " + cliente.getDNI() + " ya existe", rutaAltaClienteJSP);
		}
		
		if (cuil) {
			redirigir(request, response, "error", "El CUIL " + cliente.getCUIL() + " ya existe", rutaAltaClienteJSP);
		}
	}
}
