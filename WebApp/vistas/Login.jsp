<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Login - Banco SIX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">

</head>
<body>

	<jsp:include page="Header.jsp" />

	<main>
		<div class="container mt-5">
			<h2 class="text-center mb-4">Iniciar Sesión</h2>
			 <%-- Mensaje de éxito si se cambió la contraseña --%>
            <%
                HttpSession sesionLogin = request.getSession(false);
                String mensajeLogin = null;
                if (sesionLogin != null) {
                    mensajeLogin = (String) sesionLogin.getAttribute("mensajeLogin");
                    if (mensajeLogin != null) {
                        sesionLogin.removeAttribute("mensajeLogin");
            %>
                        <div class="alert alert-success text-center mt-3">
                            <%= mensajeLogin %>
                        </div>
            <%
                    }
                }
            %>
			
		
			<% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger text-center mt-3">
        <%= request.getAttribute("error") %>
    </div>
<% } %>
			<div class="row justify-content-center">
				<div class="col-md-6">
					<form action="${pageContext.request.contextPath}/LoginServlet" method="post">
						<div class="mb-3">
							<label for="usuario" class="form-label">Usuario</label> <input
								type="text" class="form-control" id="usuario" name="usuario"
								required>
						</div>
						<div class="mb-3">
							<label for="clave" class="form-label">Contraseña</label> <input
								type="password" class="form-control" id="clave" name="clave"
								required>
						</div>
						<div class="mb-3 text-center">
  						<a href="${pageContext.request.contextPath}/vistas/RecuperarContrasenia.jsp">¿Olvidaste tu contraseña?</a>
						</div>
						<div class="d-grid">
							<button type="submit" class="btn btn-primary">Ingresar</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="Footer.jsp" />

</body>
</html>