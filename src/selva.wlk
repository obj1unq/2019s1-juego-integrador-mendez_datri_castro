import wollok.game.*
import animales.*
import candado.*
import ecosistema.*
  
//ECOSISTEMA SELVA
object selva inherits Ecosistema{
	const property candado = new Candado(ecosistema = self, position = game.at(4,4))
	
	//POLIMORFICO CON EL FONDO
	method image(){ return "selva.jpg" } 
	method mensaje() = "Pon los animales en los lugares indicados con la E"
	
	//DIVISION DE JUGAR
	override method crearElementos(){
		elementos = [spot1, spot2, spot3, spot4]
	}

	//DIVISION DE ESTAS SIENDO SALVADO
	method listaSpot() = elementos.filter{elemento => elemento.image() == "flecha.png"}

	//DIVISION DE ESTAS SIENDO SALVADO de MUNDO
	method termino(){self.moverse()}
	override method fuisteSalvado() = self.listaSpot().isEmpty()
	
	// MOVIMIENTOS DE ANIMALES AL CUANDO SE SALVO	
	method agregar(elemento){
		elementos.add(elemento)
		game.addVisual(elemento)
	}
	
	method moverse(){ elementos.forEach{ animal => animal.moverse() } }
	
}