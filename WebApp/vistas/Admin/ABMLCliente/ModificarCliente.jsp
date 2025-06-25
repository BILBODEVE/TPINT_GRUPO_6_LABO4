<%@page import="entidades.Provincia"%>
<%@page import="entidades.Pais"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="entidades.Cliente"%>
<%@ page import="entidades.Localidad"%>
<%@ page import="java.util.List"%>

<%
Cliente cliente = (Cliente) request.getAttribute("cliente");
List<Localidad> localidades = (List<Localidad>) request.getAttribute("localidades");

String cuilFormateado = "";
if (cliente != null && cliente.getCUIL() != null) {
	String cuil = cliente.getCUIL().replaceAll("-", "");
	if (cuil.matches("\\d{11}")) {
		cuilFormateado = cuil.replaceAll("(\\d{2})(\\d{8})(\\d{1})", "$1-$2-$3");
	} else {
		cuilFormateado = cliente.getCUIL();
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modificar Cliente</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
</head>
<body>
	<jsp:include page="../../Header.jsp" />

	<main class="container py-4 mb-4">
		<div class="row text-center mb-4">
			<h2 class="fw-semibold">Modificar Cliente</h2>
		</div>

		<%
		String mensajeError = (String) request.getAttribute("error");
		if (mensajeError != null) {
		%>
		<div class="alert alert-warning alert-dismissible fade show"
			role="alert">
			<%=mensajeError%>
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>
		</div>
		<%
		}
		%>

		<!-- Formulario de búsqueda -->
		<div class="border rounded p-4 mb-4 bg-light shadow-sm">
			<h5 class="mb-3">Buscar Cliente</h5>
			<form method="POST"
				action="${pageContext.request.contextPath}/CargarClienteServlet"
				class="row g-3">
				<div class="col-md-4">
					<label for="buscarDNI" class="form-label">DNI</label> <input
						type="text" class="form-control" id="buscarDNI" name="dni"
						value="<%=cliente != null ? cliente.getDNI() : ""%>">
				</div>
				<div class="col-md-4">
					<label for="buscarCUIL" class="form-label">CUIL</label> <input
						type="text" class="form-control" id="buscarCUIL" name="cuil"
						value="<%=cuilFormateado%>">
				</div>
				<div class="col-md-4 d-flex align-items-end">
					<button type="submit" class="btn btn-secondary w-100">Buscar</button>
				</div>
			</form>
		</div>

		<%
		if (cliente != null) {
		%>
		<!-- Formulario de modificación -->
		<div class="border rounded p-4 bg-white shadow-sm">
			<h5 class="mb-3">Modificar Cliente</h5>
			<form method="POST"
				action="${pageContext.request.contextPath}/ModificarClienteServlet"
				class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">

				<input type="hidden" name="idCliente" value="<%=cliente.getId()%>">

				<div class="col">
					<label class="form-label">DNI</label> <input type="text" name="dni"
						class="form-control" required value="<%=cliente.getDNI()%>">
				</div>

				<div class="col">
					<label class="form-label">CUIL</label> <input type="text"
						name="cuil" class="form-control" required
						value="<%=cuilFormateado%>">
				</div>

				<div class="col">
					<label class="form-label">Nombre/s</label> <input type="text"
						name="nombre" class="form-control" required
						pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+" value="<%=cliente.getNombre()%>">
				</div>

				<div class="col">
					<label class="form-label">Apellido/s</label> <input type="text"
						name="apellido" class="form-control" required
						pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+"
						value="<%=cliente.getApellido()%>">
				</div>

				<div class="col">
					<label class="form-label">Sexo</label> <select name="sexo"
						class="form-select" required>
						<option value="" disabled>Seleccione un sexo</option>
						<option value="M"
							<%="M".equals(cliente.getSexo()) ? "selected" : ""%>>Masculino</option>
						<option value="F"
							<%="F".equals(cliente.getSexo()) ? "selected" : ""%>>Femenino</option>
					</select>
				</div>

				<div class="col">
					<label class="form-label">Fecha de Nacimiento</label> <input
						type="date" name="fechaNacimiento" class="form-control"
						value="<%=cliente.getFecha_nacimiento() != null ? cliente.getFecha_nacimiento().toString() : ""%>">
				</div>

				<div class="col">
					<label class="form-label">Dirección</label> <input type="text"
						name="direccion" class="form-control" required
						value="<%=cliente.getDomicilio() != null ? cliente.getDomicilio().getDireccion() : ""%>">
				</div>

				<div class="col">
					<label class="form-label">Localidad</label> <select
						name="localidad" class="form-select" required>
						<option value="" disabled>Seleccionar localidad</option>
						<%
						if (localidades != null) {
							for (Localidad loc : localidades) {
								boolean selected = cliente.getDomicilio() != null && cliente.getDomicilio().getLocalidad() != null
								&& loc.getId() == cliente.getDomicilio().getLocalidad().getId();
						%>
						<option value="<%=loc.getId()%>" <%=selected ? "selected" : ""%>><%=loc.getNombre()%></option>
						<%
						}
						}
						%>
					</select>
				</div>

				<div class="col">
					<label class="form-label">Teléfono</label> <input type="text"
						name="telefono" class="form-control" required
						value="<%=cliente.getTelefono()%>">
				</div>

				<div class="col">
					<label class="form-label">Correo electrónico</label> <input
						type="email" name="email" class="form-control" required
						value="<%=cliente.getEmail()%>">
				</div>

				<div class="col">
					<label class="form-label">Provincia</label> <select
						name="provincia" class="form-select" required>
						<option value="" disabled>Seleccionar provincia</option>
						<%
						List<Provincia> provincias = (List<Provincia>) request.getAttribute("provincias");
						if (provincias != null) {
							for (Provincia p : provincias) {
								boolean selected = cliente.getDomicilio() != null && cliente.getDomicilio().getProvincia() != null
								&& cliente.getDomicilio().getProvincia().getId() == p.getId();
						%>
						<option value="<%=p.getId()%>" <%=selected ? "selected" : ""%>>
							<%=p.getNombre()%>
						</option>
						<%
						}
						}
						%>
					</select>
				</div>


				<div class="col">
					<label class="form-label">Nacionalidad</label> <select
						name="nacionalidad" class="form-select" required>
						<option value="" disabled>Seleccionar nacionalidad</option>
						<%
						List<Pais> nacionalidades = (List<Pais>) request.getAttribute("nacionalidades");
						if (nacionalidades != null) {
							for (Pais pais : nacionalidades) {
								boolean selected = cliente.getNacionalidad() != null && cliente.getNacionalidad().getId() == pais.getId();
						%>
						<option value="<%=pais.getId()%>" <%=selected ? "selected" : ""%>><%=pais.getNombre()%></option>
						<%
						}
						}
						%>
					</select>
				</div>


				<div class="col-12 d-flex justify-content-center mt-4">
					<button type="submit" class="btn btn-warning px-5">
						<i class="bi bi-pencil-square me-2"></i>Modificar
					</button>
				</div>
			</form>
		</div>
		<%
		}
		%>
	</main>

	<jsp:include page="../../Footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
