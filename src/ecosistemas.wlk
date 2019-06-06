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
	const property candado = new Candado(ecosistema = self, position =game.at(14,9))
	//POLIMORFISMO 
	method jugar() {
		if (not fuisteSalvado) {
			self.inicializar()
			self.sembrarYRegar(personaje)
		}
		else {game.say(candado, "Ya jugaste este nivel")}
	}
	
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)
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
		if (vida >= 3)
			fuisteSalvado = true
			fondo.image("bosqueSano.jpg")
			mundo.irAPantallaInicial() 
	}
	
	//DIVISION DE ESTAS SIENDO SALVADO.
	method sumarVida() { vida += 1}
	
	//PARA QUE LOS ARBOLES NO QUEDEN EN OTRA PANTALLA
	method eliminarArboles() {
		if (not arbolesPlantados.isEmpty())
			arbolesPlantados.forEach({arbol => game.removeVisual(arbol)}) 
	}
	
	//DIVISION DE SEMBRAR Y REGAR
	method sembrarArbol(personaje) {arbolesPlantados.last().estasSiendoSembrado(personaje)}
	method regarArbol(personaje)   {
		game.colliders(personaje).forEach({arbol => arbol.estasSiendoRegado()})
		self.estasSiendoSalvado()		
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
		bosque.sumarVida()			
	}
	
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) { /* No hace nada */}
}

//ECOSISTEMA DESIERTO
object desierto {
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(0,3))
	
	//POLIMORFISMO 		
	method jugar() {
		if (not fuisteSalvado) {
			self.inicializar()
		}
		
		else {game.say(candado, "Ya jugaste este nivel")}	
	}
	
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
	
	method estasSiendoSalvado() {
		if ("algo" == "algo"){
			fuisteSalvado = true
			mundo.irAPantallaInicial()
		}
	}
}

//ECOSISTEMA AGUA
object agua {
	var property position = game.at(0,0)
	var mugres = []
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(14,1))
	
	//POLIMORFISMO 		
	method jugar() {
		if (not fuisteSalvado) {
			self.inicializar()
			self.suciedadEnAgua()
		}
		else {game.say(candado, "Ya jugaste este nivel")}	 
	}
	
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)		
		personaje.position(game.origin())
		fondo.image("fondoDeAgua.jpg")
		game.say(mundo,"Recoleta la basura del oceano")
	}
	
	method estasSiendoSalvado() {
		if (mugres.size() == 0)
			fuisteSalvado = true
			mundo.irAPantallaInicial()
	}
	
	//PARA JUGAR
	method suciedadEnAgua() {
		basura.aparecer()
		botella.aparecer()
		tablaDeComida.aparecer()
	}
	
	//DIVISION DE SUCIEDAD EN AGUA
	method agregarMugre(_mugre) {mugres.add(_mugre)} 
	method sacarMugre(_mugre) {mugres.remove(_mugre)} 
	
	//POR si se vuelve al inicio
	method eliminarMugre() {	
		if(not mugres.isEmpty()) 
		mugres.forEach{mugre => game.removeVisual(mugre)}
		mugres = []
	}
}

//ECOSISTEMA SELVA
object selva {
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(4,4))
	const property animales = []
	const property spots = []
//							new Spot(position = game.at(4, 4)), 
//							new Spot(position = game.at(8, 2)), 
//							new Spot(position = game.at(2, 8)), 
//							new Spot(position = game.at(9, 9))]	
	//POLIMORFSMO
	method jugar() {
	if (not fuisteSalvado) {
			self.inicializar()
			self.ponerSpots()
			self.teclas()
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
		if (spots.isEmpty())
			fuisteSalvado = true
			self.moverse()
			mundo.irAPantallaInicial()
			
	}
	method ponerSpots(){
		spots.forEach({spot => game.addVisual(spot)})
	}
	method teclas() {
		keyboard.d().onPressDo{
			self.ponerAnimal()
		}
	}
	method ponerAnimal(){
		if (self.estaSobreUnSpot(personaje)){
			game.addVisualIn(self.spotBajo(personaje), personaje.position())
			game.removeVisual(self.spotBajo(personaje))
			spots.remove(self.spotBajo(personaje))
		}
	}
	method estaSobreUnSpot(personaje) = personaje.colliders().any({collider => spots.contain(collider)})
	method spotBajo(personaje) = personaje.colliders().filter({collider => spots.contains(collider)}).head()
	method moverse(){animales.forEach({animal => animal.moverse()})}
	
}

//ECOSISTEMA NIEVE
object nieve {
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(0,3))
	
	//POLIMORFSMO
	method jugar() {
		if (not fuisteSalvado) {
			self.inicializar()
		}
		else {game.say(candado, "Ya jugaste este nivel")}	
	}
	
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
	
	method estasSiendoSalvado() {
		if ("algo" == "algo")
			mundo.irAPantallaInicial()
			fuisteSalvado = true
	}
}

//ECOSISTEMA CIUDAD
object ciudad {
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(0,3))
	
	//POLIMORFSMO
	method jugar() {
		if (not fuisteSalvado) {
			self.inicializar()
		}
		else {game.say(candado, "Ya jugaste este nivel")}	
	}
	
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)
		personaje.position(game.origin())
		fondo.image("")
		game.say(mundo,"")
	}
	
	method estasSiendoSalvado() {
		if ("algo" == "algo")
			mundo.irAPantallaInicial()
			fuisteSalvado = true
	}
}
