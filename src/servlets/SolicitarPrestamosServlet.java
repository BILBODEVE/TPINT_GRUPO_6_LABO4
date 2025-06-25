package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entidades.Cliente;
import entidades.Cuenta;
import entidades.Plazo;
import negocioImplementacion.ClienteNegocioImplementacion;
import negocioImplementacion.CuentaNegocioImplementacion;
import negocioImplementacion.PlazoNegocioImplementacion;
import negocioImplementacion.PrestamoNegocioImplementacion;
import negocioImplementacion.Seguridad;

@WebServlet("/SolicitarPrestamosServlet")
public class SolicitarPrestamosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;		
       
    public SolicitarPrestamosServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 		
		HttpSession session = request.getSession(false);
        Object user = (session != null) ? session.getAttribute("usuario") : null;
        
        if (!Seguridad.sesionActiva(user)) {
            response.sendRedirect(request.getContextPath() + "/vistas/Login.jsp");
            return;
        }
        
	    cargarFormulario(request, response);
	    
		RequestDispatcher dispatcher = request.getRequestDispatcher("/vistas/SolicitarPrestamos.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("btnSimular")!=null) {
			cargarFormulario(request, response);
			simularPrestamo(request, response);
			request.getRequestDispatcher("/vistas/SolicitarPrestamos.jsp").forward(request, response);
			return;
		}
		
		if(request.getParameter("resetear")!=null) {			
			request.removeAttribute("monto");
			request.removeAttribute("idCuentaSeleccionada");
			request.removeAttribute("idPlazoSeleccionado");
			request.removeAttribute("mensajeError");
			request.removeAttribute("detalle");
			request.removeAttribute("importeMensual");
			cargarFormulario(request, response);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/vistas/SolicitarPrestamos.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		if(request.getParameter("btnConfirmar") != null) {
		    try {
		        Cliente clienteActivo = (Cliente) request.getSession().getAttribute("clienteActivo");
		        int idCliente= clienteActivo.getId();
		        int idCuenta = Integer.parseInt(request.getParameter("cuenta"));
		        BigDecimal monto = new BigDecimal(request.getParameter("monto").replace(".", "").replace(",", "."));
		        int idPlazo = Integer.parseInt(request.getParameter("OpcionesPlazo"));
		        
		        PrestamoNegocioImplementacion pni = new PrestamoNegocioImplementacion();
		        boolean exito = pni.solicitarPrestamo(clienteActivo.getId(), idCuenta, monto, idPlazo);
		      
		        if (exito) {
		            request.setAttribute("mensajeInformativo", "Su solicitud de préstamo fue registrada correctamente.");
		        } else {
		            request.setAttribute("mensajeInformativo", "Ocurrió un error al procesar su solicitud.");
		        }

		    } catch (Exception e) {
		        request.setAttribute("mensajeInformativo", "Datos inválidos o sesión expirada.");
		        e.printStackTrace();
		    }
		    		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/vistas/MensajesInformativos.jsp");
			dispatcher.forward(request, response);
		    return;
		}
	}

public void cargarFormulario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 HttpSession session = request.getSession(false);
	 Cliente clienteActivo = null;

	 if (session != null && session.getAttribute("clienteActivo") != null) {
	     clienteActivo = (Cliente) session.getAttribute("clienteActivo");
	 }

    if (clienteActivo != null) {
        CuentaNegocioImplementacion cni = new CuentaNegocioImplementacion();
        ArrayList<Cuenta> listaCuentas = (ArrayList<Cuenta>) cni.listarCuentasPorClienteId(clienteActivo.getId());
        request.setAttribute("listaCuentasCliente", listaCuentas);
    }else {
        System.out.println("⚠️ clienteActivo es null, no se cargan las cuentas.");
    }

    PlazoNegocioImplementacion pni = new PlazoNegocioImplementacion();
    ArrayList<Plazo> listaPlazos = pni.listarOpcionesPlazo();
    request.setAttribute("listaPlazos", listaPlazos);
}
		
public void simularPrestamo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	boolean datosValidos = true;			
	BigDecimal monto= BigDecimal.ZERO;			
	int idPlazo = 0;
	String cuentaParam;
	String montoParam;
	String cuotasParam;
	String mensajeError = "";


    try {
    	if (request.getParameter("cuenta") != null && !request.getParameter("cuenta").isEmpty()) {
    	cuentaParam = request.getParameter("cuenta");		
		request.setAttribute("idCuentaSeleccionada", cuentaParam);
    	} else {
    		mensajeError+= "Debe seleccionar una cuenta<br>";
    		datosValidos=false;
    	}
    } catch (Exception e) {
    	e.printStackTrace();
    }
    
	    try {
	    	if (request.getParameter("monto") != null && !request.getParameter("monto").isEmpty()) {
	    	montoParam = request.getParameter("monto");		
	        montoParam = montoParam.replace(".", "").replace(",", ".");
			request.setAttribute("monto", montoParam);
	        monto = new BigDecimal(montoParam);
	        if (monto.compareTo(new BigDecimal("150000000")) > 0) {
	            mensajeError += "El monto no puede superar los $150.000.000.<br>";
	            datosValidos = false;
	        }	        
	    	} else {
	    		mensajeError+= "Debe ingresar un monto. <br>";
	    		datosValidos=false;
	    	}
	    } catch (NumberFormatException e) {
	    	mensajeError += "Debe ingresar un monto válido. <br> ";
	    	datosValidos=false;
	    }
		
	    try {
	        if (request.getParameter("OpcionesPlazo") != null && !request.getParameter("OpcionesPlazo").isEmpty()) {
	            cuotasParam = request.getParameter("OpcionesPlazo");	  
	            idPlazo = Integer.parseInt(cuotasParam);
	            request.setAttribute("idPlazoSeleccionado", idPlazo);
	            
	        } else {
	            mensajeError += "Debe seleccionar una cantidad de cuotas. <br>";
	            datosValidos = false;
	        }
	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	    }
	
	
	if (!datosValidos) {
	    request.setAttribute("mensajeError", mensajeError);
	    return;
	}
	
PrestamoNegocioImplementacion pni= new PrestamoNegocioImplementacion();
BigDecimal cuota = pni.calcularCuota(monto, idPlazo);

request.setAttribute("importeMensual", cuota);

request.setAttribute("detalle", true);

}
	
}


