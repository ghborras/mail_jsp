<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String usuario = request.getParameter("usuario");
		String password = request.getParameter("password");

		Class.forName("com.mysql.jdbc.Driver");

		try {
			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/correo", "root", "");
			Statement miStatement = miConexion.createStatement();
			String instruccionSql = "INSERT INTO clientes (nombre, apellidos, usuario, password) VALUES('" + nombre
					+ "','" + apellidos + "','" + usuario + "','" + password + "')";
			miStatement.executeUpdate(instruccionSql);
			out.println("Registrado con exito");
			miConexion.close();
			response.sendRedirect("formularioLogin.html");
		} catch (Exception e) {
			session.setAttribute("existe", usuario);
			response.sendRedirect("exception.jsp");
		}
	%>

</body>
</html>