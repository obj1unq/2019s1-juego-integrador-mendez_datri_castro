import wollok.game.*
import fondo.*
import mundo.*
import personaje.*
import candado.*
import mugre.*
import ecosistema.*

//ECOSISTEMA AGUA
object agua inherits Ecosistema{
	const property candado = new Candado(ecosistema = self, position = game.at(14,1))
	
	//POLIMORFICO CON FONDO
	method image()	{ 
		if(not self.fuisteSalvado()){
			return "fondoDeAgua.jpg"
		} 
		else{ return "aguaSalvada.jpg" }
	} 		
	method mensaje() = "Limpia la basura del oceano con la E"
	
	//DIVISION DE APARECER de MUGRE
	override method crearElementos() {
		elementos = [basura, botella, tablaDeComida]
	}
	override method agregarElementos(){
		elementos.forEach({ mugre => game.addVisual(mugre) })
		elementos.forEach({ mugre => mugre.moverse() }) 
	}

	//DIVISION DE ESTAS SIENDO SALVADO de MUNDO
	
}
