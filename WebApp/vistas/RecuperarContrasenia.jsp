<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Recuperar Contraseña</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
</head>
<body>
<jsp:include page="Header.jsp" />
    <div class="container mt-5">
    <h2>Recuperar Contraseña</h2>

    <% if (request.getAttribute("mensaje") != null) { %>
        <div class="alert alert-success"><%= request.getAttribute("mensaje") %></div>
    <% } %>
    <% if (request.getAttribute("mensajeError") != null) { %>
        <div class="alert alert-danger"><%= request.getAttribute("mensajeError") %></div>
    <% } %>

    <form action="${pageContext.request.contextPath}/CambiarPasswordServlet" method="post" id="formRecuperar">

        <div class="mb-3">
            <label for="usuario" class="form-label">Usuario</label>
            <input type="text" class="form-control" id="usuario" name="usuario" required
                   value="<%= request.getParameter("usuario") != null ? request.getParameter("usuario") : "" %>"/>
        </div>

        <button type="submit" name="accion" value="validarUsuario" class="btn btn-primary">Validar Usuario</button>

        <hr>

        <div class="mb-3">
            <label for="nuevaClave" class="form-label">Nueva Contraseña</label>
            <input type="password" class="form-control" id="nuevaClave" name="nuevaClave" disabled required />
        </div>

        <div class="mb-3">
            <label for="confirmarClave" class="form-label">Confirmar Nueva Contraseña</label>
            <input type="password" class="form-control" id="confirmarClave" name="confirmarClave" disabled required />
        </div>

        <button type="submit" id="btnCambiar" name="accion" value="cambiarPassword" class="btn btn-success" disabled>Cambiar Contraseña</button>
    </form>
    
	<script src="${pageContext.request.contextPath}/js/cambiarPass.js"></script>
   <% Boolean habilitar = (Boolean) request.getAttribute("habilitarCampos"); %>
	<% if (habilitar != null) { %>
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        <% if (habilitar) { %>
            habilitarCampos(); //
        <% } else { %>
            document.getElementById("usuario").value = ""; 
            document.getElementById("usuario").focus();   
        <% } %>
     });
	</script>
	<% } %>
	
    
    
    </div>
</body>
		<jsp:include page="Footer.jsp" />

	
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>