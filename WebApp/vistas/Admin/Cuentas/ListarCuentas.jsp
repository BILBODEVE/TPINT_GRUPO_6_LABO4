<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="entidades.Cuenta"%>
<%@ page import="entidades.CuentaTipo"%>
<!DOCTYPE html>
<html lang="es">
<head>
<!--  <meta charset="UTF-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listar Cuentas</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- jQuery (requerido por DataTables) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Cuentas/estiloListarCuentas.css">

<script>
	$(document).ready(function() {$('#tabla_cuentas').DataTable({
	searching : false,
	language : { url : "https://cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json"}
		});
	});
</script>
</head>

<body>
	<jsp:include page="/vistas/Header.jsp" />

	<main class="container mt-5 mb-5">
		<%
		List<Cuenta> listaCuentas = (List<Cuenta>) request.getAttribute("listaCuentas");
		%>

		<h1 class="text-center mb-4">Listado de Cuentas</h1>

		<!-- Botón Nueva Cuenta -->
		<div class="mb-4 d-flex justify-content-end">
			<button type="button" class="btn btn-primary btn-nueva-cuenta"
				onclick="location.href='${pageContext.request.contextPath}/AltaCuentaServlet'">
				<i class="bi bi-plus-circle me-2"></i> Nueva Cuenta
			</button>
		</div>

		<!-- Formulario de búsqueda -->
		<div class="row justify-content-center">
			<div class="col-md-6">
				<form
					action="${pageContext.request.contextPath}/ListarCuentasServlet"
					method="post">

					<div class="mb-3">
						<label for="dniCliente" class="form-label">DNI del Cliente</label>
						<input type="text" class="form-control shadow-sm" id="dniCliente"
							name="txtDniClientes" placeholder="Ingrese DNI...">
						<%
						if (request.getAttribute("errorDni") != null) {
						%>
						<div class="alert alert-danger"><%=request.getAttribute("errorDni")%></div>
						<%
						}
						%>
					</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-between">
						<button type="submit" name="btnBuscar" class="btn btn-success">
							<i class="bi bi-search me-1"></i> Buscar
						</button>
						<button type="submit" name="btnVerTodo" class="btn btn-secondary">
							<i class="bi bi-eye me-1"></i> Ver Todo
						</button>
					</div>
				</form>
			</div>
		</div>

		<!-- Tabla de cuentas -->
		<div class="table-responsive mt-5">
			<table id="tabla_cuentas"
				class="table table-bordered table-hover align-middle text-center tabla-cuentas">
				<thead class="table-light">
					<tr>
						<th>Nro de Cuenta</th>
						<th>DNI Cliente</th>
						<th>Tipo de Cuenta</th>
						<th>CBU</th>
						<th>Saldo</th>
						<th>Estado</th>
						<th>Modificar</th>
						<th>Eliminar</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (listaCuentas != null && !listaCuentas.isEmpty()) {
						for (Cuenta c : listaCuentas) {
					%>
					<tr>
						<td><%=c.getNumeroCuenta()%></td>
						<td><%=c.getCliente().getDNI()%></td>
						<td><%=c.getTipoCuenta().getDescripcion()%></td>
						<td><%=c.getCBU()%></td>
						<td><%=c.getSaldo()%></td>
						<%
						if (c.isEstado()) {
						%>
						<td>Activo</td>
						<%
						} else {
						%>
						<td>Inactivo</td>
						<%
						}
						%>
						<td>
							<form method="post" action="ManejarCuentaServlet">
								<input type="hidden" name="idCuenta" value="<%=c.getId()%>">
								<button type="submit" name="btnModificar" value="modificar"
									class="btn btn-warning btn-sm">
									<i class="bi bi-pencil-square"></i>
								</button>
							</form>
						</td>
						<td>
							<form method="post" action="ManejarCuentaServlet">
								<input type="hidden" name="idCuenta" value="<%=c.getId()%>">
								<button type="submit" name="btnEliminar" value="eliminar"
									class="btn btn-danger btn-sm">
									<i class="bi bi-trash"></i>
								</button>
							</form>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="100%">No hay cuentas cargadas.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>


		<!-- Modal si se quiere eliminar-->
		<%
		Boolean mostrarModal = (Boolean) request.getAttribute("mostrarModalEliminar");
		Cuenta cuentaAEliminar = (Cuenta) request.getAttribute("cuentaAElim");
		if (mostrarModal != null && mostrarModal && cuentaAEliminar!=null) {
		%>
		<script>
			window.onload = function() {
				var modal = new bootstrap.Modal(document
						.getElementById('modalEliminar'));
				modal.show();
			};
		</script>
		<%
		}
		%>

<%
if (mostrarModal != null && mostrarModal && cuentaAEliminar!=null) {
		%>
<div class="modal fade" id="modalEliminar" tabindex="-1"
	aria-labelledby="modalEliminarLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content shadow-lg">

			<div class="modal-header bg-primary text-white">
				<h5 class="modal-title" id="modalEliminarLabel">
					<i class="bi bi-exclamation-triangle-fill me-2"></i> Confirmar Eliminación
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Cerrar"></button>
			</div>

			<div class="modal-body">
				<p class="mb-4 text-danger fs-5">
					<strong>¡Atención!</strong> Está por eliminar una cuenta del sistema.
				</p>
				<p class="mb-4">Corrobore los datos de la cuenta seleccionada antes de eliminar:</p>

				<ul class="list-group mb-4">
					<li class="list-group-item"><strong>DNI Cliente:</strong> <%=cuentaAEliminar.getCliente().getDNI()%></li>
					<li class="list-group-item"><strong>Tipo de Cuenta:</strong> <%=cuentaAEliminar.getTipoCuenta().getDescripcion()%></li>
					<li class="list-group-item"><strong>CBU:</strong> <%=cuentaAEliminar.getCBU().toString()%></li>
					<li class="list-group-item"><strong>N° Cuenta:</strong> <%=cuentaAEliminar.getNumeroCuenta()%></li>
					<li class="list-group-item"><strong>Saldo:</strong> $<%=cuentaAEliminar.getSaldo()%></li>
					<li class="list-group-item"><strong>Fecha de Creación:</strong> <%=cuentaAEliminar.getFechaCreacion().toString()%></li>
					<li class="list-group-item"><strong>Estado:</strong> <%=cuentaAEliminar.isEstado() ? "Activa" : "Inactiva"%></li>
				</ul>
			</div>

			<div class="modal-footer">
				<form method="post" action="ManejarCuentaServlet">
					<input type="hidden" name="idCuenta" value="<%=cuentaAEliminar.getId()%>">
					<button type="submit" name="btnEliminarConfirmado" class="btn btn-danger">
						<i class="bi bi-trash me-1"></i> Eliminar Cuenta
					</button>
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cancelar</button>
				</form>
			</div>

		</div>
	</div>
</div>
<%}	%>
		<!-- Fin Modal -->
		
		
		<!-- Modal Mensaje-->
		<%
		Boolean mostrarModal2 = (Boolean) request.getAttribute("mostrarModalMsj");
		String mensaje = (String) request.getAttribute("mensaje");
		if (mostrarModal2 != null && mostrarModal2) {
		%>
		<script>
			window.onload = function() {
				var modal = new bootstrap.Modal(document
						.getElementById('modalMensaje'));
				modal.show();
			};
		</script>
		<%
		}
		%>
		
		<div class="modal fade" id="modalMensaje" tabindex="-1"
		aria-labelledby="modalMensajeLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="modalMensajeLabel">Resultado de operación:</h5>
					
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Cerrar"></button>
				</div>

				<div class="modal-body">
					<h4><%= mensaje %></h4>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cerrar</button>
				</div>

			</div>
		</div>
	</div>
		
	</main>

	<jsp:include page="/vistas/Footer.jsp" />
	<!-- DataTables -->
	<script
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>