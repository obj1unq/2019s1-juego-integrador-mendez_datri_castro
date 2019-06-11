import wollok.game.*
import personaje.*
import mundo.*
import animales.*
import fondo.*
import candado.*

object selva {
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(4,4))
	var property elementos = []

	method jugar(){ 
		elementos.add(spot1)
		elementos.add(spot2)
		elementos.add(spot3)
		elementos.add(spot4)
		elementos.forEach({spot => game.addVisual(spot)})
	}
	method estasSiendoSalvado() {
		if (self.listaSpot().isEmpty()) {
			fuisteSalvado = true
			self.moverse()
			mundo.irAPantallaInicial()
			mundo.elEcosistemaFueSalvadoSumarVida(self)
		}
	}
	method image() = "selva.jpg"
	method mensaje() = "Pon los animales en los lugares indicados con la E"
	method listaSpot() = elementos.filter{elemento => elemento.image() == "flecha.png"}
	method sacarSpot(spot){elementos.remove(spot)}
	method agregarAnimal(animal) {elementos.add(animal)}
	method moverse(){elementos.forEach({animal => animal.moverse()})}
	
}