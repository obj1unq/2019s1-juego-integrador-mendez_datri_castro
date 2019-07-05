import wollok.game.*
import fondo.*
class Candado {
	var ecosistema
	var property estaCerrado = true
	var property position 
	method image() = if(not estaCerrado){"candadoAbierto.png"} else {"candadoCerrado.png"}
	
	//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {
		self.inicializar()	
	}
	//CUANDO SE INTERACTUA CON EL PERSONAJE
	method estasInteractuandoCon(personaje){/* NO HACE NADA */}
	
	//ABRIR EL CANDADO 
	method abrir(){
		estaCerrado = false
	}
	
	//DIVISION DE INICIALIZAR de FONDO
	method inicializar() {
	if (estaCerrado) {
			fondo.inicializar(ecosistema)
//			fondo.ecosistemaActual(ecosistema)
			ecosistema.jugar()
		}
		else {game.say(self, "Ya jugaste este nivel")}	
	}
	
}
