<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
	<title>Movimientos - Banco SIX</title>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloInicio.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estiloABML.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
	<main>
	<form class="container my-4">
  <div class="row mb-3">
    <div class="col-md-6">
      <label for="fechaInicio" class="form-label">Fecha desde:</label>
      <input type="date" id="fechaInicio" name="fechaInicio" class="form-control" required>
    </div>
    <div class="col-md-6">
      <label for="fechaFin" class="form-label">Fecha hasta:</label>
      <input type="date" id="fechaFin" name="fechaFin" class="form-control">
    </div>
  </div>

  <div class="row mb-4">
    <div class="col-md-4">
      <label for="tipoMovimiento" class="form-label">Tipo de movimiento:</label>
      <select class="form-select" id="tipoMovimiento" name="tipoMovimiento">
        <option value="">Seleccione...</option>
        <option value="credito">Crédito</option>
        <option value="debito">Débito</option>
      </select>
    </div>
    <div class="col-md-4">
      <label for="estado" class="form-label">Estado:</label>
      <select class="form-select" id="estado" name="estado">
        <option value="">Seleccione...</option>
        <option value="realizado">Realizado</option>
        <option value="en_proceso">En proceso</option>
        <option value="rechazada">Rechazada</option>
      </select>
    </div>
    <div class="col-md-4">
      <label for="cuenta" class="form-label">Cuenta:</label>
      <select class="form-select" id="cuenta" name="cuenta">
        <option value="">Seleccione una cuenta...</option>
        <option value="101">Caja de Ahorro - $25.000</option>
        <option value="102">Cuenta Corriente - $8.000</option>
      </select>
    </div>
  </div>
  <div class="text-end mb-4">
    <button type="submit" class="btn btn-primary">
      <i class="bi bi-search"></i> Ver movimientos
    </button>
  </div>
</form>
<div class="row mb-3">
  <div class="col-md-3 ms-1" style="margin-left: 60px;">
    <label for="cantidad" class="form-label">Mostrar:</label>
    <select class="form-select" id="cantidad" name="cantidad" onchange="this.form.submit()">
      <option value="10">10 movimientos</option>
      <option value="50">50 movimientos</option>
      <option value="100">100 movimientos</option>
    </select>
  </div>
</div>

<div class="table-responsive">
  <table class="table table-bordered text-center align-middle">
    <thead class="table-dark">
      <tr>
        <th>Fecha</th>
        <th>Tipo</th>
        <th>Estado</th>
        <th>Monto</th>
        <th>Cuenta</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>12/06/2025</td>
        <td>Crédito</td>
        <td><span class="badge bg-success">Realizado</span></td>
        <td>$1.000</td>
        <td>Caja de Ahorro</td>
      </tr>
      <tr>
        <td>13/06/2025</td>
        <td>Débito</td>
        <td><span class="badge bg-danger">Rechazada</span></td>
        <td>$500</td>
        <td>Cuenta Corriente</td>
      </tr>
      <tr>
        <td>14/06/2025</td>
        <td>Débito</td>
        <td><span class="badge bg-warning text-dark">En proceso</span></td>
        <td>$750</td>
        <td>Caja de Ahorro</td>
      </tr>
    </tbody>
  </table>
</div>
</main>
<jsp:include page="Footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>