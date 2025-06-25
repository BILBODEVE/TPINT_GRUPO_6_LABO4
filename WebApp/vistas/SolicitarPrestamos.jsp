<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.*, java.time.format.*, java.util.*, java.math.BigDecimal"%>
<%@ page import="entidades.Plazo"%>
<%@ page import="entidades.Cuenta"%>
<%@ page import="entidades.Cliente"%>
<%@ page import="negocioImplementacion.Seguridad"%>
<%

Object user = session.getAttribute("usuario");

if (!Seguridad.sesionActiva(user)) {
	response.sendRedirect(request.getContextPath() + "/vistas/Login.jsp");
    return;
} 

Cliente clienteActivo = null;
if (session != null && session.getAttribute("clienteActivo") != null) {
    clienteActivo = (Cliente) session.getAttribute("clienteActivo");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloPrestamos.css">
<title>Préstamos</title>
</head>
<body>
	<jsp:include page="Header.jsp" />

	<div class="container mt-5 mb-5">
		<h2 class="mb-4">Simulá tu Prestamo Personal</h2>

		<div class="card">
			<div class="card-body">
				<div class="row justify-content-center">
					<div class="col-4 text-center">
						<label class="textoGris">Podes pedir hasta</label>
					</div>
					<div class="col-4 text-center">
						<label class="textoGris">Plazo máximo</label>
					</div>
					<div class="col-4 text-center">
						<label class="textoGris">Sistema de amortización</label>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-4 text-center">				
						<p>
							<strong>$150.000.000</strong>
						</p>
					</div>
					<div class="col-4 text-center">						
						<p>
							<strong>60 cuotas</strong>
						</p>
					</div>
					<div class="col-4 text-center">
						<p>
							<strong>Francés (cuotas fijas)</strong>
						</p>
					</div>
				</div>
			</div>
		</div>
		</div>
	<%
	ArrayList<Cuenta> listaCuentasCliente = (ArrayList<Cuenta>) request.getAttribute("listaCuentasCliente");
	if (listaCuentasCliente == null) {
	    listaCuentasCliente = new ArrayList<>();
	}
	
	ArrayList<Plazo> listaPlazos = (ArrayList<Plazo>) request.getAttribute("listaPlazos");
	if (listaPlazos == null) {
	    listaPlazos = new ArrayList<>();
	}
	
	int idCuentaSeleccionada = -1;
	if (request.getAttribute("idCuentaSeleccionada") != null) {
		idCuentaSeleccionada = Integer.parseInt(String.valueOf(request.getAttribute("idCuentaSeleccionada")));
	}

	int idSeleccionado = -1;
	BigDecimal tna = BigDecimal.ZERO;
	if (request.getAttribute("idPlazoSeleccionado") != null) {
		idSeleccionado = Integer.parseInt(String.valueOf(request.getAttribute("idPlazoSeleccionado")));
	}
	%>

	<div class="container">
		<form method="post"	action="${pageContext.request.contextPath}/SolicitarPrestamosServlet">
			<div class="row">
				<div class="col-6">
					<div class="bordes">															

							<div class="mb-3">
								<label for="" class="form-label">Cuenta a acreditar: </label> <select
									name="cuenta" class="form-select">
									<option value="">-- Seleccione una cuenta --</option>
									<%
									if (listaCuentasCliente != null) {
									for (Cuenta c : listaCuentasCliente) {
										String selected = "";
										if (c.getId() == idCuentaSeleccionada) {
											selected = "selected";
										}
									%>
									<option value="<%=c.getId()%>" <%=selected%>>
										<%=c.getNumeroCuenta()%>
									</option>
									<%
									}}
									%>
								</select>

								<div id="avisoCuenta" class="form-text">En esta cuenta se
									acreditará el préstamo.</div>

							</div>
							<div class="mb-3">
								<label for="Monto" class="form-label">Monto</label>
								<div class="input-group mb-3">
									<span class="input-group-text">$</span> <input type="text"
										class="form-control" name="monto" id="Monto"
										aria-label="Monto en pesos"
										value="<%=request.getAttribute("monto") != null ? request.getAttribute("monto") : ""%>">
									<span class="input-group-text">.00</span>
								</div>
								<div id="avisoMonto" class="form-text">
									Valor en pesos</div>
							</div>

							<div class="mb-3">
								<label for="" class="form-label">Plazo</label>
								
								<select name="OpcionesPlazo" class="form-select">
									<option value="">-- Seleccionar plazo --</option>
									<%									
									for (Plazo p : listaPlazos) {
										String selected = "";
										if (p.getId() == idSeleccionado) {
											selected = "selected";
											tna = p.getTasaAnual();										
										}										
									%>
									<option value="<%=p.getId()%>" <%=selected%>>
										<%=p.getCantidadCuotas()%> cuotas
									</option>
									<%
									}
									request.setAttribute("tna", tna);
									%>
								</select>
								<div 
								id="avisoPlazo" class="form-text">El plazo determina la Tasa Nominal Anual
								</div>
							</div>
							<%
							if (request.getAttribute("mensajeError") != null) {
							%>
							<div class="alert alert-danger" role="alert">
								<%=request.getAttribute("mensajeError")%>
							</div>
							<%
							}
							%>
							<input type="submit" class="btn btn-primary" name="btnSimular"
								value="Simular" />
							<input type="submit" class="btn btn-secondary" name="resetear"
   							 value="Nuevo"/>
					</div>
				</div>
				<div class="col-6">
				
	<div class="bordes">
		<h3>Detalle</h3>
		<%
		Boolean detalle = (Boolean) request.getAttribute("detalle");
		if (Boolean.TRUE.equals(detalle)) {						
		    BigDecimal importeMensual = (BigDecimal) request.getAttribute("importeMensual");
		    BigDecimal tasaAnual = (BigDecimal) request.getAttribute("tna");
		%>
		    <p>Importe mensual: $<%= importeMensual %></p>
		    <p>Tasa Anual: <%= tasaAnual %>%</p>
		    <p>Primera cuota: A partir de 30 días después de la fecha de alta.</p>

		    <button type="button" class="btn btn-primary"
			    data-bs-toggle="modal" data-bs-target="#staticBackdrop">
			    Confirmar</button>

		    <div class="modal fade" id="staticBackdrop"
			    data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			    aria-labelledby="staticBackdropLabel" aria-hidden="true">
			    <div class="modal-dialog">
				    <div class="modal-content">
					    <div class="modal-header">
						    <h1 class="modal-title fs-5" id="staticBackdropLabel">Confirmar</h1>
						    <button type="button" class="btn-close"
							    data-bs-dismiss="modal" aria-label="Close"></button>
					    </div>
					    <div class="modal-body">¿Está seguro que desea confirmar
						    este préstamo?</div>
					    <div class="modal-footer">
						    <button type="button" class="btn btn-secondary"
							    data-bs-dismiss="modal">Cancelar</button>
						    <input type="submit" class="btn btn-primary"
							    name="btnConfirmar" value="Confirmar" />
					    </div>
				    </div>
			    </div>
		    </div>
		<%
		} else {
		%>
		    <p>Ingrese los datos para ver los detalles</p>
		<%
		}
		%>
		<div>
			<a href="${pageContext.request.contextPath}/vistas/Inicio.jsp"
				class="btn btn-link">Cancelar</a>
		</div>
	</div>
</div>

			</div>
			</form>
		</div>

	<jsp:include page="Footer.jsp" />

	<script>
		document.getElementById("Monto").addEventListener("input", function(e) {
			let valor = e.target.value;

			valor = valor.replace(/[^0-9,]/g, '');

			let partes = valor.split(',');

			let entero = partes[0].replace(/\B(?=(\d{3})+(?!\d))/g, '.');

			let decimal = partes[1] ? ',' + partes[1].substring(0, 2) : '';

			e.target.value = entero + decimal;
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/js/modales.js"></script>
</body>
</html>