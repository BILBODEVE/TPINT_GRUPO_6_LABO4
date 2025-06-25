package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daoImplementacion.CuentaDaoImplementacion;
import entidades.Cuenta;
/**
 * Servlet implementation class ListarCuentasServlet
 */
@WebServlet("/ListarCuentasServlet")
public class ListarCuentasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarCuentasServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CuentaDaoImplementacion cuentaDao = new CuentaDaoImplementacion();

			List<Cuenta> listaCuentas = cuentaDao.listar();

			String btnBuscar = request.getParameter("btnBuscar");
			String dniFiltro = request.getParameter("txtDniClientes");
			//buscar
			if (btnBuscar != null && dniFiltro != null && !dniFiltro.trim().isEmpty()) {

				    try {
				        int dni = Integer.parseInt(dniFiltro); //valido que sea un int

				        listaCuentas = cuentaDao.listarPorDNI(dni);

				    } catch (NumberFormatException e) {
				        request.setAttribute("errorDni", "El DNI ingresado no es válido.");
				    }

			}

			request.setAttribute("listaCuentas", listaCuentas);

			request.getRequestDispatcher("/vistas/Admin/Cuentas/ListarCuentas.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("Error al obtener la lista de cuentas: " + e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
