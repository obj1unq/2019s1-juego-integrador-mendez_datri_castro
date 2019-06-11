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
	var property fuisteSalvado = false
	const property candado = new Candado(ecosistema = self, position = game.at(14,1))
	
	//POLIMORFISMO 
	method image() = "fondoDeAgua.jpg"		
	method mensaje() = "Limpia la basura del oceano con la E"
	method jugar() {
		basura.aparecer()
		botella.aparecer()
		tablaDeComida.aparecer()
	}
	
	//DIVISION DE SUCIEDAD EN AGUA
	method agregarMugre(_mugre) {elementos.add(_mugre) } 
	method sacarMugre(_mugre) {elementos.remove(_mugre) } 
	
	//DIVISION DE ESTAS INTERACTUANDO CON
	method estasSiendoSalvado() {
		if (elementos.size() == 0){
			fuisteSalvado = true
			mundo.irAPantallaInicial()
			mundo.elEcosistemaFueSalvadoSumarVida(self)
		}
	}
}
