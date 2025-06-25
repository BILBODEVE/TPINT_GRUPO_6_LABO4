<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reportes - Banco Six</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
</head>
<body>
<jsp:include page="/vistas/Header.jsp" />

<form class="container bg-light p-4 rounded shadow-sm">
    <h4 class="fw-bold text-center mb-3">Filtrar Reportes</h4>

    <div class="row g-3">
        <div class="col-md-6">
            <label for="numeroCuenta" class="form-label">Número de Cuenta</label>
            <input type="text" class="form-control" id="numeroCuenta" name="numeroCuenta" placeholder="Ej: 123456789">
        </div>
        <div class="col-md-6">
            <label for="dniCliente" class="form-label">DNI del Cliente</label>
            <input type="text" class="form-control" id="dniCliente" name="dniCliente" placeholder="Ej: 30123456">
        </div>

        <div class="col-md-6">
            <label for="fechaDesde" class="form-label">Desde</label>
            <input type="date" class="form-control" id="fechaDesde" name="fechaDesde">
        </div>

        <div class="col-md-6">
            <label for="fechaHasta" class="form-label">Hasta</label>
            <input type="date" class="form-control" id="fechaHasta" name="fechaHasta">
        </div>

        <div class="col-12">
            <label for="tipoReporte" class="form-label">Tipo de Reporte</label>
            <select class="form-select" id="tipoReporte" name="tipoReporte">
                <option value="mensual">Reporte Mensual</option>
                <option value="anual">Reporte Anual</option>
            </select>
        </div>
    </div>
    <div class="text-center mt-4">
        <button type="submit" class="btn btn-primary">
            Buscar Reporte <i class="bi bi-search ms-2"></i>
        </button>
    </div>
</form>
<main class="container py-4">
    <h2 class="fw-bold text-center mb-4">Panel de Reportes</h2>

    <div class="row g-4">
        
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <i class="bi bi-people-fill display-4 text-primary"></i>
                    <h5 class="card-title mt-2">Total de cuentas registradas</h5>
                    <p class="fs-4 fw-bold">[Banco Six - Cuenta Sueldo Standart]</p>
                </div>
            </div>
        </div>      
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <i class="bi bi-arrow-down-circle display-4 text-success"></i>
                    <h5 class="card-title mt-2">Ingresos / Egresos</h5>
                    <p class="fs-5"><strong>Ingresos:</strong> $15.000.000</p>
                    <p class="fs-5"><strong>Egresos:</strong> $13.000.000</p>
                </div>
            </div>
        </div>     
        <div class="col-md-4">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <i class="bi bi-cash-stack display-4 text-warning"></i>
                    <h5 class="card-title mt-2">Préstamos</h5>
                    <p class="fs-5"><strong>Cuotas Pagas:</strong> [8 - Cuotas]</p>
                    <p class="fs-5"><strong>Cuotas restantes:</strong> [64 - Cuotas]</p>
                    <a href="${pageContext.request.contextPath}/vistas/Admin/Reportes/detallesPrestamosCliente.jsp" class="btn btn-info">Ver Préstamos</a>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <i class="bi bi-box-seam display-4 text-info"></i>
                    <h5 class="card-title mt-2">Paquetes Contratados</h5>
                    <p class="fs-4 fw-bold">[Banco Six - Cuenta Sueldo Standart]</p>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <i class="bi bi-exclamation-circle display-4 text-danger"></i>
                    <h5 class="card-title mt-2">Saldos Impagos</h5>
                    <p class="fs-4 fw-bold">[$9.000.000]</p>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="/vistas/Footer.jsp" />
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>