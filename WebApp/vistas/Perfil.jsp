<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page session="true"%>
<%@page import="entidades.Cliente"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%
HttpSession sesion = request.getSession(false);
String usuarioNombre = (String) sesion.getAttribute("nombreUsuario");
Cliente cliente = (Cliente) request.getAttribute("cliente");
%>


<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Mi Perfil - Banco SIX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
</head>
<body>

	<jsp:include page="Header.jsp" />

	<div class="container mt-5 mb-5">
		<h2 class="mb-4">Mi Perfil</h2>
		<div class="row g-4">
			<!-- Columna izquierda, para el perfil -->
			<div class="col-md-4 text-center">
				<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
					class="rounded-circle img-thumbnail mb-3" width="150"
					alt="Foto de perfil">
				<form>
					<label for="foto" class="form-label">Cambiar foto</label> <input
						class="form-control" type="file" id="foto" disabled>
				</form>
			</div>

			<!-- Columna derecha para cambiar passwords -->
			<div class="col-md-8">
				<div class="card shadow-sm">
					<div class="card-body">
						<h5 class="card-title">Cambiar contraseña</h5>
						<form
							action="${pageContext.request.contextPath}/CambiarPasswordServlet"
							method="post">
							<input type="hidden" name="accion" value="cambiarDesdePerfil">
							

							<div class="mb-3">
								<label for="actual" class="form-label">Contraseña actual</label>
								<input type="password" class="form-control" id="actual"
									name="actual">
							</div>
							<div class="mb-3">
								<label for="nueva" class="form-label">Nueva contraseña</label> <input
									type="password" class="form-control" id="nueva" name="nueva">
							</div>
							<div class="mb-3">
								<label for="confirmar" class="form-label">Confirmar
									nueva contraseña</label> <input type="password" class="form-control"
									id="confirmar" name="confirmar">
							</div>
							<button type="submit" class="btn btn-primary">Guardar
								cambios</button>

							<%
							String mensajeError = (String) request.getAttribute("mensajeError");
							String mensajeInformativo = (String) request.getAttribute("mensajeInformativo");

							if (mensajeError != null) {
							%>
							<div class="alert alert-danger mt-3"><%=mensajeError%></div>
							<%
							}
							if (mensajeInformativo != null) {
							%>
							<div class="alert alert-success mt-3"><%=mensajeInformativo%></div>
							<%
							}
							%>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="card mt-5 shadow-sm">
        <div class="card-body">
            <h5 class="card-title">Datos personales</h5>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <strong>Usuario:</strong> <span class="text-muted"><%= usuarioNombre %></span>
                </div>
               <% if (cliente != null) { %>
                <div class="col-md-6 mb-3">
                    <strong>Nombre completo:</strong> 
                    <span class="text-muted">
                        <%= (cliente.getNombre() != null ? cliente.getNombre() : "") + " " + 
                             (cliente.getApellido() != null ? cliente.getApellido() : "") %>
                    </span>
                </div>
                <div class="col-md-6 mb-3">
                    <strong>DNI:</strong> <span class="text-muted"><%= cliente.getDNI() != null ? cliente.getDNI() : "No disponible" %></span>
                </div>
                <div class="col-md-6 mb-3">
                    <strong>CUIL:</strong> <span class="text-muted"><%= cliente.getCUIL() != null ? cliente.getCUIL() : "No disponible" %></span>
                </div>
                <div class="col-md-6 mb-3">
                    <strong>Email:</strong> <span class="text-muted"><%= cliente.getEmail() != null ? cliente.getEmail() : "No disponible" %></span>
                </div>
                <div class="col-md-6 mb-3">
                    <strong>Teléfono:</strong> <span class="text-muted"><%= cliente.getTelefono() != null ? cliente.getTelefono() : "No disponible" %></span>
                </div>
                <div class="col-md-6 mb-3">
                    <strong>Sexo:</strong> <span class="text-muted"><%= cliente.getSexo() != null ? cliente.getSexo() : "No disponible" %></span>
                </div>
                <div class="col-md-6 mb-3">
                    <strong>Fecha de nacimiento:</strong> 
                    <span class="text-muted"><%= cliente.getFecha_nacimiento() != null ? cliente.getFecha_nacimiento() : "No disponible" %></span>
                </div>
                <div class="col-md-6 mb-3">
                    <strong>Nacionalidad:</strong> 
                    <span class="text-muted">
                        <%= (cliente.getNacionalidad() != null && cliente.getNacionalidad().getNombre() != null) 
                                ? cliente.getNacionalidad().getNombre() 
                                : "No disponible" %>
                    </span>
                </div>
            <% } else { %>
                <p class="text-danger">No se encontraron datos del cliente.</p>
            <% } %>
                
            </div>
        </div>
    </div>
</div>

	<jsp:include page="Footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		
</body>
</html>