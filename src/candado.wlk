import wollok.game.*
import fondo.*
class Candado {
	var ecosistema
	var property estaCerrado = true
	var property position 
	method image() = if(not estaCerrado){"candadoAbierto.png"} else {"candadoCerrado.png"}
	
	//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {
//		estaCerrado = false
		self.inicializar()
		personaje.ecosistemaActual(ecosistema)
	}
	
	//ABRIR EL CANDADO 
	method abrir(){
		estaCerrado = false
	}
	
	//DIVISION DE INICIALIZAR de FONDO
	method inicializar() {
	if (estaCerrado) {
			fondo.inicializar(ecosistema)
			ecosistema.jugar()
		}
		else {game.say(self, "Ya jugaste este nivel")}	
	}
	
}
