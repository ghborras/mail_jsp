<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exception</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/modal.css" type="text/css" />
</head>
<body>

	<%
		String mensaje = "NO HAY SELECCION";
		if(session.getAttribute("existe")!=null){
			mensaje = "El usuario "+session.getAttribute("existe").toString().toUpperCase()+ " ya existe";
			session.setAttribute("existe", null);
		}
	
	%>

	<div id='errores'>
		<div id='person'>
			<img src='img/personas2.png' width='300px' alt='personas'>
		</div>
		<div id='mensajes'>
			<h2>
				<span id='war' class='glyphicon glyphicon-warning-sign'></span>
			</h2>
			<h5>
				<strong><%=mensaje %></strong>
			</h5>
			<h4>
				<a class='btn btn-info btn-md' href='javascript:history.back(-1);'><span
					class='glyphicon glyphicon-arrow-left'></span>Volver</a>
			</h4>
		</div>
	</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>