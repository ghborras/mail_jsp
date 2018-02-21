<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enviados</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style_table.css" type="text/css" />
</head>

<body>
	
		<%@ page import="java.sql.*"%>
				
			<form action="borrar_checks.jsp">
				<div class="container">	
					<div class="panel panel-default">
      					<div class="panel-body">	
							<div class="table-responsive">   
							<table class="table table-fixed">
								<thead>
									<tr>
										<th id="ck" width="5%">ck</th>
										<th id="thasunto" width="15%">Asunto</th>
										<th id="men" width="55%">Mensaje</th>
										<th id="rec" width="10%">A</th>
										<th id="fecha" width="15%">Fecha</th>
									</tr>
								</thead>
								<tbody>
	
						<%
						Class.forName("com.mysql.jdbc.Driver");
	
						try {
	
							String consulta2 = "SELECT * FROM mensajes_enviados WHERE origen=? ORDER BY cod_mensaje DESC";
							Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/correo", "root", "");
							PreparedStatement sqlpre = miConexion.prepareStatement(consulta2);
							sqlpre.setString(1, session.getAttribute("user").toString());
							ResultSet enviados = sqlpre.executeQuery();
							int cont=0;
							while (enviados.next()) {
								cont++;
								out.println("<tr><td id='ck1' width='5%'><input type='checkbox' name='check' value='");
							%>
							<%=enviados.getInt(1)%>
							<%
							
							String fecha=enviados.getString(6).split(" ")[0];
							out.println("'></td><td width='15%' id='asunto'>" + enviados.getString(3) + "</td><td id='man' width='55%'>" + enviados.getString(4)
										+ "</td><td id='recb' width='10%'>" + enviados.getString(5) + "</td><td width='15%' id='date'>" + fecha + "</td></tr>");
								
							}
							out.println(
									"</tbody><tfoot><tr><td id='boton_borrar'><button type='submit' class='btn btn-danger btn-md' name='origen' value='enviados'><span class='glyphicon glyphicon-trash'></span><span class='non'>Seleccion</span></button></td><td id='boton_refresh'><a href='javascript:location.reload()' class='btn btn-success btn-md'><span class='glyphicon glyphicon-refresh'></span><span class='non'>Refresh</span></a></td><td id='boton_reenviar'><button type='button' class='btn btn-default btn-md'><span id='sobre' class='glyphicon glyphicon-envelope'></span><strong>"+cont+"</strong></button></td></tr></tfoot></table></div></div></div></div></form>");
	
						} catch (Exception e) {
							out.println("Conexion fallida reintenta");
						}
						%>
					

		</div>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
	</html>
