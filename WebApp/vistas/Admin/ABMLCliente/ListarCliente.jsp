<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="entidades.Cliente"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Listar Clientes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloListarCuentas.css">
</head>

<body>
	<jsp:include page="/vistas/Header.jsp" />

	<main class="container mt-5 mb-5">
		<h1 class="text-center mb-4">Listado de Clientes</h1>

		<!-- Botón Nuevo Cliente -->
		<div class="mb-4 d-flex justify-content-end">
			<button type="button" class="btn btn-primary btn-nueva-cuenta"
				onclick="location.href='${pageContext.request.contextPath}/vistas/Admin/ABMLCliente/AltaCliente.jsp'">
				<i class="bi bi-plus-circle me-2"></i> Nuevo Cliente
			</button>
		</div>

		<!-- Formulario de búsqueda -->
		<div class="row justify-content-center">
			<div class="col-md-6">
				<form method="POST"
					action="${pageContext.request.contextPath}/ListarClientesServlet">
					<div class="mb-3">
						<label for="dniCliente" class="form-label">DNI del Cliente</label>
						<input type="text" class="form-control shadow-sm" id="dniCliente"
							name="txtDniClientes" placeholder="Ingrese DNI (o deje vacío)">
					</div>

					<div class="mb-3">
						<label for="cuilCliente" class="form-label">CUIL del
							Cliente</label> <input type="text" class="form-control shadow-sm"
							id="cuilCliente" name="txtCuilClientes"
							placeholder="Ingrese CUIL (o deje vacío)">
					</div>

					<small class="text-muted">Ingrese <strong>solo uno</strong>
						de los campos para buscar.
					</small>

					<div class="d-grid gap-2 d-md-flex justify-content-md-between mt-3">
						<button type="submit" name="btnBuscar" class="btn btn-success">
							<i class="bi bi-search me-1"></i> Buscar
						</button>
						<button type="button" class="btn btn-secondary"
							onclick="location.href='${pageContext.request.contextPath}/ListarClientesServlet?verTodo=true'">
							<i class="bi bi-eye me-1"></i> Ver Todo
						</button>
					</div>
				</form>
			</div>
		</div>

		<!-- Tabla de clientes -->
		<div class="table-responsive mt-5">
			<table
				class="table table-bordered table-hover align-middle text-center tabla-cuentas">
				<thead class="table-light">
					<tr>
						<th>DNI Cliente</th>
						<th>CUIL</th>
						<th>Nombre/s</th>
						<th>Apellido/s</th>
						<th>Estado</th>
						<th>Modificar</th>
						<th>Eliminar</th>
						<th>Crear Usuario</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
					if (clientes != null && !clientes.isEmpty()) {
						for (Cliente c : clientes) {
					%>
					<tr>
						<td><%=c.getDNI()%></td>
						<td><%=c.getCUIL()%></td>
						<td><%=c.getNombre()%></td>
						<td><%=c.getApellido()%></td>
						<td><%=(c.getEstado() != null && c.getEstado()) ? "Activo" : "Inactivo"%></td>
						<td>
							<button type="button" class="btn btn-warning btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/CargarClienteServlet?dni=<%=c.getDNI()%>'">
								<i class="bi bi-pencil-square"></i>
							</button>

						</td>
						<td>
							<button type="submit" class="btn btn-danger btn-sm"
								onclick="location.href='${pageContext.request.contextPath}/BajaClienteServlet?dni=<%=c.getDNI()%>&cuil=<%=c.getCUIL()%>&vieneDeListar=btnEliminar'">
								<i class="bi bi-trash"></i>
							</button>
						</td>
						<td>
							<button type="button" class="btn btn-success btn-sm"
								onclick="location.href='../ABMLUsuario/AltaUsuario.jsp'">
								<i class="bi bi-plus-circle"></i>
							</button>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="8">No se encontraron clientes para mostrar.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</main>

	<jsp:include page="/vistas/Footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
