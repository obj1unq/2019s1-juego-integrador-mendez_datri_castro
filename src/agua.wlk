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
	method image() 	 = "fondoDeAgua.jpg"		
	method mensaje() = "Limpia la basura del oceano con la E"
	method jugar() {
		basura.aparecer()
		botella.aparecer()
		tablaDeComida.aparecer()
		botellaArena.aparecer()
	}
	
	//DIVISION DE APARECER de MUGRE
	method agregarMugre(_mugre) {elementos.add(_mugre) } 
	
	//DIVISION DE ESTAS SIENDO SALVADO de MUNDO
	method fuisteSalvado()  = elementos.isEmpty()
	method termino() 		= fondo.image("aguaSalvada.jpg")
	method sacarMugre(_mugre) {elementos.remove(_mugre)}
}
