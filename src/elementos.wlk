import wollok.game.*
import mundo.*
import fondo.*

class Elemento {
	var property position
	var image = null
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	
	// DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje){
		self.estasSiendoProcesada()
		mundo.estaSiendoSalvado(fondo.ecosistemaActual())
	}
	
	// DIVISION DE ESTAS INTERACTUANDO CON 
	method estasSiendoProcesada(){
		fondo.ecosistemaActual().quitar(self)
	}
	
}

class ElementoQueSeMueve inherits Elemento{
	var movimientos = 0
	
	// DIVISION DEL APARECER
	method moverse(){
		game.onTick(1500, "basura moviendose", {=> self.mover()})
	}
	
	//DIVISION DE MOVERSE
	method mover() {
		if (movimientos < 3){
			position = position.left(1)
			movimientos ++
		}
		else if (movimientos >= 3 and movimientos <= 5){
			position = position.right(1)
			movimientos ++
		}
		else {movimientos = 0}
	}
}