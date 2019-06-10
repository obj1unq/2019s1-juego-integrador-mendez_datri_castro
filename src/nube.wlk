import wollok.game.*
import ciudad.*
class Nube {
	var property image = "nubeNegra.png"
	var property position
	var property estaActivada = false
	
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	method estasSiendoProcesada(){
		ciudad.quitar(self)
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