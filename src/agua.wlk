import wollok.game.*
import fondo.*
import mundo.*
import personaje.*
import candado.*
import mugre.*
//ECOSISTEMA AGUA
object agua {
	var property position = game.at(0,0)
	var property mugres = []
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
		game.say(mundo,"Limpia la basura del oceano con la E")
	}
	
	//PARA JUGAR
	method suciedadEnAgua() { //Como hacerlo mejor?
		basura.aparecer()
		botella.aparecer()
		tablaDeComida.aparecer()
	}
	
	method estasInteractuandoCon(personaje) {
		self.limpiarAgua(personaje)
	}
	//DIVISION DE SUCIEDAD EN AGUA
	method agregarMugre(_mugre) {mugres.add(_mugre) } 
	method sacarMugre(_mugre) {mugres.remove(_mugre) } 
	method limpiarAgua(personaje) {
		game.colliders(personaje).forEach{mugre => mugre.estasSiendoLimpiada()}

	}
	
	//DIVISION DE LIMPIAR AGUA
	method estasSiendoSalvado() {
		if (mugres.size() == 0){
			fuisteSalvado = true
			mundo.irAPantallaInicial()
			mundo.elEcosistemaFueSalvadoSumarVida(self)
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
