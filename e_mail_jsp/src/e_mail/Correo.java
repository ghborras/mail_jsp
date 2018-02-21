package e_mail;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Correo {

	private String mensaje;
	private Cliente origen;
	private Cliente destino;
	private Date fecha;
	
	public Correo(String mensaje, Cliente origen, Cliente destino) {
		super();
		this.mensaje = mensaje;
		this.origen = origen;
		this.destino = destino;
		fecha = new Date();
	}

	public Date getFecha() {
		return fecha;
	}
	
	public String formatFecha() {
		
		SimpleDateFormat formato_fecha=new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat formato_hora=new SimpleDateFormat("HH:mm:ss");
		return formato_fecha.format(fecha)+" a las "+formato_hora.format(fecha);
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public Cliente getOrigen() {
		return origen;
	}

	public void setOrigen(Cliente origen) {
		this.origen = origen;
	}

	public Cliente getDestino() {
		return destino;
	}

	public void setDestino(Cliente destino) {
		this.destino = destino;
	}
	
	
	
	
	
	
	

	
}
