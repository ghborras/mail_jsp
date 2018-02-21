<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="e_mail.*"%>
<%@ page import="java.sql.*"%>

	<%	
		String registro;
		if(request.getParameter("loger").equals("login")){
			Class.forName("com.mysql.jdbc.Driver");
	
			try {
				ResultSet miRs=Servidor.compruebaUser(request.getParameter("usuario"), request.getParameter("password"));
				if (miRs.absolute(1)) {
					session.setAttribute("user", miRs.getString("usuario"));
					response.sendRedirect("pagina_user.jsp");
				} else
					response.sendRedirect("registro.jsp");
					registro="login";
					session.setAttribute("registro", registro);
	
			} catch (Exception e) {
				out.println("Conexion fallida reintenta");
			}
		}
		else {
			registro="registro";
			session.setAttribute("registro", registro);
			response.sendRedirect("registro.jsp");
		}
	%>

</body>
</html>