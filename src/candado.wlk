import wollok.game.*
import fondo.*
class Candado {
	var ecosistema
	var property estaCerrado = true
	var property position 
	method image() = if(not estaCerrado){"candadoAbierto.png"} else {"candadoCerrado.png"}
	
//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {
		estaCerrado = false
		self.inicializar()
		personaje.ecosistemaActual(ecosistema)
	}
	
//PARA QUE EL CADADO QUEDE ABIERTO. SE INICIALIZA EN LOS ECOSISTEMAS
	method fueSalvado() {
		if ( ecosistema.fuisteSalvado()) {
			estaCerrado = false
		}
	}
	
	method inicializar() {
	if (not ecosistema.fuisteSalvado()) {
			fondo.inicializar(ecosistema)
			ecosistema.jugar()
		}
		else {game.say(self, "Ya jugaste este nivel")}	
	}
}
