import wollok.game.*
import bosque.*
import mundo.*
import personaje.*
import elementos.*

// PARA EL BOSQUE
const semilla1 = new Semilla()
const semilla2 = new Semilla()
const semilla3 = new Semilla()

class Semilla inherits Elemento{
	var property esAdulto = false
	var property fuePlantado = false
	
	//IMAGEN
	method image() = if (not esAdulto){
		"corn_baby.png"
	} else {
		"arbolSanoCHiquito.png"
	}
	
	//PARA sembarArbol(personaje) DE BOSQUES
	method plantar(personaje) {
		game.addVisualIn(self, personaje.position())
		fuePlantado = true
	}
	
	//CUANDO SE USA LA E
	override method estasInteractuandoCon(personaje){
		self.regar(personaje)
		mundo.estaSiendoSalvado(bosque)
	}
	
	
	//DIVISION DEL ESTASINTERACTUANDOCON
	method regar(personaje) {
		if (not esAdulto)  {
			esAdulto = true
		}
	}
}	