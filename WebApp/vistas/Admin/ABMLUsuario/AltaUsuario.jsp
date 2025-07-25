<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alta de usuario</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
</head>
<body>
	<jsp:include page="../../Header.jsp" />
	
		<main>
		<div class="container mt-5">
			<h2 class="text-center mb-4">Crear nuevo usuario</h2>
			<div class="row justify-content-center">
				<div class="col-md-6">
					<form action="LoginServlet" method="post">
						<div class="col mb-3">
							<label for="lblDNI" class="form-label">Número de documento</label> 
							<input type="text" class="form-control" id="lblDNI" placeholder="Ingrese su número de DNI" required pattern="^\d+$" title="Solo se permiten números">
						</div>
						<div class="col mb-3">
							<label for="lblCUIL" class="form-label">Número de CUIL</label>
							<input type="text" class="form-control" id="lblCUIL" placeholder="Ingrese su número de CUIl" required pattern="^\d+$" title="Solo se permiten números">
						</div>
						<div class="col mb-3 d-flex flex-column justify-content-end">
							<button type="submit" class="btn btn-secondary btn-md w-25 .btn-abml">Buscar</button>
    					</div>
						<div class="mb-3">
							<label for="lblUsuario" class="form-label">Usuario</label> <input
								type="text" class="form-control" name="lblUsuario"
								required placeholder="Ingrese el nombre de usuario">
						</div>
						<div class="mb-3">
							<label for="lblClave" class="form-label">Contraseña</label> <input
								type="password" class="form-control" name="lblClave"
								required placeholder="Ingrese la contraseña">
						</div>
						<div class="mb-3">
							<label for="lblRepetirClave" class="form-label">Repetir contraseña</label> <input
								type="password" class="form-control" name="lblRepetirClave"
								required placeholder="Repita la contraseña">
						</div>
						<div class="mb-3">
	    						<label for="lblTipoUser" class="form-label">Seleccionar cuenta de Origen</label>
	    						<select id="lblTipoUser" class="form-select">
	    							<option value="" disabled selected>Seleccionar tipo usuario</option>
	    							<option>Administrador</option>
	    							<option>Cliente</option>
	    						</select>
	    					</div>
						<div class="d-grid">
							<button type="submit" class="btn btn-primary">Crear usuario</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>


	<jsp:include page="../../Footer.jsp" />
</body>
</html>