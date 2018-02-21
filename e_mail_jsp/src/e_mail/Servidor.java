package e_mail;

import java.util.ArrayList;
import java.sql.*;

public class Servidor {
	
	private static ArrayList<Cliente> clientes;
	private static ArrayList<Correo> correos;
	
	public Servidor() {
		super();
		Servidor.clientes = new ArrayList<Cliente>();
		Servidor.correos = new ArrayList<Correo>();
	}
	
	public void altaCliente(Cliente nuevo) {
		clientes.add(nuevo);
	}
	
	public void bajaCliente(Cliente baja) {
		clientes.remove(baja);
	}
	
	public static void listaClientes() {
		
		for (Cliente x: clientes) {
			System.out.println(x.getNombre());
		}
	}
	
	public static ArrayList<Cliente> getClientes() {
		
		return clientes;
	}
	
	public static ArrayList<Correo> getCorreos() {
		
		return correos;
	}
	
	public static ResultSet compruebaUser(String user, String pass) {
				
			String consulta1 = "SELECT * FROM clientes WHERE usuario=? AND password=?";
			Connection miConexion;
			ResultSet miRs = null ;
			
			try {
				miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/correo", "root", "");
				PreparedStatement sqlpre = miConexion.prepareStatement(consulta1);
				sqlpre.setString(1, user);
				sqlpre.setString(2, pass);
				miRs = sqlpre.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return  miRs;
		
	}
	
	public static String listaOptionClientes() {
		
		String listado="";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String consulta3 = "SELECT nombre, apellidos, usuario FROM clientes ORDER BY nombre";
			Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/correo", "root", "");
			Statement stm = miConexion.createStatement();
			ResultSet usuarios = stm.executeQuery(consulta3);
			while (usuarios.next()) {
				listado += "<option value='"+usuarios.getString(3)+"'>"+usuarios.getString(1)+" "+usuarios.getString(2)+"</option>";
			}
			
		} catch (Exception e) {
			listado="Conexion fallida reintenta";
		}
		return listado;
	}

}
