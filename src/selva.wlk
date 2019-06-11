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
	
	//POLIMORFISMO
	method image() = "selva.jpg"
	method mensaje() = "Pon los animales en los lugares indicados con la E"
	method jugar(){ 
		elementos.add(spot1)
		elementos.add(spot2)
		elementos.add(spot3)
		elementos.add(spot4)
		elementos.forEach({spot => game.addVisual(spot)})
	}
	
	//DIVISION DE ESTAS INTERACTUANDO CON
	method estasSiendoSalvado() {
		if (self.listaSpot().isEmpty()) {
			fuisteSalvado = true
			self.moverse()
			mundo.irAPantallaInicial()
			mundo.elEcosistemaFueSalvadoSumarVida(self)
		}
	}
	method sacarSpot(spot)		 { elementos.remove(spot)}
	method agregarAnimal(animal) { elementos.add(animal)}
	
	//DIVISION DE ESTAS SIENDO SALVADO
	method listaSpot() = elementos.filter{elemento => elemento.image() == "flecha.png"}
	method moverse()	{elementos.forEach{animal => animal.moverse()}}
	
}