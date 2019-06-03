import wollok.game.*
import mundo.*

object personaje {
	var property position = game.at(0,0)
	method image() = "player.png"
	method move(nuevaPosicion)	{
		position = nuevaPosicion 
		game.removeVisual(self)
		game.addVisual(self)
	}
	method sembrar(arbol) {
		arbol.estasSiendoSembrado(self)
	}
	
	method regar() {
		game.colliders(self).forEach({arbol => arbol.estasSiendoRegado()})
	}
}