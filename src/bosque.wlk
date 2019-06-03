import fondo.*
import wollok.game.*
import mundo.*
object bosque {
	var property position = game.at(0,0)
	var property vida = 0
	const property arbolesPlantados = []
	method sembrarYRegar(personaje) {
		keyboard.s().onPressDo 	  { 
			arbolesPlantados.add(new Arbol())
			personaje.sembrar(arbolesPlantados.last())
			
		}
		keyboard.r().onPressDo    { personaje.regar()}
	}
	method estasSiendoSalvado() {
		self.sumarVida()
		if (vida >= 3){
			fondo.image("bosqueSano.jpg")
			mundo.irAPantallaInicial()
		}
	}
	method sumarVida() { vida += 1}
	method eliminarArboles() {
		arbolesPlantados.forEach({arbol => game.removeVisual(arbol)})
	}
}

class Arbol {
	var property position
	var property image = "corn_baby.png"
	method estasSiendoSembrado(personaje) { game.addVisualIn(self, personaje.position()) }
	method estasSiendoRegado() { 
		image = "arbolSanoCHiquito.png"
		bosque.estasSiendoSalvado()					
	}
}
