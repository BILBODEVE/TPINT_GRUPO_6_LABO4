<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Detalles de Préstamos</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/vistas/Header.jsp" />

<div class="container py-4">
    <h2 class="fw-bold text-center mb-4">Detalles de Préstamos</h2>

    <table class="table table-striped">
        <thead>
            <tr>
                <th># Préstamo</th>
                <th>Cliente</th>
                <th>Monto</th>
                <th>Cuotas Restantes</th>
                <th>Estado</th>              
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>P001</td>
                <td>Juan Perez</td>
                <td>$5.000.000</td>
                <td>2</td>
                <td>Impago</td>
            </tr>
            <tr>
                <td>P002</td>
                <td>Juan Perez</td>
                <td>$8.000.000</td>
                <td>0</td>
                <td>Finalizado</td>
            </tr>
        </tbody>
    </table>
</div>
<div class="container mt-4 bg-light p-4 rounded shadow-sm">
    <h3 class="fw-bold text-center">Simulación de Refinanciación</h3>

    <form>
        <div class="mb-3">
            <label for="idPrestamo" class="form-label">ID del Préstamo</label>
            <input type="text" class="form-control" id="idPrestamo" name="idPrestamo" placeholder="Ej: P001" required>
        </div>

        <div class="mb-3">
            <label for="montoDeuda" class="form-label">Monto a Refinanciar</label>
            <input type="number" class="form-control" id="montoDeuda" name="montoDeuda" placeholder="Ej: 5000" required>
        </div>

        <div class="mb-3">
            <label for="situacionDeuda" class="form-label">Situación de Deuda</label>
            <select class="form-select" id="situacionDeuda" name="situacionDeuda">
                <option value="regular">Regular</option>
                <option value="irregular">Irregular</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="tipoTasa" class="form-label">Tipo de Tasa</label>
            <select class="form-select" id="tipoTasa" name="tipoTasa">
                <option value="TNA">TNA</option>
            </select>
        </div>
           <div class="mb-3">
                <label for="valorCuota" class="form-label">Cantidad Cuotas</label>
                <input type="number" class="form-control" id="cantidadCuotas" name="cantidadCuotas" placeholder="Ej: 12" required>
            </div>

        <div class="text-center">
            <button type="button" class="btn btn-warning" onclick="habilitarCampos()">Simular Refinanciación</button>
        </div>

        <div id="resultadoSimulacion" class="mt-4 text-center fw-bold" style="display: none;">
            <div class="mb-3">
                <label for="valorRefinanciado" class="form-label">Valor Refinanciado</label>
                <input type="text" class="form-control" id="valorRefinanciado" readonly>
            </div>

            <div class="mb-3">
                <label for="valorCuota" class="form-label">Valor Cuota Mensual</label>
                <input type="text" class="form-control" id="valorCuota" readonly>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">Realizar Refinanciación</button>
            </div>
        </div>
    </form>
</div>

<script>
function habilitarCampos() {
    document.getElementById("resultadoSimulacion").style.display = "block";
}
</script>
<jsp:include page="/vistas/Footer.jsp" />
</body>
</html>