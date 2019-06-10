import wollok.game.*
import personaje.*
import mundo.*
import animales.*
import fondo.*
import candado.*

//ECOSISTEMA SELVA
object selva {
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(4,4))
	const property animales = []
	const property spots = []
	
	//POLIMORFSMO
	method jugar() {
	if (not fuisteSalvado) {
			self.inicializar()
			self.ponerSpots()
		}
		else {game.say(candado, "Ya jugaste este nivel") candado.estaCerrado(true)}	
	}
	
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)
		personaje.position(game.origin())
		fondo.image("selva.jpg")
		game.say(mundo,"Pon los animales en los lugares indicados")
	}
	
	method estasSiendoSalvado() {
		if (spots.isEmpty()){
			fuisteSalvado = true
			self.moverse()
			mundo.irAPantallaInicial()
		}
	}
//

	method ponerSpots(){ 
		spots.add(spot1)
		spots.add(spot2)
		spots.add(spot3)
		spots.add(spot4)
		spots.forEach({spot => game.addVisual(spot)})
	}

	method sacarSpot(spot){spots.remove(spot)}
	method agregarAnimal(animal) {animales.add(animal)}
	method moverse(){animales.forEach({animal => animal.moverse()})}
	method eliminarAnimales() {
		animales.forEach({animal => game.removeVisual(animal)})
	}
	method eliminarFlechas(){
		spots.forEach({spot => game.removeVisual(spot)})
	}
	
}