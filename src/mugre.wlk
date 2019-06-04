import wollok.game.*
import ecosistemas.*
class Mugre {
	var property position
	var property image
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) { 
		game.removeVisual(self)
		agua.sacarMugre()
		agua.estasSiendoSalvado()
	}
	
	// PARA EL JUGAR DEL ECOSISTEMA
	method aparecer() {
		game.addVisual(self)
		self.moverse()
		agua.agregarMugre()	
	}
	
	method desaparecer() {
		game.removeVisual(self)
	}
	// DIVISION DEL APARECER
	method moverse() {
		game.onTick(2000, "mugreMoviendose", {=> self.move(self.position().right(1))})
		game.onTick(1500, "mugreMoviendose", {=> self.move(self.position().left(1))})
	}
	
	//DIVISION DEL MOVERSE
	method move(nuevaPosicion)	{ position = nuevaPosicion }
}

class Basura inherits Mugre {
	override method position() = game.at(10,4) 
	override method image() = "basura1.png"
}

class TablaDeComida inherits Mugre {
	override method position() = game.at(15,4) 
	override method image() = "basura2.png"
}

class Botella inherits Mugre {
	override method position() = game.at(13,3)
	override method image() = "basura3.png"
	
override	method moverse() {
		game.onTick(2000, "botellaMoviendose", {=> self.move(self.position().right(1))})
		game.onTick(1500, "botellaMoviendose", {=> self.move(self.position().left(1))})
	}

}