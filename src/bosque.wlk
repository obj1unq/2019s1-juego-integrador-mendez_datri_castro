import wollok.game.*
import fondo.*
import mundo.*
import personaje.*
import candado.*
import elementos.*
import ecosistema.*

//ECOSISTEMA BOSQUE
object bosque inherits Ecosistema{
	const property candado = new Candado(ecosistema = self, position =game.at(14,9))
	
	//POLIMORFICO CON FONDO
	method image()	{ 
		if(not self.fuisteSalvado()){
			return "sinArboles.jpg"
		} 
		else{ return "bosqueSano.jpg" }
	} 
	
	method mensaje() = "Planta con S y riega arboles con la E"
	
	//PARA SALVAR EL ECOSISTEMA
	override method fuisteSalvado()  = self.semillas().isEmpty()
	
	//PARA ELIMINAR TODOS
	override method elementos() = elementos.filter{semilla => semilla.fuePlantado()}
	


	//PARA INICIALIZAR EL JUEGO
	override method jugar(){
		self.crearElementos()
		self.sembrar(personaje)
	}
	
	//DIVISION DE JUGAR
	override method crearElementos() {
		elementos = [semilla1, semilla2, semilla3]
	}
	
	method sembrar(personaje) {keyboard.s().onPressDo{self.sembrarArbol(personaje)}}
	
	//DIVISION DE SEMBRAR
	method sembrarArbol(personaje) {
		if (game.colliders(personaje).isEmpty() and fondo.ecosistemaActual() == self and not self.semillasParaPlantar().isEmpty()) {
			self.semillaQueCorresponde().plantar(personaje)
		}
	}
	
	//DIVISION DE SEMBRAR ARBOL
	method semillaQueCorresponde() = self.semillasParaPlantar().first()
	
	//DIVISION DE SEMILLAS QUE CORRESPONDEN
	method semillasParaPlantar() = self.semillas().filter{semilla => not semilla.fuePlantado()}
	
	//DIVISION DE SEMILLAS PARA PLANTAR
	method semillas() = elementos.filter{arbol => not arbol.esAdulto()}
}


