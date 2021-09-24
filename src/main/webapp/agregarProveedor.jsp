<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="Usuarios/css/estilos_agregar.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Agregar Proveedor</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<h1 class="titulo">AGREGAR PROVEEDOR</h1>
	<form action="agregarProveedorB.jsp" method="post">
		<img class="img" src="Usuarios/imagenes/7.jpg" alt="">
		<div class="card col-sm-4" style="border: none">
			<div class="card-body">
				<br>
				<div class="contenedor">
					<label class="label">NIT</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#128179</span> <input
							type="number" name="nit" placeholder="Digite su número NIT"
							aria-describedby="basic-addon1" class="form-control" required>
					</div>
					<label class="label">Ciudad</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#9993</span> <input
							type="text" name="ciudad" placeholder="Digite ciudad"
							aria-describedby="basic-addon1" class="form-control"
							pattern="[A-Za-zÑñ´ ]{3,100}" required>
					</div>
					<label class="label">Direccion</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#129333</span> <input
							type="text" name="dirrecion" placeholder="Digite dirercion"
							aria-describedby="basic-addon1" class="form-control"
							pattern="[A-Za-z#\º/_-()Ññ ]{3,100}" required>
					</div>
					<label class="label">Nombre</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#128204</span> <input
							type="text" name="nombre"
							placeholder="Digite su nombre aria-describedby="
							basic-addon1" class="form-control" pattern="[A-Za-zÑñ´ ]{3,100}"
							required>
					</div>
					<label class="label">Telefono</label>
					<div class="input-group">
						<span class="input-group-text" id="basic-addon1">&#129333</span> <input
							type="number" name="telefono"
							placeholder="Digite su número telfonicoo"
							aria-describedby="basic-addon1" class="form-control" required>
					</div>
					<br>
					<div class="form-group">
						<input type="submit" name="accion" value="Agregar"
							class="btn btn-outline-success btn-lg"> <a
							class="btn btn-outline-primary btn-lg" type="button"
							href="proveedores.jsp">CANCELAR</a>
					</div>
				</div>
			</div>
		</div>
	</form>


</body>
</html>