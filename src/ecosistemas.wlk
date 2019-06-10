import fondo.*
import wollok.game.*
import mundo.*
import personaje.*
import candado.*

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
	




