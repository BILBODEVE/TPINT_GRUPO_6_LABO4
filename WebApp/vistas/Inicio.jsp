<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page session="true"%>
<%

String usuarioNombre = (String) session.getAttribute("nombreUsuario");
String tipoUsuario = (String) session.getAttribute("rol");

//Clase para poder iterar luego y poder renderizar los datos. Hermosa clase auxiliar. 
class Tarjeta {
	String link;
	String icono;
	String color;
	String titulo;

	Tarjeta(String link, String icono, String color, String titulo) {
		this.link = link;
		this.icono = icono;
		this.color = color;
		this.titulo = titulo;
	}
}

List<Tarjeta> tarjetas = new ArrayList<>();


if (tipoUsuario  == "administrador") {
	tarjetas.add(new Tarjeta("Clientes.jsp", "bi-people-fill", "text-primary", "Gestionar Clientes"));
	tarjetas.add(new Tarjeta("Cuentas.jsp", "bi-bank2", "text-success", "Gestionar Cuentas"));
	tarjetas.add(new Tarjeta("Usuarios.jsp", "bi-person-lock", "text-info", "Usuarios"));
	tarjetas.add(new Tarjeta("vistas/Admin/AdministrarPrestamos/AutorizarPrestamos.jsp", "bi-check2-circle", "text-warning", "Autorizar Préstamos"));
	tarjetas.add(new Tarjeta("vistas/Admin/Reportes/reportes.jsp", "bi-bar-chart-line", "text-danger", "Reportes"));
} else if (tipoUsuario  == "cliente") {
	tarjetas.add(new Tarjeta("vistas/Cuentas.jsp", "bi-wallet2", "text-primary", "Mis Cuentas"));
	tarjetas.add(new Tarjeta("vistas/Movimientos.jsp", "bi-journal-text", "text-success", "Movimientos"));
	tarjetas.add(new Tarjeta("TransferenciaServlet", "bi-arrow-left-right", "text-info", "Transferencias"));
	tarjetas.add(new Tarjeta("SolicitarPrestamosServlet", "bi-cash-stack", "text-warning", "Solicitar Préstamo"));
	tarjetas.add(new Tarjeta("vistas/PagarCuota.jsp", "bi-credit-card-2-back", "text-danger", "Pagar Cuotas"));
}
%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Inicio - Banco SIX</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
</head>
<body>

	<jsp:include page="Header.jsp" />

	<main>
		<%
		if (usuarioNombre != null && tipoUsuario == "administrador") {
		%>
		<section class="container py-4">
			<div class="px-3 px-md-5">
				<h2 class="fw-bold mb-3">
					¡Bienvenido,
					<%=usuarioNombre%>!
				</h2>
				<p class="text-muted fs-5">
					Estás logueado como <strong>Administrador</strong>.
				</p>

				<div class="row g-4 mt-4">
					<%
					for (Tarjeta t : tarjetas) {
					%>
					<div class="col-md-4">					
						<a href="${pageContext.request.contextPath}/<%=t.link%>"
							class="card text-decoration-none text-dark shadow-sm border-0 h-100 hover-shadow">
							<div class="card-body text-center">
								<i class="bi <%=t.icono%> display-4 <%=t.color%>"></i>
								<h5 class="card-title mt-3"><%=t.titulo%></h5>
							</div>
						</a>
					</div>
					<%
					}
					%>
				</div>
		</section>
		<%
		} else if (usuarioNombre != null && tipoUsuario == "cliente") {
		%>
		<section class="container py-4">
			<div class="px-3 px-md-5">
				<h2 class="fw-bold mb-3">
					¡Hola,
					<%=usuarioNombre%>!
				</h2>
				<p class="text-muted fs-5">
					Estás logueado como <strong>Cliente</strong>.
				</p>

				<div class="row g-4 mt-4">
					<%
					for (Tarjeta t : tarjetas) {
					%>
					<div class="col-md-4">
						<a href="${pageContext.request.contextPath}/<%=t.link%>"
							class="card text-decoration-none text-dark shadow-sm border-0 h-100 hover-shadow">
							<div class="card-body text-center">
								<i class="bi <%=t.icono%> display-4 <%=t.color%>"></i>
								<h5 class="card-title mt-3"><%=t.titulo%></h5>
							</div>
						</a>
					</div>
					<%
					}
					%>
				</div>
		</section>
		<%
		} else {
		%>
		
<section class="hero bg-light py-2  d-flex align-items-center">
  <div class="container">
    <h3 class="display-4 text-center mb-4">
  	<span class="fw-bold">¡Hola!</span>
  	<span class="fw-normal"> ¿En qué podemos ayudarte?</span>
	</h3>

    <div id="bancoCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner rounded shadow-lg overflow-hidden">

        <div class="carousel-item active" style="height: 350px; background:url('${pageContext.request.contextPath}/img/slider1.png') center center / cover no-repeat;">
          
        </div>

        <div class="carousel-item" style="height: 350px;background:url('${pageContext.request.contextPath}/img/slider2.png') center center / cover no-repeat;">
          
        </div>

        <div class="carousel-item" style="height: 350px; background:url('${pageContext.request.contextPath}/img/slider3.png') center center / cover no-repeat;">
          
        </div>

        <div class="carousel-item" style="height: 350px; background:url('${pageContext.request.contextPath}/img/slider4.png') center center / cover no-repeat;">
          
        </div>

      </div>

      <button class="carousel-control-prev" type="button" data-bs-target="#bancoCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
        <span class="visually-hidden">Anterior</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#bancoCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
        <span class="visually-hidden">Siguiente</span>
      </button>
    </div>

    <div class="text-center mt-4">
      <a href="Login.jsp" class="btn btn-primary btn-lg px-5">
        Accedé ahora <i class="bi bi-box-arrow-in-right ms-2"></i>
      </a>
    </div>
  </div>
</section>

<section class="py-5 bg-white">
  <div class="container text-center">
    <h2 class="mb-4 fw-bold">¿Por qué elegir Banco SIX?</h2>
    <div class="row g-4">
      <div class="col-md-4">
        <i class="bi bi-shield-lock display-4 text-primary mb-3"></i>
        <h5 class="fw-semibold">Seguridad Garantizada</h5>
        <p class="text-muted">Protección avanzada para tus transacciones.</p>
      </div>
      <div class="col-md-4">
        <i class="bi bi-phone display-4 text-success mb-3"></i>
        <h5 class="fw-semibold">Gestión 100% Online</h5>
        <p class="text-muted">Hacé todo desde tu celular o computadora.</p>
      </div>
      <div class="col-md-4">
        <i class="bi bi-piggy-bank display-4 text-warning mb-3"></i>
        <h5 class="fw-semibold">Sin costos ocultos</h5>
        <p class="text-muted">Transparencia total en todas nuestras operaciones.</p>
      </div>
    </div>
  </div>
</section>
		<%
		}
		%>
	</main>
	<jsp:include page="Footer.jsp" />

	<!-- Bootstrap icons y JS -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/Inicio.js"></script>
</body>
</html>
