import fondo.*
import wollok.game.*
import mundo.*
import personaje.*

//ECOSISTEMA BOSQUE
object bosque {
	var property position = game.at(0,0)
	var property vida = 0
	const property arbolesPlantados = []
	method jugar() {
		fondo.image("sinArboles.jpg") 
		self.sembrarYRegar(personaje)
		
	}
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
	method fuisteChocadaPor(personaje) {}
}

//ECOSISTEMA DESIERTO
object desierto {
	
}

//ECOSISTEMA AGUA
object agua {
	
}

//ECOSISTEMA SELVA
object selva {
	
}

//ECOSISTEMA NIEVE
object nieve {
	
}

//ECOSISTEMA CIUDAD
object ciudad {
	
}
