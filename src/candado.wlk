import fondo.*
import ecosistemas.*
import wollok.game.*

class Candado {
	var ecosistema
	var property estaCerrado = true
	
	method image() = if(not estaCerrado){"candadoAbierto.png"} else {"candadoCerrado.png"}
	
	//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {
		estaCerrado = false
		ecosistema.jugar()
		game.removeVisual(self)
	}
}
