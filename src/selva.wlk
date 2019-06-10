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
	var property elementos = []
	//var property spots = []
	
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
		if (self.listaSpot().isEmpty()) {
			fuisteSalvado = true
			self.moverse()
			mundo.irAPantallaInicial()
			mundo.elEcosistemaFueSalvadoSumarVida(self)
		}
	}
//

method listaSpot() {
	return elementos.filter{elemento => elemento.image() == "flecha.png"}
}

	method ponerSpots(){ 
		elementos.add(spot1)
		elementos.add(spot2)
		elementos.add(spot3)
		elementos.add(spot4)
		elementos.forEach({spot => game.addVisual(spot)})
	}

	method sacarSpot(spot){elementos.remove(spot)}
	method agregarAnimal(animal) {elementos.add(animal)}
	method moverse(){elementos.forEach({animal => animal.moverse()})}
	method eliminarAnimales() {
		elementos.forEach({animal => game.removeVisual(animal)})
		elementos = []
	}
	method eliminarFlechas(){
		elementos.forEach({spot => game.removeVisual(spot)})
		elementos = []
	}
	
}