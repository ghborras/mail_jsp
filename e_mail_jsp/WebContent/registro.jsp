<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registro</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/registro.css" type="text/css" />
</head>
<body>

	<div class="container">
		<div class="jumbotron">
			<h3><a href='formularioLogin.html' class='btn btn-info btn-md'><span class='glyphicon glyphicon-home'></span>Inicio</a></h3>
		<%
			if(session.getAttribute("registro").equals("login")){
				out.println("<h3><span id='war' class='glyphicon glyphicon-warning-sign'></span>Datos incorrectos</h3>");
			}
			else{
				out.println("<h3><span class='glyphicon glyphicon-thumbs-up'></span>Bienvenido al formulario de registro</h3>");
			}
		
		%>
			
          
			<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-pencil"></span>Registrate</button>
		</div>
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-header">
	          		<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	</div>
	        	<div class="modal-body">
					<form action="recoge_datos.jsp" method="post" id="mod">
						<div class="form-group">
			
							<label for="nombre">Nombre: </label> <input type="text"
								class="form-control" name="nombre" id="nombre">
						</div>
						<div class="form-group">
							<label for="apellido">Apellidos: </label>
							</td> <input type="text" class="form-control" name="apellidos"
								id="apellidos">
						</div>
						<div class="form-group">
			
							<label for="usuario">Usuario: </label> <input type="text"
								class="form-control" name="usuario" id="usuario">
						</div>
						<div class="form-group">
							<label for="contra">Contraseña: </label>
							</td> <input type="password" class="form-control" name="password"
								id="contra">
						</div>
						<button type="submit" class="btn btn-primary btn-md" name="button"
							id="button" value="Enviar">Aceptar</button>
					</form>
				</div>
				<div class="modal-footer">
	          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        	</div>
	        </div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>