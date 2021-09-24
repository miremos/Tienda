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
<link rel="stylesheet" href="tabla.css">
<link rel="stylesheet" href="Usuarios/css/estilos_agregar.css">
<title>Clientes</title>
<script>
	//Cuadro de diálogo de confirmación en JavaScript
	function confirmarAccesoURL() {
		return confirm("¿Está seguro que desea borrar el cliente?");

	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<h1 class="titulo">CLIENTES</h1>
	<nav class="navbar navbar-light bg-light"></nav>
	<%
	//String usuario = request.getParameter("usuario");
	//String password = request.getParameter("pass");

	Class.forName("com.mysql.jdbc.Driver");
	Connection connexion = java.sql.DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/tiendagrupo18?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
			"root", "admin");
	PreparedStatement ps = connexion.prepareStatement("SELECT * FROM clientes");
	ResultSet result = ps.executeQuery();
	%>
	<nav class="navbar navbar-light bg-light">
		<div class="container-fluid">
			<form class="d-flex" action="consultarCliente.jsp" method="post">
				<input class="form-control me-2" type="number" name="cedula"
					placeholder="Número de cédula" aria-label="Search" required>
				<button class="btn btn-outline-primary" type="submit" name="accion">BUSCAR</button>
			</form>
			<nav class="navbar navbar-light bg-light"
				style="text-align: right; width: 620px">
				<form action="agregarCliente.jsp">
					<div class="dropdown">
						<button name="accion" value="Agregar"
							class="btn btn-outline-primary">
							<i class="fas fa-users"></i> Agregar Cliente
						</button>
					</div>
				</form>
			</nav>
		</div>
	</nav>
	<div>
		<div id="main-container">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>CEDULA</th>
						<th>DIRECCION</th>
						<th>CORREO</th>
						<th>NOMBRE</th>
						<th>TELEFONO</th>
						<th colspan="2" style="text-align: center;">ACCIONES</th>
					</tr>
				</thead>
				<%
				while (result.next()) {
				%>
				<tr>
					<td><%=result.getInt("cedula_cliente")%>
					<td><%=result.getString("direccion_cliente")%>
					<td><%=result.getString("email_cliente")%>
					<td><%=result.getString("nombre_cliente")%>
					<td><%=result.getString("telefono_cliente")%>
					<td><a
						href="editarCliente.jsp?cedula=<%=result.getInt("cedula_cliente")%>"><img
							src="img/editar.png" alt="30" width="30" /></a></td>
					<td><a
						href="eliminarCliente.jsp?cedula=<%=result.getInt("cedula_cliente")%>"
						onclick="return confirmarAccesoURL()"><img
							src="img/eliminar.png" alt="30" width="30" /></a></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
	<br>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>