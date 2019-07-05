import wollok.game.*
import personaje.*
import mundo.*
import nube.*
import fondo.*
import candado.*
import ecosistema.*

//ECOSISTEMA CIUDAD
object ciudad inherits Ecosistema{
	const property candado = new Candado(ecosistema = self, position = game.at(8,7))
	
	//POLIMORFICO CON FONDO
	method image()	{ 
		if(not self.fuisteSalvado()){
			return "ciudadSucia.png"
		} 
		else{ return "ciudadLimpia.jpg" }
	} 
	
	
	method mensaje()= "Quita todas las nubes malas con la E"
	method jugar(){
		self.todasLasNubes()
		elementos.forEach({ nube => game.addVisual(nube) })
	}
	
	//DIVISION DE JUGAR
	method todasLasNubes(){
	elementos =	[ 	new Nube(position = game.at(4,2)), new Nube(position = game.at(15,9)),
					new Nube(position = game.at(6,10)), new Nube(position = game.at(2,8)),
		 			new Nube(position = game.at(9,6)), new Nube(position = game.at(14,2)) ]
	}
	
	//DIVISION DE ESTAS SIENDO PROCESADA de NUBE
	method quitar(nube){ 
		game.removeVisual(nube)
		elementos.remove(nube)
	}
	
	//DIVISION DE ESTAS SIENDO SALVADO de MUNDO
	method fuisteSalvado() = elementos.isEmpty()
	method termino() { /* No hace nada */ }
}
