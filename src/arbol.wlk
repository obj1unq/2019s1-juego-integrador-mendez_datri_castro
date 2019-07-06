import wollok.game.*
import bosque.*
import mundo.*
import personaje.*
// PARA EL BOSQUE
const semilla1 = new Semilla()
const semilla2 = new Semilla()
const semilla3 = new Semilla()

class Arbol {
	var property image = "arbolSanoCHiquito.png"
	method fuisteChocadaPor(personaje) { /* NO HACE NADA */ }
	method estasInteractuandoCon(personaje) { /* NO HACE NADA */ }
	method tipo(){ return "arbol" }
} 
  
 
class Semilla inherits Arbol{ 
	var property position
	//var property image = "corn_baby.png"
//	var property esAdulto = false
	
	override method image() = "corn_baby.png"
	
	override method tipo(){ return "planta" }
//	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	
	method plantar(personaje) {
		game.addVisualIn(self, personaje.position())
	}
	override method estasInteractuandoCon(personaje){
		bosque.regar(self)
		mundo.estaSiendoSalvado(bosque)
	}
	
}	