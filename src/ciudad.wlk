import wollok.game.*
import elementos.*
import candado.*
import ecosistema.*

//ECOSISTEMA CIUDAD
object ciudad inherits Ecosistema{
	const property candado = new Candado(ecosistema = self, position = game.at(8,7))
	
	//POLIMORFICO CON FONDO
	method image()	{ 
		if(not self.fuisteSalvado()){ return "ciudadSucia.png" } 
		else{ return "ciudadLimpia.jpg" }
	} 
	 
	//MENSAJE DE COMO JUGAR 
	method mensaje()= "Quita todas las nubes malas con la E"

	
	//DIVISION DE JUGAR
	override method crearElementos(){
	elementos =	[ 	new Elemento(image= "nubeNegra.png", position = game.at(4,2)), new Elemento(image= "nubeNegra.png", position = game.at(15,9)),
					new Elemento(image= "nubeNegra.png", position = game.at(6,10)), new Elemento(image= "nubeNegra.png", position = game.at(2,8)),
		 			new Elemento(image= "nubeNegra.png", position = game.at(9,6)), new Elemento(image= "nubeNegra.png", position = game.at(14,2)) ]
	}
}
