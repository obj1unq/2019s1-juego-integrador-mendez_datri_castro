import wollok.game.*
import ciudad.*
import mundo.*

class Nube {
	var property image = "nubeNegra.png"
	var property position
	
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje){
		self.estasSiendoProcesada()
		mundo.estaSiendoSalvado(ciudad)
	}
	
	// DIVISION DE ESTAS INTERACTUANDO CON 
	method estasSiendoProcesada(){
		ciudad.quitar(self)
		game.removeVisual(self)
	}
}