import wollok.game.*
import mundo.*
import candado.*
object personaje {
	var property position = game.at(0,0)
	method image() = "player.png"
	method move(nuevaPosicion)	{ position = nuevaPosicion }
	
	//PARA EL BOSQUE
	method sembrar(arbol) { arbol.estasSiendoSembrado(self) }
	method regar() { game.colliders(self).forEach({arbol => arbol.estasSiendoRegado()}) }
}