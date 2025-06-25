<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entidades.Cuenta" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transferencias</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estiloInicio.css">
</head>
<body>
	<jsp:include page="Header.jsp" />
	
	<main>
		
		<div class="container py-4">
		
			<div class="text-center">
				<h2>Transferencias</h2>
			</div>
			
			<div class="d-flex justify-content-center">
				<form method="POST" action="${pageContext.request.contextPath}/TransferenciaServlet">

					
					<div class="card w-auto">
	  					<div class="card-body">
	  					
	    					<div class="mb-3">
	    						<label for="lblCuentaOrig" class="form-label">Seleccionar cuenta de Origen</label>
	    						<select id="lblCuentaOrig" name="cuentaOrigen" class="form-select" required>
	    							<option value="" disabled selected>Seleccionar cuenta</option>
	    							<%
                                        List<Cuenta> cuentasCliente = (List<Cuenta>) request.getAttribute("cuentasCliente");
	    							    out.println("DEBUG JSP: cuentasCliente = " + (cuentasCliente != null ? cuentasCliente.size() : "null"));

                                        if (cuentasCliente != null) {
                                            for (Cuenta cuenta : cuentasCliente) {
                                    %>
                                                <option value="<%= cuenta.getId() %>">
                                                    <%= cuenta.getTipoCuenta().getDescripcion() %> - CBU: <%= cuenta.getCBU() %> - Saldo: $<%= cuenta.getSaldo() %>
                                                </option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
	    					</div>
	    					
	    					<div class="mb-3">
                                <label for="lblCBU" class="form-label">Ingresar CBU de destino</label>
                                <input type="text" id="lblCBU" name="cbuDestino" class="form-control" required>
                            </div>
	    					
	    					 <div class="mb-3">
                                <label for="lblMonto" class="form-label">Ingrese el monto a transferir</label>
                                <input type="number" id="lblMonto" name="monto" class="form-control" step="0.01" min="0.01" required>
                            </div>
	    					
	    					<div class="mb-3">
	    						<button type="submit" class="btn btn-success btn-sm w-100">Transferir</button>
	    						<!-- validar que la cuenta tenga fondos-->
	    						<!-- validar que el CBU exista-->
	    						<!-- descontar saldo del cliente -->
	    						<!-- aumentar saldo de cuenta destino -->
	    					</div>
	    					
	    					<!-- Mensajes de error o éxito -->
                            <% if (request.getAttribute("error") != null) { %>
                                <div class="alert alert-danger text-center">
                                    <%= request.getAttribute("error") %>
                                </div>
                            <% } %>
                            <% if (request.getAttribute("mensajeExito") != null) { %>
                                <div class="alert alert-success text-center">
                                    <%= request.getAttribute("mensajeExito") %>
                                </div>
                            <% } %>
	    					
	  					</div>
					</div>
				</form>
			</div>
		
		
		</div>
	</main>
	
	<jsp:include page="Footer.jsp" />
</body>
</html>