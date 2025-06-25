package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daoImplementacion.ClienteDaoImplementacion;
import daoImplementacion.CuentaTipoDaoImplementacion;
import entidades.Cliente;
import entidades.Cuenta;
import entidades.CuentaTipo;
import entidades.Usuario;
import negocioImplementacion.ClienteNegocioImplementacion;
import negocioImplementacion.CuentaNegocioImplementacion;
import negocioImplementacion.CuentaTipoNegocioImplementacion;
import validaciones.ValidacionesCuentas;

/**
 * Servlet implementation class AltaCuentaServlet
 */
@WebServlet("/AltaCuentaServlet")
public class AltaCuentaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ValidacionesCuentas validarCampo = new ValidacionesCuentas();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AltaCuentaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	try {
    		ClienteDaoImplementacion clienteDao = new ClienteDaoImplementacion();
    		
    		Cliente cliente = null;
    		String btnBuscar = request.getParameter("btnBuscar");
    		String dniFiltro = request.getParameter("DniCliente");
    		String btnCrear = request.getParameter("btnCrear");

    		// Si se clickeo para buscar por DNI:
    		if (btnBuscar != null && dniFiltro != null && !dniFiltro.trim().isEmpty()) {
    			try {
    				int dni = Integer.parseInt(dniFiltro); // valido que hayan completado con un int
    				cliente = clienteDao.clientePorDNI(dni);
    				request.setAttribute("cliente", cliente);
    				request.getSession().setAttribute("idCliente", cliente.getId()); //lo guardo en session para no perderlo
    			} catch (NumberFormatException e) {
    				request.setAttribute("errorDni", "El DNI ingresado no es válido.");
    			}
    		}

    		// si clickeo la opcion "Crear cuenta":
    		if (btnCrear != null) {
    			try {
    				if (!validarCampo.campoVacio(request.getParameter("usuario"))) { // chequeo que haya un usuario antes de intentar crear una cuenta
    					request.setAttribute("error", "Primero debe seleccionar un Cliente activo");
    				} else { // en este caso hay un usuario seleccionado, procede a validar que haya un tipo de cta seleccionado
    					request.getSession().setAttribute("nombreUsuario", request.getParameter("usuario")); //lo guardo en session para no perderlo
    					request.getSession().setAttribute("dniCliente", request.getParameter("DniCliente")); //lo guardo en session para no perderlo
    					
    					if(request.getParameter("tipoCuenta") != null) { //hay un tipo de cta seleccionado, procede a crear la cta
    						crearCuenta(request, response);
    					}else { //Si no hay un tipo de cta seleccionado, no avanza
    					request.setAttribute("errorTipoCuenta", "Debe seleccionar un tipo de Cuenta");
    					}
    				}
    			} catch (Exception e) {
    				e.printStackTrace();
    				response.getWriter().println("Error al querer crear cuenta: " + e.getMessage());
    			}
    		}
    		
    		request.getRequestDispatcher("/vistas/Admin/Cuentas/AltaCuentas.jsp").forward(request, response);
    	} catch (Exception e) {
    		e.printStackTrace();
    		response.getWriter().println("Error al obtener el cliente: " + e.getMessage());
    	}
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	doGet(request, response);
    }

    private void crearCuenta(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	final double montoInicial = 10000;

    	try {
    		HttpSession session = request.getSession();
    		int idCliente = (int) session.getAttribute("idCliente");
    		int tipoCuentaId = Integer.parseInt(request.getParameter("tipoCuenta"));	
    		
    		ClienteNegocioImplementacion c = new ClienteNegocioImplementacion();

    		// Validar la cantidad de cuentas activas del cliente
    		if (!c.admiteNuevaCuenta(idCliente)) {
    			request.setAttribute("mostrarModalLimiteAlcanzado", true);
    			request.getRequestDispatcher("/vistas/Admin/Cuentas/AltaCuentas.jsp").forward(request, response);
    			return; // No avanza con la creacion
    		}

    		Cliente cliente = new Cliente();
    		Usuario usuario = new Usuario();
    		String dniCliente = session.getAttribute("dniCliente").toString();
    		String nombreUsuario = session.getAttribute("nombreUsuario").toString();
    		cliente.setId(idCliente);
    		cliente.setDNI(dniCliente);
    		
    		
    		usuario.setNombreUsuario(nombreUsuario);
    		cliente.setUsuario(usuario);

    		CuentaTipo tipo = new CuentaTipo();
    		CuentaTipoNegocioImplementacion tipoDao = new CuentaTipoNegocioImplementacion();
    		CuentaTipo tipoCuenta = tipoDao.buscarPorId(tipoCuentaId);
    		String descripcion = tipoCuenta.getDescripcion();
    		tipo.setId(tipoCuentaId);
    		tipo.setDescripcion(descripcion);

    		Cuenta cuenta = new Cuenta();
    		cuenta.setCliente(cliente);
    		cuenta.setSaldo(montoInicial);
    		cuenta.setTipoCuenta(tipo);

    		CuentaNegocioImplementacion cta = new CuentaNegocioImplementacion();
    		boolean cuentaCreada = cta.insertarCuenta(cuenta); // Insertar la cuenta nueva

    		if (cuentaCreada) {
    			request.setAttribute("mostrarModalCuentaCreada", true);
    		    request.setAttribute("cuentaNueva", cuenta);
    		    return;
    		} else {
    			request.setAttribute("error", "Error al crear la cuenta.");
    		}

    	} catch (NumberFormatException e) {
    		e.printStackTrace();
    		request.setAttribute("error", "Error en el tipo de datos ingresados para el DNI");
    	} catch (Exception e) {
    		e.printStackTrace();
    		request.setAttribute("error", "Error no esperado");
    	}
    }
}
