import fondo.*
import ecosistemas.*
import wollok.game.*
import mundo.*
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
	method elEcosistemaNoFueSalvado() {
		if (not ecosistema.fuisteSalvado()) {
			game.addVisual(self)
		}
	}
}
