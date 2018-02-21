<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script>

window.alert("Correo enviado con exito");

</script>
<body>


	<%@ page import="java.sql.*"%>
	<%@ page import="javax.swing.JOptionPane"%>
	<%
		String origen = session.getAttribute("user").toString();
		String[]usuarios=request.getParameterValues("para");
		String asunto = request.getParameter("asunto");
		String mensaje = request.getParameter("mensaje");
		
		Class.forName("com.mysql.jdbc.Driver");

		try {
			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/correo", "root", "");
			for(String user: usuarios){	
				Statement miStatement = miConexion.createStatement();
				String instruccionSql = "INSERT INTO mensajes_enviados (origen, asunto, texto, destino) VALUES('" + origen
						+ "','" + asunto + "','" + mensaje + "','" + user + "')";
				String instruccionSql2 = "INSERT INTO mensajes_recibidos (origen, asunto, texto, destino) VALUES('" + origen
						+ "','" + asunto + "','" + mensaje + "','" + user + "')";
				miStatement.executeUpdate(instruccionSql);
				miStatement.executeUpdate(instruccionSql2);
			}
			
			
			miConexion.close();
			response.sendRedirect("mensajes.jsp");
			
			//response.sendRedirect("nuevo_correo.jsp");
		} catch (Exception e) {
			response.sendRedirect("exception.jsp");
		}
			%>
		
	

</body>
</html>