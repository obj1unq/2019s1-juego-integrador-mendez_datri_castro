import wollok.game.*
import fondo.*
import mundo.*
import personaje.*
import candado.*
import arbol.*
object bosque {
	var property position = game.at(0,0)
	var property vida = 0
	var property fuisteSalvado = false
	var property elementos = []
	const property candado = new Candado(ecosistema = self, position =game.at(14,9))
	
	//POLIMORFISMO 
	method jugar() {
		if (not fuisteSalvado) {
			
			self.inicializar()
			self.sembrar(personaje)
		}
		else {game.say(candado, "Ya jugaste este nivel")}
	}
	
	method inicializar() {
		fondo.sacarCandadosDePantalla()
		candado.estaCerrado(true)
		personaje.position(game.origin())
		fondo.image("sinArboles.jpg")
		game.say(mundo,"Planta y riega arboles con la E")
	}
	
	//PARA QUE NO SIEMBRE EN CUALQUIER LADO.
	method sembrar(personaje) {				
		keyboard.s().onPressDo 	  { //SIGUE SEMBRANDO DESPUES DE TERMINADO EL JUEGO
			self.sembrarArbol(personaje)
		}	
	}
	
	//CAMBIO DE IMAGEN
	method estasSiendoSalvado() {
		if (vida == 3){
			fuisteSalvado = true
			fondo.image("bosqueSano.jpg")
			mundo.elEcosistemaFueSalvadoSumarVida(self)
			mundo.irAPantallaInicial() 
		}
	}
	
	//DIVISION DE ESTAS SIENDO SALVADO.
	method sumarVida() { vida += 1}
	
	//PARA QUE LOS ARBOLES NO QUEDEN EN OTRA PANTALLA
	method eliminarArboles() {
		if (not elementos.isEmpty()){
			elementos.forEach({arbol => game.removeVisual(arbol)})
			elementos = []
		}
	}
	
	//DIVISION DE SEMBRAR
	method sembrarArbol(personaje) {
		if (game.colliders(personaje).isEmpty() and personaje.ecosistemaActual() == self) {
			elementos.add(new Arbol())
			elementos.last().estasSiendoSembrado(personaje)
		}
	}
	
	//DIVISION DE ESTAS INTERACTUANDO CON PERSONAJE
	method regarArbol(personaje)   {
		game.colliders(personaje).forEach({arbol => arbol.estasSiendoRegado()})
		self.estasSiendoSalvado()		
	}
	
}

