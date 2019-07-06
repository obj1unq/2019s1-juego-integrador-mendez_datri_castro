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
	//var property image = "corn_baby.png"
	var property esAdulto = false
	var property fuePlantado = false
	
	method image() = if (not esAdulto){
		"corn_baby.png"
	} else {
		"arbolSanoCHiquito.png"
	}
	
	method plantar(personaje) {
		game.addVisualIn(self, personaje.position())
		fuePlantado = true
	}
	
	override method estasInteractuandoCon(personaje){
		self.regar(personaje)
		mundo.estaSiendoSalvado(bosque)
	}
	
	method regar(personaje) {
		if (not esAdulto)  {
			esAdulto = true
		}
	}
}	