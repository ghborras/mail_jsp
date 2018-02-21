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
<%@ page import="java.util.*"%>

<%
		String user = session.getAttribute("user").toString();
		String[] usuarios=request.getParameterValues("para");
		ArrayList<ResultSet> resultados=(ArrayList<ResultSet>)session.getAttribute("reenviados");
		Class.forName("com.mysql.jdbc.Driver");
		try {
			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/correo", "root", "");

			
			
				//funciona perfecto
// 				for(ResultSet rst : resultados){
// 					while(rst.next()){
// 						for(String us: usuarios){
// 						out.println("Envia: "+user+" Asunto: "+rst.getString(1)+" Mensaje: "+rst.getString(2)+" Enviado a: "+us+"</br>");
// 						}
// 					}
// 				}
				
				String asunto="";
				String mensaje="";
				
				for(ResultSet rst : resultados){
					while(rst.next()){
						asunto=rst.getString(1);
						mensaje=rst.getString(2);
					}
				}	
	
					
				//este bucle usuario funciona con user y us
				for(String us: usuarios){
				
					Statement miStatement = miConexion.createStatement();
					String instruccionSql = "INSERT INTO mensajes_enviados (origen, asunto, texto, destino) VALUES('" + user + "','" + asunto + "','" + mensaje + "','" + us + "')";
					String instruccionSql2 = "INSERT INTO mensajes_recibidos (origen, asunto, texto, destino) VALUES('" + user + "','" + asunto + "','" + mensaje + "','" + us + "')";
					miStatement.executeUpdate(instruccionSql);
					miStatement.executeUpdate(instruccionSql2);
				}
				
				
					
			
			
			
// 			for(ResultSet rst : resultados){
// 				while(rst.next()){
// 					for(String user_destino : usuarios){
// 						Statement miStatement = miConexion.createStatement();
// 						String instruccionSql = "INSERT INTO mensajes_enviados (origen, asunto, texto, destino) VALUES('" + user + "','" + rst.getString(1) + "','" + rst.getString(2) + "','" + user_destino + "')";
// 						String instruccionSql2 = "INSERT INTO mensajes_recibidos (origen, asunto, texto, destino) VALUES('" + user + "','" + rst.getString(1) + "','" + rst.getString(2) + "','" + user_destino + "')";
// 						miStatement.executeUpdate(instruccionSql);
// 						miStatement.executeUpdate(instruccionSql2);
// 					}
// 				}
// 			}
			


			miConexion.close();
			response.sendRedirect("recibidos.jsp");

		} catch (Exception e) {
			response.sendRedirect("borrar_checks.jsp");
		}

%>

</body>
</html>