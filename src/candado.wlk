import wollok.game.*
class Candado {
	var ecosistema
	var property estaCerrado = true
	var property position 
	method image() = if(not estaCerrado){"candadoAbierto.png"} else {"candadoCerrado.png"}
	
//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {
		estaCerrado = false
		ecosistema.jugar()
	}
	
//PARA QUE EL CADADO QUEDE ABIERTO. SE INICIALIZA EN LOS ECOSISTEMAS
	method fueSalvado() {
		if ( ecosistema.fuisteSalvado()) {
			estaCerrado = false
		}
	}
}
