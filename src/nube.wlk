import wollok.game.*
import ecosistemas.*
class Nube {
	var property image = "nubeNegra.png"
	var property position
	var property estaActivada = true
	
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	method estasSiendoProcesada(){
		self.desactivar()
		game.removeVisual(self)
	//	ciudad.quitarNube(self)
		
	}
	method desactivar(){
		estaActivada = false
	}
	method activar(){
		estaActivada = true
	}
	method estasInteractuandoCon(personaje){
		self.estasSiendoProcesada()
	//	game.say(personaje,"quiteNube")
		ciudad.estasSiendoSalvado()
	}
}