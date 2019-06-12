import wollok.game.*
import personaje.*
import mundo.*
import nube.*
import fondo.*
import candado.*

//ECOSISTEMA CIUDAD
object ciudad {
	var property elementos = []
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(8,7))
	
	//POLIMORFICO CON FONDO
	method image()	= "ciudadSucia.png" 
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
	method quitar(nube){ elementos.remove(nube) }
	
	//DIVISION DE ESTAS SIENDO SALVADO de MUNDO
	method fuisteSalvado() = elementos.isEmpty()
	method termino() = 	fondo.image("ciudadLimpia.jpg")
}
