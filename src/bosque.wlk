import wollok.game.*
import fondo.*
import mundo.*
import personaje.*
import candado.*
import arbol.*

//ECOSISTEMA BOSQUE
object bosque {
	var property position = game.at(0,0)
	var property vida = 0
	var property fuisteSalvado = false
	var property elementos = []
	const property candado = new Candado(ecosistema = self, position =game.at(14,9))
	
	//POLIMORFICO CON FONDO
	method image() 	 = "sinArboles.jpg"
	method mensaje() = "Planta con S y riega arboles con la E"
	method jugar() {self.sembrar(personaje)}
	
	//DIVISION DE JUGAR
	method sembrar(personaje) {keyboard.s().onPressDo{self.sembrarArbol(personaje)}}
	
	//DIVISION DE SEMBRAR
	method sembrarArbol(personaje) {
		if (game.colliders(personaje).isEmpty() and personaje.ecosistemaActual() == self) {
			elementos.add(new Arbol())
			elementos.last().estasSiendoSembrado(personaje)
		}
	}
	
	//DIVISION DE ESTAS SIENDO REGADA de ARBOL
	method sumarVida() { vida += 1}
	
	//DIVISION DEL ESTAS INTERACTUANDO CON de ARBOL
	method fuisteSalvado() = vida == 3
	method termino(){fondo.image("bosqueSano.jpg")}
	
}


