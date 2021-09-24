<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="Usuarios/css/editar_cliente.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Actualizar Proveedor</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<h1>ACTUALIZAR PROVEEDOR</h1>
	<%
	int nit = Integer.parseInt(request.getParameter("nit"));

	Class.forName("com.mysql.jdbc.Driver");
	Connection connexion = java.sql.DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/tiendagrupo18?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8",
			"root", "admin");

	PreparedStatement ps = connexion.prepareStatement("SELECT * FROM proveedores WHERE nit_proveedor =" + nit);
	ResultSet result = ps.executeQuery();
	while (result.next()) {
	%>

	<form action="" method="post">
		<img class="img2" src="Usuarios/imagenes/8.jpg" alt="">
		<div class="card col-sm-4" style="border: none">
			<div class="card-body">
				<br>
				<div class="contenedor">
					<label class="label">NIT</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#128179</span> <input
							type="number" name="nit"
							value="<%=result.getInt("nit_proveedor")%>" class="form-control"
							aria-describedby="basic-addon1" required="required" readonly>
					</div>
					<label class="label">Ciudad</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#9993</span> <input
							type="text" name="ciudad"
							value="<%=result.getString("ciudad_proveedor")%>"
							class="form-control" aria-describedby="basic-addon1"
							required="required">
					</div>
					<label class="label">Direccion</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#129333</span> <input
							type="text" name="dirrecion"
							value="<%=result.getString("direccion_proveedor")%>"
							class="form-control" pattern="[A-Za-z0-9#�/_()-�� ]{3,100}"
							aria-describedby="basic-addon1" required="required">
					</div>
					<label class="label">Nombre</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#128204</span> <input
							type="text" name="nombre"
							value="<%=result.getString("nombre_proveedor")%>"
							class="form-control" pattern="[A-Za-z ]{3,100}"
							aria-describedby="basic-addon1" required="required">
					</div>
					<label class="label">Telefono</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#129333</span> <input
							type="number" name="telefono"
							value="<%=result.getString("telefono_proveedor")%>"
							class="form-control" aria-describedby="basic-addon1"
							required="required">
					</div>
					<br>
					<div>

						<div class="d-grid gap-2 d-md-block">
							<button type="submit" class="btn btn-outline-success btn-lg">EDITAR</button>
							<a class="btn btn-outline-primary btn-lg" type="button"
								href="proveedores.jsp">CANCELAR</a>

						</div>

					</div>

				</div>

			</div>

		</div>
	</form>

	<%
	}

	String ciudad = request.getParameter("ciudad");
	String dirrecion = request.getParameter("dirrecion");
	String nombre = request.getParameter("nombre");
	String telefono = request.getParameter("telefono");
	try {
	if (ciudad != null && dirrecion != null && nombre != null && telefono != null) {
		String sql = "UPDATE proveedores set ciudad_proveedor = '" + ciudad + "', direccion_proveedor = '" + dirrecion
		+ "', nombre_proveedor = '" + nombre + "', telefono_proveedor = '" + telefono + "' WHERE nit_proveedor ="
		+ nit;
		Statement st = connexion.createStatement();
		st.executeUpdate(sql);
		//response.sendRedirect("usuarios.jsp");
	%>
	<div class="alert alert-success d-flex align-items-center" role="alert">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
			fill="currentColor" class="bi flex-shrink-0 me-2" viewBox="0 0 16 16"
			role="img" aria-label="Success:">
  	<path
				d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
  </svg>

		<strong>Datos del Proveedor Actualizados</strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	</div>

	<%
	}
	} catch (SQLException e) {
	%>
	<div class="alert alert-danger d-flex align-items-center" role="alert">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
			fill="currentColor" class="bi flex-shrink-0 me-2" viewBox="0 0 16 16"
			role="img" aria-label="Danger:">
    <path
				d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
  </svg>
		<div>

			<strong>�Hubo un error!</strong> Debe verificar algunos de esos
			campos.
			<button type="button" class="btn-close" data-bs-dismiss="alert"
				aria-label="Close"></button>

		</div>
	</div>

	<%
	}
	%>
</body>
</html>