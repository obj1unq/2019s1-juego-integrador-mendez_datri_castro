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
	
	method jugar() {self.sembrar(personaje)}
	method estasSiendoSalvado() {
		if (vida == 3){
			fuisteSalvado = true
			fondo.image("bosqueSano.jpg")
			mundo.elEcosistemaFueSalvadoSumarVida(self)
			mundo.irAPantallaInicial() 
		}
	}
	method image() = "sinArboles.jpg"
	method mensaje() = "Planta y riega arboles con la E"
	method sembrar(personaje) {keyboard.s().onPressDo{self.sembrarArbol(personaje)}}
	method sumarVida() { vida += 1}
	method sembrarArbol(personaje) {
		if (game.colliders(personaje).isEmpty() and personaje.ecosistemaActual() == self) {
			elementos.add(new Arbol())
			elementos.last().estasSiendoSembrado(personaje)
		}
	}
	method regarArbol(personaje)   {
		game.colliders(personaje).forEach({arbol => arbol.estasSiendoRegado()})
		self.estasSiendoSalvado()		
	}
	
}


