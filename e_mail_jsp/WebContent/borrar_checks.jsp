<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/modal.css" type="text/css" />
</head>
<body>

	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%@ page import="e_mail.*"%>
	<%
		String[] checkeds = request.getParameterValues("check");
		String origen=request.getParameter("origen");
		Class.forName("com.mysql.jdbc.Driver");
		String consulta_borrado="";

		try {
			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/correo", "root", "");
			if(!origen.equals("reenviar")){
				if(origen.equals("enviados")){
					consulta_borrado = "DELETE FROM mensajes_enviados WHERE cod_mensaje=?";
				}
				else consulta_borrado = "DELETE FROM mensajes_recibidos WHERE cod_mensaje=?";
				
				for (String a : checkeds) {
					PreparedStatement sqlpre = miConexion.prepareStatement(consulta_borrado);
					sqlpre.setInt(1, Integer.parseInt(a.trim()));
					sqlpre.executeUpdate();
				}
				
				if(origen.equals("enviados")){
					response.sendRedirect("enviados.jsp");
				}
				else response.sendRedirect("recibidos.jsp");
			}
			else {
				ArrayList<ResultSet> resultados=new ArrayList<ResultSet>();
				String asunto_texto = "SELECT asunto, texto FROM mensajes_recibidos WHERE cod_mensaje=?";
				ResultSet reenviados=null;
				for (String a : checkeds) {
					PreparedStatement sqlpre = miConexion.prepareStatement(asunto_texto);
					sqlpre.setInt(1, Integer.parseInt(a.trim()));
					reenviados=sqlpre.executeQuery();
					resultados.add(reenviados);
				}
			
				out.println("<div class='container'><div class='jumbotron'>");
				out.println("<h3>Elige destinatario/s</h3>");
				out.println("<button type='button' class='btn btn-warning btn-lg' data-toggle='modal' data-target='#myModal'><span class='glyphicon glyphicon-list-alt'></span><span class='glyphicon glyphicon-user'></span></button>");
				out.println("<div class='modal fade' id='myModal' role='dialog'>");
				out.println("<div class='modal-dialog'><div class='modal-content'><div class='modal-header'>");
				out.println("<button type='button' class='close' data-dismiss='modal'>&times;</button>");
				out.println("<h4 class='modal-title'>Selecciona usuario/s</h4></div><div class='modal-body'>");
				out.println("<form action='reenvio_modal.jsp' class='form-horizontal' method='post'>");		
				out.println("<div class='form-group'>");
				out.println("<div class='col-sm-12'><select multiple class='form-control' name='para'>");
					
				out.println(Servidor.listaOptionClientes());
												  
				out.println("</select></div></div>");
				out.println("<div class='form-group'><div class='col-sm-12'>");
				out.println("<button type='submit' class='btn btn-success btn-md' name='button' id='button' value='Enviar'>Enviar</button>");
			 	out.println("</div></div></form>");
				out.println("</div><div class='modal-footer'>");
				out.println("<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>");
				out.println("</div></div></div</div></div></div>");

				session.setAttribute("reenviados", resultados);
		
			}
			
			//miConexion.close();
			
		} catch (Exception e) {
			response.sendRedirect("exception.jsp");
		}
	%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>