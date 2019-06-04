import fondo.*
import wollok.game.*
import mundo.*
import personaje.*
import candado.*
import mugre.*
//ECOSISTEMA BOSQUE
object bosque {
	var property position = game.at(0,0)
	var property vida = 0
	const property arbolesPlantados = []
	
	//POLIMORFISMO 
	method jugar() {
		self.inicializar()
		self.sembrarYRegar(personaje)
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("sinArboles.jpg")
		game.say(mundo,"Planata y riega arboles")
	}
	//PARA QUE NO SIEMBRE EN CUALQUIER LADO.
	method sembrarYRegar(personaje) {
		keyboard.s().onPressDo 	  { 
			arbolesPlantados.add(new Arbol())
			self.sembrarArbol(personaje)
		}	
		keyboard.r().onPressDo    {  }
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
	
	//DIVISION DE SEMBRAR Y REGAR
	method sembrarArbol(personaje) {arbolesPlantados.last().estasSiendoSembrado(personaje)}
	method regarArbol(personaje)   {game.colliders(personaje).forEach({arbol => arbol.estasSiendoRegado()})}
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
		method jugar() {
		self.inicializar()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
}

//ECOSISTEMA AGUA
object agua {
	var property position = game.at(0,0)
	var cantidadDeMugre = 0
	
	//POLIMORFISMO 		
	method jugar() {
		self.inicializar()
		self.suciedadEnAgua()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("fondoDeAgua.jpg")
		game.say(mundo,"Recoleta la basura del oceano")
	}
	method estasSiendoSalvado() {
		if (cantidadDeMugre == 0){
			mundo.irAPantallaInicial()
		}
	}
	method suciedadEnAgua() {
		basura.aparecer()
		botella.aparecer()
		tablaDeComida.aparecer()
	}
	method agregarMugre() {cantidadDeMugre ++}
	method sacarMugre() {cantidadDeMugre --}
}

//ECOSISTEMA SELVA
object selva {
	method jugar() {
		self.inicializar()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
}

//ECOSISTEMA NIEVE
object nieve {
	method jugar() {
		self.inicializar()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
}

//ECOSISTEMA CIUDAD
object ciudad {
	method jugar() {
		self.inicializar()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
}
