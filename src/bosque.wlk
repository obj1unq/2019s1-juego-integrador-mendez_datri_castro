import wollok.game.*
import fondo.*
import mundo.*
import personaje.*
import candado.*
import arbol.*
import ecosistema.*

//ECOSISTEMA BOSQUE
object bosque inherits Ecosistema{
	var property vida = 0
	const property candado = new Candado(ecosistema = self, position =game.at(14,9))
	
	//POLIMORFICO CON FONDO
	method image()	{ 
		if(not self.fuisteSalvado()){
			return "sinArboles.jpg"
		} 
		else{ return "bosqueSano.jpg" }
	} 
	method mensaje() = "Planta con S y riega arboles con la E"
	method jugar() {
		vida = 0
		self.sembrar(personaje)
	}
	
	//DIVISION DE JUGAR
	method sembrar(personaje) {keyboard.s().onPressDo{self.sembrarArbol(personaje)}}
	
	//DIVISION DE SEMBRAR
	method sembrarArbol(personaje) {
		if (game.colliders(personaje).isEmpty() and fondo.ecosistemaActual() == self) {
			elementos.add(new Arbol())
			elementos.last().estasSiendoSembrado(personaje)
		}
	}
	
	//DIVISION DE ESTAS SIENDO REGADA de ARBOL
	method sumarVida() { vida += 1}
	
	//DIVISION DEL ESTAS INTERACTUANDO CON de ARBOL
	override method fuisteSalvado() = vida >= 3

	
}


