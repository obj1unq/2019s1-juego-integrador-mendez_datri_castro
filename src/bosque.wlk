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
	
	method semillas() = elementos.filter{arbol => not arbol.esAdulto()}
	method semillasParaPlantar() = self.semillas().filter{semilla => not semilla.fuePlantado()}
	override method fuisteSalvado()  = self.semillas().isEmpty()
	//POLIMORFICO CON FONDO
	method image()	{ 
		if(not self.fuisteSalvado()){
			return "sinArboles.jpg"
		} 
		else{ return "bosqueSano.jpg" }
	} 

	override method crearElementos() {
		elementos = [semilla1, semilla2, semilla3]
	}

	method mensaje() = "Planta con S y riega arboles con la E"
	override method jugar(){
		self.crearElementos()
		self.sembrar(personaje)
	}
	
	//DIVISION DE JUGAR
	method sembrar(personaje) {keyboard.s().onPressDo{self.sembrarArbol(personaje)}}
	
	//DIVISION DE SEMBRAR
	method sembrarArbol(personaje) {
		if (game.colliders(personaje).isEmpty() and fondo.ecosistemaActual() == self) {
			self.semillaQueCorresponde().plantar(personaje)
		}
	}	
	
	//DIVISION DE SEMILLA QUE CORRESPONDE
	method semillaQueCorresponde(){
		return if (not self.semillasParaPlantar().isEmpty()){
			self.semillasParaPlantar().first()
		} else {
			game.say(personaje, "No me quedan semillas para plantar")
		}
	}
	


}


