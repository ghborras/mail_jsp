package e_mail;

import java.util.Iterator;

import javax.swing.JOptionPane;

public class Cliente {

	private String nombre;
	
	public Cliente(String nombre) {
		super();
		this.nombre = nombre;
	}

	public void enviaCorreo(String clientes) {
		
		String frase = JOptionPane.showInputDialog(this.nombre, "Escribe tu mensaje");
		if(isCliente(this.getNombre())){
			for(String c: clientes.split(";")) {
				if(isCliente(c)) {
					for(Cliente m : Servidor.getClientes()) {
						Correo tema = new Correo(frase, this, m);
						if(c.compareToIgnoreCase(m.getNombre()) == 0) {
							Servidor.getCorreos().add(tema);
						}
					}
				}
				else {
					System.out.println("El cliente " + c + " no existe");
				}
			}
		}
		else System.out.println("Cliente: " + this.nombre + ": No estas registrado");
		
	}
	
	private boolean isCliente(String nombre) {
		
		boolean existe_cliente = false;
		for(Cliente m : Servidor.getClientes()) {
			if(nombre.compareToIgnoreCase(m.getNombre()) == 0) {
				existe_cliente = true;	
			}
		}
		return existe_cliente;
	}
	
	public void imprimeEnviados() {
		int i = 1;
		if(isCliente(this.nombre)) {
			System.out.println("Enviados por cliente: " + this.nombre);
			for (Correo m : Servidor.getCorreos()) {
				if(m.getOrigen().getNombre() == this.nombre) {
					System.out.println(" - Mensaje " + i + ": '" + m.getMensaje() + "' Para: " + m.getDestino().nombre + " - Fecha: " + m.formatFecha());
					i++;
				}
			}
			if(i == 1) {
				System.out.println("No has enviado correos");
			}
		}
		else { 
			System.out.println("Cliente: " + this.nombre + ": No estas registrado");
		}
		
	}
	
	public void imprimeRecibidos() {
		int i = 1;
		if(isCliente(this.nombre)) {
			System.out.println("Recibidos por cliente: " + this.nombre);
			
			Iterator<Correo> it = Servidor.getCorreos().iterator();
			while (it.hasNext()) {
				Correo a = it.next();
				if(a.getDestino().getNombre() == this.nombre) {
					System.out.println(" - Mensaje " + i + ": '" + a.getMensaje() + "' De: " + a.getOrigen().nombre + " - Fecha: " + a.formatFecha());
					i++;
				}
			}
			if(i == 1) {
				System.out.println("No has recibido correos");
			}
		}
		else { 
			System.out.println("Cliente: " + this.nombre + ": No estas registrado");
		}
		
	}
	
	public String getNombre() {
		return nombre;
	}
}
