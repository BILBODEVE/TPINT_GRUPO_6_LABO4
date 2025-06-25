package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import daoImplementacion.ClienteDaoImplementacion;
import entidades.Cliente;

@WebServlet("/ListarClientesServlet")
public class ListarClientesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListarClientesServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ClienteDaoImplementacion clienteDao = new ClienteDaoImplementacion();
		List<Cliente> listaClientes = clienteDao.listar();
		request.setAttribute("clientes", listaClientes);
		request.getRequestDispatcher("/vistas/Admin/ABMLCliente/ListarCliente.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String dni = request.getParameter("txtDniClientes");
		String cuil = request.getParameter("txtCuilClientes");

		System.out.println("Dni: " + dni + " CUIL: " + cuil);

		ClienteDaoImplementacion clienteDao = new ClienteDaoImplementacion();
		List<Cliente> listaClientes = clienteDao.buscar(dni, cuil);

		request.setAttribute("clientes", listaClientes);
		request.getRequestDispatcher("/vistas/Admin/ABMLCliente/ListarCliente.jsp").forward(request, response);
	}

}