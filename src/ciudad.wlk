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
	elementos =	[ nube1, nube2, nube3, nube4, nube5, nube6 ]
	}
}
