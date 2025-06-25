<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio ABML Cliente</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloABML.css">
</head>
<body>

	<jsp:include page="/vistas/Header.jsp" />

	<main class="container py-4">
		<div class="text-center mb-3">
			<h4 class="fw-semibold">Gestión de Clientes</h4>
			<p class="text-muted small">Seleccione una opción para
				administrar los clientes.</p>
		</div>

		<div class="row row-cols-1 row-cols-md-2 g-3 mb-4">
			<div class="col">
				<div class="card text-center card-abml h-100">
					<div class="card-body d-flex flex-column justify-content-between">
						<div>
							<div class="icono text-success">
								<i class="bi bi-plus-circle"></i>
							</div>
							<h6 class="card-title mb-2">Alta de Cliente</h6>
						</div>
						<button class="btn btn-success btn-sm w-100 btn-abml"
							onclick="location.href='AltaCliente.jsp'">Seleccionar</button>
					</div>
				</div>
			</div>

			<div class="col">
				<div class="card text-center card-abml h-100">
					<div class="card-body d-flex flex-column justify-content-between">
						<div>
							<div class="icono text-primary">
								<i class="bi bi-list-ul"></i>
							</div>
							<h6 class="card-title mb-2">Listar y editar Clientes</h6>
						</div>
						<button href=""
							class="btn btn-primary btn-sm w-100 btn-abml" onclick="location.href='ListarCliente.jsp'">Seleccionar</button>
					</div>
				</div>
			</div>
		</div>
	</main>

	<jsp:include page="/vistas/Footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>