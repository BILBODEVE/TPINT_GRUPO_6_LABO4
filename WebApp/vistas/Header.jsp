<%@ page session="true" %>
<%
    String usuarioLogueado = (String) session.getAttribute("nombreUsuario"); 
	String tipoUsuario = (String) session.getAttribute("rol");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/vistas/Inicio.jsp">
            <img src="https://img.icons8.com/ios-filled/30/ffffff/bank.png" alt="Logo" class="me-2">
            Banco SIX
        </a>
        
        <!-- Botón hamburguesa -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContenido" aria-controls="navbarContenido" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse justify-content-end" id="navbarContenido">
            <ul class="navbar-nav">
                 <% if (usuarioLogueado == null || tipoUsuario == null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/vistas/Login.jsp">Iniciar Sesión</a>
                    </li>
                  
                <% } else { %>
                    <li class="nav-item">
                        <span class="nav-link text-white">
                            <strong><%= usuarioLogueado %></strong> 
                            (<%= tipoUsuario.equals("administrador") ? "Administrador" : "Cliente" %>)
                        </span>
                    </li>
                    <% if ("cliente".equals(tipoUsuario)) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/PerfilServlet">Mi Perfil</a>
                    </li>
                    <% } %>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath}/LogoutServlet">Cerrar Sesión</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>