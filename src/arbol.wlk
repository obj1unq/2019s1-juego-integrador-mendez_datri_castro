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
	
	method esAdulto() = false
	
	method image() = "corn_baby.png"
	
	method plantar(personaje) {
		game.addVisualIn(self, personaje.position())
	}
	override method estasInteractuandoCon(personaje){
		self.regar(personaje)
		mundo.estaSiendoSalvado(bosque)
	}
	
	method regar(personaje) {
		bosque.agregar(new Arbol(), self.position())
		bosque.quitar(self)
	}
}	

class Arbol inherits Semilla{
	override method esAdulto() = true
	override method image() = "arbolSanoCHiquito.png"
	override method regar(personaje){}
	override method estasInteractuandoCon(personaje){}
}