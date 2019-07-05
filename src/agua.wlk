import wollok.game.*
import candado.*
import mugre.*
import ecosistema.*

//ECOSISTEMA AGUA
object agua inherits Ecosistema{
	const property candado = new Candado(ecosistema = self, position = game.at(14,1))
	
	//POLIMORFICO CON FONDO
	method image()	{ 
		if(not self.fuisteSalvado()){ return "fondoDeAgua.jpg" } 
		else{ return "aguaSalvada.jpg" }
	}
	
	//MENSAJE DE COMO JUGAR  		
	method mensaje() = "Limpia la basura del oceano con la E"
	
	//DIVISION DE APARECER de MUGRE
	override method crearElementos() {
		elementos = [basura, botella, tablaDeComida]
	}
	override method agregarElementos() {
		super()
		elementos.forEach({ mugre => mugre.moverse() }) 
	}
}
