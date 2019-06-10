import wollok.game.*
import personaje.*
import mundo.*
import nube.*
import fondo.*
import candado.*

//ECOSISTEMA CIUDAD
object ciudad {
	var property nubes = [ 	new Nube(position = game.at(4,2)), new Nube(position = game.at(15,9)),
							new Nube(position = game.at(6,10)), new Nube(position = game.at(2,8)),
							new Nube(position = game.at(9,6)), new Nube(position = game.at(14,2))
	]
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(8,7))
	
	
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
		fondo.image("ciudadSucia.png")
		self.agregarTodasLasNubes()
		game.say(mundo,"quita todas las nubes malas con la E")
	}
	method agregarTodasLasNubes(){
		self.activarNubes()
		nubes.forEach({ nube => game.addVisual(nube) })
	}
	method activarNubes(){
		nubes.forEach({ nube => nube.activar() })
	}

	//CAMBIO DE IMAGEN
	method estasSiendoSalvado() {
		if (self.nubesEstanDesactivadas()){
			fuisteSalvado = true
			fondo.image("ciudadLimpia.jpg")
			mundo.irAPantallaInicial()
			mundo.elEcosistemaFueSalvadoSumarVida(self)}
	}	
	method nubesEstanDesactivadas(){
		return nubes.all({ nube => not nube.estaActivada()})
	}
	
	//POR SI VUELVE A INICIO Y NO TERMINO EL MINIJUEGO
	method eliminarNubes() {
		self.nubesEnPantalla().forEach{nube => nube.estasSiendoProcesada()}
	}
	method nubesEnPantalla(){
		return nubes.filter({ nube => nube.estaActivada() })
	}
}
