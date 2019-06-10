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

	method image(){ return "ciudadSucia.png" }
	method mensaje(){
		return "quita todas las nubes malas con la E"
	}
	method quitar(nube){
		elementos.remove(nube)
	}
	method jugar(){
		self.todasLasNubes()
		elementos.forEach({ nube => game.addVisual(nube) })
	}
	method todasLasNubes(){
	elementos =	[ 	new Nube(position = game.at(4,2)), new Nube(position = game.at(15,9)),
					new Nube(position = game.at(6,10)), new Nube(position = game.at(2,8)),
		 			new Nube(position = game.at(9,6)), new Nube(position = game.at(14,2)) ]
	}	
	//CAMBIO DE IMAGEN
	method estasSiendoSalvado() {
		if (elementos.isEmpty()){
			fuisteSalvado = true
			fondo.image("ciudadLimpia.jpg")
			mundo.irAPantallaInicial()
			mundo.elEcosistemaFueSalvadoSumarVida(self)}
	}	

	
}
