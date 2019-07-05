import wollok.game.*
import personaje.*
import mundo.*
import animales.*
import fondo.*
import candado.*
import ecosistema.*

//ECOSISTEMA SELVA
object selva inherits Ecosistema{
	const property candado = new Candado(ecosistema = self, position = game.at(4,4))
	
	//POLIMORFICO CON EL FONDO
	method image(){ return "selva.jpg" } 
	method mensaje() = "Pon los animales en los lugares indicados con la E"
	method jugar(){ 
		elementos.add(spot1)
		elementos.add(spot2)
		elementos.add(spot3)
		elementos.add(spot4)
		elementos.forEach({spot => game.addVisual(spot)})
	}
	

	//DIVISION DE ESTAS INTERACTUANDO CON de LUGARAPARAPONERANIMALES
	
	method sacarSpot(spot)		 { 
		game.removeVisual(spot)
		elementos.remove(spot)
	}
	method agregarAnimal(animal) { 
		game.addVisual(animal)
		elementos.add(animal)
	}
	
	//DIVISION DE ESTAS SIENDO SALVADO
	method listaSpot() = elementos.filter{elemento => elemento.image() == "flecha.png"}

	//DIVISION DE ESTAS SIENDO SALVADO de MUNDO
	override method termino(){self.moverse()}
	method fuisteSalvado() = self.listaSpot().isEmpty()
	
	// MOVIMIENTOS DE ANIMALES AL CUANDO SE SALVO	
	method moverse(){ elementos.forEach{ animal => animal.moverse() } }
	
}