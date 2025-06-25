<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pagar Préstamos - Banco SIX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloInicio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloABML.css">
</head>
<body>

<jsp:include page="/vistas/Header.jsp" />

<main class="container py-4">
    <div class="text-center mb-4">
        <h4 class="fw-semibold">Pago de Préstamos</h4>
        <p class="text-muted">Seleccione una cuota pendiente y la cuenta desde la cual se desea pagar.</p>
    </div>

    <form>
        <!-- Tabla de cuotas -->
        <div class="mb-4">
            <h6>Cuotas pendientes</h6>
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Seleccionar</th>
                            <th>ID Cuota</th>
                            <th>Monto</th>
                            <th>Vencimiento</th>
                            <th>Estado</th>
                            <th>Fecha de Pago</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input class="form-check-input" type="radio" name="cuotaId" value="1" required></td>
                            <td>1</td>
                            <td>$1.500</td>
                            <td>30/06/2025</td>
                            <td><span class="badge bg-warning text-dark">Pendiente</span></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td><input class="form-check-input" type="radio" name="cuotaId" value="2"></td>
                            <td>2</td>
                            <td>$1.500</td>
                            <td>30/07/2025</td>
                            <td><span class="badge bg-warning text-dark">Pendiente</span></td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Selección de cuenta -->
        <div class="mb-4">
            <h6>Cuenta de origen</h6>
            <select class="form-select" name="cuentaId" required>
                <option value="">Seleccione una cuenta...</option>
                <option value="101">Caja de Ahorro - $25.000</option>
                <option value="102">Cuenta Corriente - $8.000</option>
            </select>
        </div>

        <!-- Botón de pago -->
        <div class="text-end">
            <button type="button" class="btn btn-success" disabled>
                <i class="bi bi-cash-coin me-1"></i> Pagar cuota seleccionada
            </button>
        </div>
    </form>
</main>

<jsp:include page="/vistas/Footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
