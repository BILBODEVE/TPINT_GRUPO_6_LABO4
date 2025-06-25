package servlets;

import daoImplementacion.ProvinciaDaoImplementacion;
import entidades.Provincia;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import daoImplementacion.ClienteDaoImplementacion;
import daoImplementacion.LocalidadDaoImplementacion;
import daoImplementacion.PaisDaoImplementacion;
import entidades.Cliente;
import entidades.Localidad;

@WebServlet("/CargarClienteServlet")
public class CargarClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CargarClienteServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String dni = request.getParameter("dni");
		String cuil = request.getParameter("cuil");

		ClienteDaoImplementacion clienteDao = new ClienteDaoImplementacion();
		List<Cliente> lista = clienteDao.buscar(dni, cuil);

		if (lista != null && !lista.isEmpty()) {
			Cliente cliente = lista.get(0);
			
			System.out.println(cliente.toString());
			request.setAttribute("cliente", cliente);
		} else {
			request.setAttribute("error", "No se encontró ningún cliente con los datos ingresados.");
		}

		LocalidadDaoImplementacion localidadDao = new LocalidadDaoImplementacion();

		if ((dni == null || dni.trim().isEmpty()) && (cuil == null || cuil.trim().isEmpty())) {
			request.setAttribute("error", "Debe ingresar al menos un DNI o CUIL para buscar.");
			List<Localidad> localidadesBsAs = localidadDao.listarLocalidadesBuenosAires();
			request.setAttribute("localidades", localidadesBsAs);
			request.setAttribute("nacionalidades", new PaisDaoImplementacion().listar());
			request.getRequestDispatcher("/vistas/Admin/ABMLCliente/ModificarCliente.jsp").forward(request, response);
			return;
		}


		List<Localidad> localidadesBsAs = localidadDao.listarLocalidadesBuenosAires();
		request.setAttribute("provincias", new ProvinciaDaoImplementacion().listar());
		request.setAttribute("localidades", localidadesBsAs);
		request.setAttribute("nacionalidades", new PaisDaoImplementacion().listar());

		request.getRequestDispatcher("/vistas/Admin/ABMLCliente/ModificarCliente.jsp").forward(request, response);
	}
}
