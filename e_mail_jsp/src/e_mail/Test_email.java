package e_mail;

public class Test_email {

	public static void main(String[] args) {
		
		Servidor google = new Servidor();
		Cliente german = new Cliente("German");
		Cliente juan = new Cliente("Juan");
		Cliente pedro = new Cliente("Pedro");
		Cliente luis = new Cliente("Luis");
		Cliente pepe = new Cliente("Pepe");
		google.altaCliente(german);
		google.altaCliente(juan);
		google.altaCliente(pedro);
		google.altaCliente(luis);
		google.altaCliente(pepe);
		//google.bajaCliente(pepe);
		//Servidor.listaClientes();
		german.enviaCorreo("pepe");
		pepe.enviaCorreo("german");
	//	juan.enviaCorreo("luis");
//		pedro.enviaCorreo("luis");
//		luis.enviaCorreo("german;juan");
		german.imprimeEnviados();
		german.imprimeRecibidos();
//		juan.imprimeEnviados();
//		juan.imprimeRecibidos();
//		luis.imprimeEnviados();
//		luis.imprimeRecibidos();
//		pedro.imprimeEnviados();
//		pedro.imprimeRecibidos();
		pepe.imprimeEnviados();
		pepe.imprimeRecibidos();
		

	}

}
