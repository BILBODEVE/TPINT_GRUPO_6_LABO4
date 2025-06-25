<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autorizar préstamos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>
</head>
<body>
	<jsp:include page="/vistas/Header.jsp" />

	<main class="container mt-5 mb-5">
		<h1 class="text-center mb-4">Listado de Préstamos Solicitados</h1>

		<form method="get" action="#" class="row g-3 mb-4">

			<div class="table-responsive mt-5">
				<table id="table_id" class="display">
					<thead class="table-light">
						<tr>
							<th>Cliente</th>
							<th>Cuenta</th>
							<th>Importe pedido</th>
							<th>Plazo (en meses)</th>
							<th>Importe Mensual</th>
							<th>Estado</th>
							<th>Reportes</th>
							<th>Aprobar</th>
							<th>Rechazar</th>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>Ana Gómez</td>
							<td>00012345</td>
							<td>$50,000</td>
							<td>12</td>
							<td>$4,600</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Lucas Martínez</td>
							<td>00012346</td>
							<td>$75,000</td>
							<td>18</td>
							<td>$4,300</td>
							<td>Aprobado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>María Torres</td>
							<td>00012347</td>
							<td>$30,000</td>
							<td>6</td>
							<td>$5,200</td>
							<td>Rechazado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Carlos Pérez</td>
							<td>00012348</td>
							<td>$100,000</td>
							<td>24</td>
							<td>$4,800</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Sofía Ruiz</td>
							<td>00012349</td>
							<td>$60,000</td>
							<td>12</td>
							<td>$5,500</td>
							<td>Aprobado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Javier Fernández</td>
							<td>00012350</td>
							<td>$45,000</td>
							<td>10</td>
							<td>$4,900</td>
							<td>Rechazado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Laura Díaz</td>
							<td>00012351</td>
							<td>$70,000</td>
							<td>14</td>
							<td>$5,000</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Diego López</td>
							<td>00012352</td>
							<td>$90,000</td>
							<td>18</td>
							<td>$5,300</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Valentina Castro</td>
							<td>00012353</td>
							<td>$35,000</td>
							<td>6</td>
							<td>$6,200</td>
							<td>Aprobado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Mateo Ramírez</td>
							<td>00012354</td>
							<td>$55,000</td>
							<td>11</td>
							<td>$5,100</td>
							<td>Rechazado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Martina Herrera</td>
							<td>00012355</td>
							<td>$65,000</td>
							<td>13</td>
							<td>$5,200</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Tomás Aguirre</td>
							<td>00012356</td>
							<td>$48,000</td>
							<td>8</td>
							<td>$6,200</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Camila Medina</td>
							<td>00012357</td>
							<td>$82,000</td>
							<td>16</td>
							<td>$5,400</td>
							<td>Aprobado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Juan Rivas</td>
							<td>00012358</td>
							<td>$58,000</td>
							<td>10</td>
							<td>$6,000</td>
							<td>Rechazado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Julieta Romero</td>
							<td>00012359</td>
							<td>$40,000</td>
							<td>7</td>
							<td>$6,100</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Santiago Ponce</td>
							<td>00012360</td>
							<td>$95,000</td>
							<td>20</td>
							<td>$5,100</td>
							<td>Aprobado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Agustina Bravo</td>
							<td>00012361</td>
							<td>$72,000</td>
							<td>15</td>
							<td>$5,400</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Federico Sosa</td>
							<td>00012362</td>
							<td>$66,000</td>
							<td>12</td>
							<td>$5,800</td>
							<td>Pendiente</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
						<tr>
							<td>Bianca Molina</td>
							<td>00012363</td>
							<td>$38,000</td>
							<td>6</td>
							<td>$6,700</td>
							<td>Rechazado</td>
							<td><a
								href="${pageContext.request.contextPath}/vistas/Admin/Reportes/reportes.jsp"
								class="btn btn-info btn-sm">Ver...</a></td>
							<td><input type="submit" name="btnAprobar" value="aprobar"
								class="btn btn-primary btn-sm"></td>
							<td><input type="submit" name="btnRechazar" value="rechazar"
								class="btn btn-danger btn-sm"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</main>

	<jsp:include page="/vistas/Footer.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>