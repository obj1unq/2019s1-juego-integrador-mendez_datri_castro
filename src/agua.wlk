import wollok.game.*
import fondo.*
import mundo.*
import personaje.*
import candado.*
import mugre.*

//ECOSISTEMA AGUA
object agua {
	var property position = game.at(0,0)
	var property elementos = []
	const property candado = new Candado(ecosistema = self, position = game.at(14,1))
	
	//POLIMORFICO CON FONDO
	method image()	{ 
		if(not self.fuisteSalvado()){
			return "fondoDeAgua.jpg"
		} 
		else{ return "aguaSalvada.jpg" }
	} 		
	method mensaje() = "Limpia la basura del oceano con la E"
	method jugar() {
		basura.aparecer()
		botella.aparecer()
		tablaDeComida.aparecer()
	}
	
	//DIVISION DE APARECER de MUGRE
	method agregarMugre(_mugre) {elementos.add(_mugre) } 
	
	//DIVISION DE ESTAS SIENDO SALVADO de MUNDO
	method fuisteSalvado()  = elementos.isEmpty()
	method termino() { /* No hace nada */ }
	method sacarMugre(_mugre) {
		game.removeVisual(_mugre)
		elementos.remove(_mugre)
	}
}
