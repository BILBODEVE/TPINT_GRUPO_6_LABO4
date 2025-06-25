<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Información</title>
</head>
<body>
<jsp:include page="Header.jsp" />
<br>
<%
String textoInformativo = "";
if (request.getAttribute("mensajeInformativo") != null) {
    textoInformativo = (String) request.getAttribute("mensajeInformativo");
}
%>
<div class="container mt-5 mb-5">
<div class="alert alert-info" role="alert">
  <%= textoInformativo %>
</div>
</div>
<br>

<jsp:include page="Footer.jsp" /> 
</body>
</html>