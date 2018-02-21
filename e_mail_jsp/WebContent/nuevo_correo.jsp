<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nuevo Correo</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/nuevo.css" type="text/css" />
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%@ page import="e_mail.*"%>
	
			<div id="contenedor">
				<form action="inserta_mensaje.jsp" class="form-horizontal" method="post">
				
					<div class="form-group">
				 		<div class="container">
						  <button id="busca" type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-search"></span>Usuarios</button>		
						  <div class="modal fade" id="myModal" role="dialog">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title">Usuarios</h4>
						        </div>
						        <div class="modal-body">
						        <select multiple class="form-control" name="para" id="clientes">
						          <%
									out.println(Servidor.listaOptionClientes());
									%>
									</select>
						        </div>
						        <div class="modal-footer">
						          <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
						        </div>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
					<div class="form-group" id="seleccionados" style="display:none">
						<label class="control-label col-sm-2" for="asunto">Destino:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="usr" disabled>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="asunto">Asunto:
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="asunto" id="asunto" required>
						</div>
					</div>
	
					<div class="form-group">
						<label class="control-label col-sm-2" for="mensaje">Mensaje:
						</label>
						<div class="col-sm-10">
							<textarea class="form-control" name="mensaje" rows="5"></textarea>
						</div>
					</div>
					<div class="form-group">        
	     				<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-success btn-md" name="button" id="button" value="Enviar"><span class="glyphicon glyphicon-ok"></span>Enviar</button>
					 	</div>
	    			</div>
				</form>
			</div>
			
	<script>

	var select = document.getElementById('clientes');
	select.addEventListener('change',
	  function(){
		var selectedOption="";
		for (var i=0; i<select.options.length; i++){
			if(select.options[i].selected){
				selectedOption=selectedOption+select.options[i].text+", ";
			}	  
		}
		document.getElementById('seleccionados').style.display = "block";
	    document.getElementById('usr').value = selectedOption;
	  });
	
	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




</body>
</html>