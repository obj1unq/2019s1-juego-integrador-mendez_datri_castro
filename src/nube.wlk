import wollok.game.*
import ciudad.*
class Nube {
	var property image = "nubeNegra.png"
	var property position
	
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	method estasSiendoProcesada(){
		ciudad.quitar(self)
		game.removeVisual(self)
	}

	method estasInteractuandoCon(personaje){
		self.estasSiendoProcesada()
		ciudad.estasSiendoSalvado()
	}
}