<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Zona Usuarios</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>

<body>
	
	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
		
	<div class="container">
		<div id="cabecera">
			<div id="titulo">
				<h1><span class="glyphicon glyphicon-envelope"></span>germ@n</h1>
			</div>
			<div id="user">
				<h3><span class="glyphicon glyphicon-user"></span><strong><%=" " + session.getAttribute("user")%></strong></h3>
			</div>
			<div id="time">
				<% SimpleDateFormat formato_fecha=new SimpleDateFormat("dd-MM-yyyy");%>
				<h3><%=formato_fecha.format(new java.util.Date())%></h3>
			</div>	
		</div>
		
		<ul class="nav nav-pills nav-justified">
		    <li class="active"><a data-toggle="pill" href="#nuevo"><span class="glyphicon glyphicon-plus"></span><span class="non">Nuevo Correo</span></a></li>
		    <li><a data-toggle="pill" href="#recibidos"><span class="glyphicon glyphicon-envelope"></span><span class="non">Recibidos</span></a></li>
		    <li><a data-toggle="pill" href="#enviados"><span class="glyphicon glyphicon-send"></span><span class="non">Enviados</span></a></li>
		    <li><a href="formularioLogin.html"><span class="glyphicon glyphicon-log-out"></span><span class="non">Salir</span></a></li>
  		</ul>
  		
  		

		 <div class="tab-content">
		 
		 	<div id="nuevo" class="tab-pane fade in active">
				<iframe src="nuevo_correo.jsp" frameborder="0"></iframe>
			</div>

		 	<div id="recibidos" class="tab-pane fade">
				<iframe src="recibidos.jsp" frameborder="0"></iframe>
					
	    	</div>
	    	<div id="enviados" class="tab-pane fade">
	    		<iframe src="enviados.jsp" frameborder="0"></iframe> 
	    	</div>

		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>