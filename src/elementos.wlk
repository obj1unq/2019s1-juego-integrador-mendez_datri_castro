import wollok.game.*
import mundo.*
import fondo.*

class Elemento {
	var property position
	
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
