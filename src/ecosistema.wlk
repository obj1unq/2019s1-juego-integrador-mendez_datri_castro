import wollok.game.*

class Ecosistema {
	var property position = game.at(0,0)
	var property elementos = []
	
	method termino(){}
	method fuisteSalvado()  = elementos.isEmpty()
	method quitar(elemento){
		game.removeVisual(elemento)
		elementos.remove(elemento)
	}
	method agregar(elemento){
		elementos.add(elemento)
		game.addVisual(elemento)
	}
}
