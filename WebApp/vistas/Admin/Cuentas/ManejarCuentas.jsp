<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Manejar Cuentas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Cuentas/estiloManejarCuentas.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloInicio.css">
</head>

<body>
	<jsp:include page="/vistas/Header.jsp" />

	<main class="container">
		<div class="form-card">
			<h2 class="form-title">Modificar/Eliminar Cuenta</h2>

			<!-- Busqueda por DNI -->
			<form method="post" action="#">
				<div class="form-group">
					<label for="dniCliente">DNI del Cliente</label> <input type="text"
						id="dniCliente" name="dniCliente" placeholder="Ingrese el DNI"
						required />
					<button type="submit" name="btnBuscarCliente"
						class="btn btn-secondary">Buscar</button>
				</div>
			</form>

			<!-- Resultado de la búsqueda y selección de cuenta -->
			<div class="form-section">
				<form method="post" action="#">
					<div class="form-group">
						<label for="cliente">Cliente</label> <input type="text"
							id="cliente" name="cliente" readonly
							placeholder="Nombre y Apellido del Cliente" />
					</div>

					<div class="form-group">
						<label for="cuenta">Cuenta a Modificar/Eliminar</label> <select
							id="cuenta" name="cuenta" required>
							<option disabled selected>Seleccione una cuenta</option>
							<!-- Aquí se listarían las cuentas del cliente -->
						</select>
					</div>

					<div class="form-group">
						<label for="cbu">Cbu</label> <input type="text" id="cbu"
							name="cbu" readonly placeholder="CBU" />
					</div>

					<div class="form-group">
						<label for="tipoCuenta">Tipo de Cuenta</label> <input type="text"
							id="tipoCuenta" name="tipoCuenta" readonly
							placeholder="Caja de ahorro / Cuenta corriente" />
					</div>

					<div class="form-group">
						<label for="saldo">Saldo Actual</label> <input type="text"
							id="saldo" name="saldo" readonly placeholder="$0.00" />
					</div>

					<!-- Botones de acción -->
					<div class="form-buttons center-container">
						<button type="submit" name="btnEliminarCuenta"
							class="btn btn-danger">Modificar/Eliminar Cuenta</button>
						<button type="button" class="btn btn-secondary">Cancelar</button>
					</div>
				</form>
			</div>
		</div>
	</main>

	<jsp:include page="../../Footer.jsp" />
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
