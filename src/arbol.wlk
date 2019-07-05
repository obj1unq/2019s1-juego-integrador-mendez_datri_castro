import wollok.game.*
import bosque.*
import mundo.*
import personaje.*
// PARA EL BOSQUE
const semilla1 = new Semilla()
const semilla2 = new Semilla()
const semilla3 = new Semilla()

class Semilla {
	var property position
	var property image = "corn_baby.png"
	var property esAdulto = false
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	method plantar(personaje) {
		game.addVisualIn(self, personaje.position())
	}
	method estasInteractuandoCon(personaje){
		self.regar(personaje)
		mundo.estaSiendoSalvado(bosque)
	}
	
	method regar(personaje) {
		image = "arbolSanoCHiquito.png"
		bosque.elementos().remove(self)
	}
}	