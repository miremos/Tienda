<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="body.css">
<link rel="stylesheet" href="tabla.css">
<title>Menu</title>

</head>

<body>

	<%
	//String usuario = request.getParameter("usuario");
	//String password = request.getParameter("pass");

	Class.forName("com.mysql.jdbc.Driver");
	Connection connexion = java.sql.DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/tiendagrupo18?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
			"root", "admin");
	PreparedStatement ps = connexion.prepareStatement("SELECT * FROM login");
	ResultSet result = ps.executeQuery();
	%>


	<nav class="navbar navbar-expand-lg navbar-light bg-info">

		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="principal.jsp"><i
						class="fa fa-home" aria-hidden="true"></i> Home</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="usuarios.jsp"><i
						class="fas fa-user-tie"></i> Usuarios</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="clientes.jsp"><i
						class="fas fa-users"></i> Clientes</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="proveedores.jsp"><i
						class="fas fa-people-carry"></i> Proveedores</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="#"><i class="fas fa-leaf"></i>
						Productos</a></li>
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="#"><i
						class="fas fa-cart-arrow-down"></i> Ventas</a></li>
				<li class="nav-item dropdown">
					<div class="dropdown" style="text-align: right; width: 220px">

						<button style="border: none"
							class="btn btn-outline-light dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="true">
							<i class="fas fa-file-import"></i> Consultas y Reportes

						</button>

						<div class="dropdown-menu text-center">
							<a class="dropdown-item" href="#"><i
								class="fas fa-file-import"></i></a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Reporte Usuarios</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Reporte Clientes</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Reporte Ventas</a>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="dropdown" style="text-align: right; width: 220px">
			<%
			while (result.next()) {
			%>
			<button style="border: none"
				class="btn btn-outline-light dropdown-toggle" type="button"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="true">
				<%=result.getString("login_usuario")%>
			</button>
			<div class="dropdown-menu text-center">
				<a class="dropdown-item" href="#"><img src="img/usuario.png"
					alt="30" width="30" /></a> <a class="dropdown-item" href="#">Usuario
					logeado</a> <a class="dropdown-item" href="#"><%=result.getString("login_usuario")%></a>
				<%
				}
				%>
				<div class="dropdown-divider"></div>
				<a class="dropdown btn btn-outline-primary" style="border: none"
					href="index.jsp">SALIR</a>
			</div>
		</div>
	</nav>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>