import wollok.game.*
import ecosistemas.*
object basura {
	var property position = game.at(10,4)
	var property image = "basura1.png"
	
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
	
	// DIVISION DEL APARECER
	method moverse() {
		game.onTick(2000, "basuraMoviendose", {=> self.move(self.position().right(1))})
		game.onTick(1500, "basuraMoviendose", {=> self.move(self.position().left(1))})
	}
	
	//DIVISION DEL MOVERSE
	method move(nuevaPosicion)	{ position = nuevaPosicion }
}

object tablaDeComida {
	var property position = game.at(15,4)
	var property image = "basura2.png"
	
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
	
	// DIVISION DEL APARECER
	method moverse() {
		game.onTick(1500, "botellaMoviendose", {=> self.move(self.position().right(1))})
		game.onTick(2000, "botellaMoviendose", {=> self.move(self.position().left(1))})
	}
	
	//DIVISION DEL MOVERSE
	method move(nuevaPosicion)	{ position = nuevaPosicion }
}

object botella {
	var property position = game.at(13,3)
	var property image = "basura3.png"
	
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
	
	// DIVISION DEL APARECER
	method moverse() {
		game.onTick(2000, "botellaMoviendose", {=> self.move(self.position().right(1))})
		game.onTick(1500, "botellaMoviendose", {=> self.move(self.position().left(1))})
	}
	
	//DIVISION DEL MOVERSE
	method move(nuevaPosicion)	{ position = nuevaPosicion }
}