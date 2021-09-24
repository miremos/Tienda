<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="clientes.jsp"></jsp:include>
	<%
	try{
	int cedula = Integer.parseInt(request.getParameter("cedula"));
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection connexion = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendagrupo18?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8", "root", "admin");
	
	PreparedStatement ps = connexion.prepareStatement("DELETE FROM clientes WHERE cedula_cliente ="+cedula);
	ps.executeUpdate();
	//response.sendRedirect("clientes.jsp");
	%>
	<div class="alert alert-success d-flex align-items-center" role="alert">		
  <svg xmlns="http://www.w3.org/2000/svg"  width="24" height="24" fill="currentColor" class="bi flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Success:">
  	<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </svg>
  
    <strong>Datos del cliente Borrados</strong> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
</div>
	
	<% }catch(SQLException e){ %>
	<div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi flex-shrink-0 me-2" viewBox="0 0 16 16" role="img" aria-label="Danger:">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </svg>
  <div>
  
  	<strong>Cédula Errada</strong> 
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
     
  </div>
</div>
	
	<%} %>
</body>
</html>