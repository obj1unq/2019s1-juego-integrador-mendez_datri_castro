import fondo.*
import wollok.game.*
import mundo.*
import personaje.*
import candado.*
import mugre.*
import animales.*

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
		game.say(mundo,"Planta con la P y riega arboles con la R")
	}
	
	//PARA QUE NO SIEMBRE EN CUALQUIER LADO.
	method sembrarYRegar(personaje) {
		keyboard.s().onPressDo 	  { //SIGUE SEMBRANDO DESPUES DE TERMINADO EL JUEGO
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
	
	//DIVISION DE JUGAR (POLIMORFICO)
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)		
		personaje.position(game.origin())
		fondo.image("fondoDeAgua.jpg")
		game.say(mundo,"Limpia la basura del oceano con la L")
	}
	
	//PARA JUGAR
	method suciedadEnAgua() { //Como hacerlo mejor?
		basura.aparecer()
		botella.aparecer()
		tablaDeComida.aparecer()
		keyboard.l().onPressDo { self.limpiarAgua(personaje) }
	}
	
	//DIVISION DE SUCIEDAD EN AGUA
	method agregarMugre(_mugre) {mugres.add(_mugre) } 
	method sacarMugre(_mugre) {mugres.remove(_mugre) } 
	method limpiarAgua(personaje) {
		game.colliders(personaje).forEach{mugre => mugre.estasSiendoLimpiada()}
		self.estasSiendoSalvado()
	}
	
	//DIVISION DE LIMPIAR AGUA
	method estasSiendoSalvado() {
		if (mugres.size() == 0){
			fuisteSalvado = true
			mundo.irAPantallaInicial()
		}
	}
	
	//POR si se vuelve al inicio
	method eliminarMugre() {	
		if(not mugres.isEmpty()) {
		mugres.forEach{mugre => game.removeVisual(mugre)}
		mugres = []
		}
	}
}

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
			self.teclas()
		}
		else {game.say(candado, "Ya jugaste este nivel") candado.estaCerrado(true)}	
	}
	
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)
		personaje.position(game.origin())
		fondo.image("selva.jpg")
		game.say(mundo,"Pon los animales en los lugares indicados con la tecla d")
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
	method teclas() {
		keyboard.d().onPressDo{ self.ponerAnimal()}
	}
	method ponerAnimal(){
		if (self.estaSobreUnSpot()){
			game.addVisual(self.animalCorrespondiente())
			game.removeVisual(self.spotActual())
			spots.remove(self.spotActual())
			self.estasSiendoSalvado()
		}
	}
	method estaSobreUnSpot() = game.colliders(personaje).any({collider => spots.contain(collider)})
	method animalCorrespondiente() = self.spotActual().animalCorrespondiente()
	method spotActual() = game.colliders(personaje).find({collider => spots.contains(collider)})
	method moverse(){animales.forEach({animal => animal.moverse()})}
	method eliminarAnimales() {
		animales.forEach({animal => game.removeVisual(animal)})
	
	}
	
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
