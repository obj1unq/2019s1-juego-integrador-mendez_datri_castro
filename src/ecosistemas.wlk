import fondo.*
import wollok.game.*
import mundo.*
import personaje.*

//ECOSISTEMA BOSQUE
object bosque {
	var property position = game.at(0,0)
	var property vida = 0
	const property arbolesPlantados = []
	
	//POLIMORFISMO 
	method jugar() {
		fondo.image("sinArboles.jpg") 
		self.sembrarYRegar(personaje)
		
	}
	
	//PARA QUE NO SIEMBRE EN CUALQUIER LADO.
	method sembrarYRegar(personaje) {
		keyboard.s().onPressDo 	  { 
			arbolesPlantados.add(new Arbol())
			personaje.sembrar(arbolesPlantados.last())
		}	
		keyboard.r().onPressDo    { personaje.regar()}
	}
	
	//CAMBIO DE IMAGEN
	method estasSiendoSalvado() {
		self.sumarVida()
		if (vida >= 3){
			fondo.image("bosqueSano.jpg")
			mundo.irAPantallaInicial()
		}
	}
	
	//DIVISION DE ESTAS SIENDO SALVADO.
	method sumarVida() { vida += 1}
	
	//PARA QUE LOS ARBOLES NO QUEDEN EN OTRA PANTALLA
	method eliminarArboles() {
		arbolesPlantados.forEach({arbol => game.removeVisual(arbol)})
	}
}
// PARA EL BOSQUE
class Arbol {
	var property position
	var property image = "corn_baby.png"
	
	// DIVISION DE SEMBRAR DEL PERSONAJE
	method estasSiendoSembrado(personaje) { game.addVisualIn(self, personaje.position()) }
	
	// DIVISION DE REGAR DEL PERSONAJE
	method estasSiendoRegado() { 
		image = "arbolSanoCHiquito.png"
		bosque.estasSiendoSalvado()					
	}
	
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) { /* No hace nada */}
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
