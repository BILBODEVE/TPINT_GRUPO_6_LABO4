<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List"%>
<%@ page import="entidades.Cliente"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listar Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloInicio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloListarCuentas.css">
</head>

<body>
<jsp:include page="/vistas/Header.jsp" />

    <main class="container mt-5 mb-5">
    <%
		List<Cliente> listaClientes = (List<Cliente>) request.getAttribute("listaClientes");
		%>
    
        <h1 class="text-center mb-4">Listado de Usuarios</h1>

        <!-- Botón Nueva Cuenta -->
        <div class="mb-4 d-flex justify-content-end">
            <button type="button" class="btn btn-primary btn-nueva-cuenta" onclick="location.href='AltaUsuario.jsp'">
                <i class="bi bi-plus-circle me-2"></i> Nuevo Usuario
            </button>
        </div>

        <!-- Formulario de búsqueda -->
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form method="post" action="${pageContext.request.contextPath}/ListarUsuariosServlet">
                    <div class="mb-3">
                        <label for="dniCliente" class="form-label">Nombre de Usuario</label>
                        <input type="text" class="form-control shadow-sm" id="dniCliente" name="txtDniClientes" placeholder="Ingrese el nombre de usuario" required>
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
            <table class="table table-bordered table-hover align-middle text-center tabla-cuentas">
                <thead class="table-light">
                    <tr>
                        <th>Usuario</th>
                        <th>DNI Cliente</th>
                        <th>CUIL</th>
                        <th>Nombre/s</th>
                        <th>Apellido/s</th>
                        <th>Estado</th>
                        <th>Modificar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
					if (listaClientes != null && !listaClientes.isEmpty()) {
						for (Cliente c : listaClientes) {
					%>
					<tr>
						<td><%=c.getUsuario().getNombreUsuario()%></td>
						<td><%=c.getDNI()%></td>
						<td><%=c.getCUIL()%></td>
						<td><%=c.getNombre()%></td>
						<td><%=c.getApellido()%></td>
						<% if (c.getEstado()) {%>
						<td>Activo</td>
						<% } else { %>
						<td>Inactivo</td>
						<% } %>
                        <td>
                            <button type="button" class="btn btn-warning btn-sm" onclick="location.href='ModificarUsuario.jsp'">
                                <i class="bi bi-pencil-square"></i>
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger btn-sm" onclick="location.href='EliminarUsuario.jsp'">
                                <i class="bi bi-trash"></i>
                            </button>
                        </td>
                    </tr>
                    <%
					}
					} else {
					%>
					<tr>
						<td colspan="5">No hay usuarios cargados.</td>
					</tr>
					<%
					}
					%>
                </tbody>
            </table>
        </div>
    </main>

    <jsp:include page="/vistas/Footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

