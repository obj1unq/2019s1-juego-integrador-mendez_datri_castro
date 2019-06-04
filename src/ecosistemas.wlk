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
	var property fuisteSalvado = false
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
		keyboard.r().onPressDo    { self.regarArbol(personaje)}
	}
	
	//CAMBIO DE IMAGEN
	method estasSiendoSalvado() {
		self.sumarVida()
		if (vida < 3){
			fuisteSalvado = true
			fondo.image("bosqueSano.jpg")
			mundo.irAPantallaInicial(self) 
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
	var property fuisteSalvado = false
	method jugar() {
		self.inicializar()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
	method estasSiendoSalvado() {
		if ("algo" == "algo"){
			fuisteSalvado = true
			mundo.irAPantallaInicial(self)
		}
	}
}

//ECOSISTEMA AGUA
object agua {
	var property position = game.at(0,0)
	var cantidadDeMugre = 0
	var property fuisteSalvado = false
	
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
			fuisteSalvado = true
			mundo.irAPantallaInicial(self)
		}
	}
	method suciedadEnAgua() {
		new Basura().aparecer()
		new Botella().aparecer()
		new TablaDeComida().aparecer()
	}
	method agregarMugre() {cantidadDeMugre ++}
	method sacarMugre() {cantidadDeMugre --}
//	method sacarTodaLaMugre() {	
//		new Basura().desaparecer()
//		new Botella().desaparecer()
//		new TablaDeComida().desaparecer()
//	}
}

//ECOSISTEMA SELVA
object selva {
	var property fuisteSalvado = false
	method jugar() {
		self.inicializar()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
		method estasSiendoSalvado() {
		if ("algo" == "algo"){
			mundo.irAPantallaInicial(self)
			fuisteSalvado = true
		}
	}
}

//ECOSISTEMA NIEVE
object nieve {
	var property fuisteSalvado = false
	method jugar() {
		self.inicializar()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
	method estasSiendoSalvado() {
		if ("algo" == "algo"){
			mundo.irAPantallaInicial(self)
			fuisteSalvado = true
		}
	}
}

//ECOSISTEMA CIUDAD
object ciudad {
	var property fuisteSalvado = false
	method jugar() {
		self.inicializar()
	}
	method inicializar() {
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
	method estasSiendoSalvado() {
		if ("algo" == "algo"){
			mundo.irAPantallaInicial(self)
			fuisteSalvado = true
		}
	}
}
