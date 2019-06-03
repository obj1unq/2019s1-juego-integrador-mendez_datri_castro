import wollok.game.*
import fondo.*
import personaje.*
import bosque.*
import mundo.*
object borrador {
	method setear(){
	fondo.image("ecosistemaFondo1.png")	
	game.addVisual(fondo)
	game.addVisual(personaje)
	game.addVisual(mundo)
	keyboard.up().onPressDo   { personaje.move(personaje.position().up(1)) }
	keyboard.down().onPressDo { personaje.move(personaje.position().down(1)) }
	keyboard.left().onPressDo { personaje.move(personaje.position().left(1)) }
	keyboard.right().onPressDo{ personaje.move(personaje.position().right(1)) }
	keyboard.m().onPressDo 	  {	game.say(mundo, "Ayudame a salvar el planeta para ello")}
	keyboard.b().onPressDo 	  { fondo.image("sinArboles.jpg") 
								bosque.sembrarYRegar(personaje)
	}
	keyboard.space().onPressDo {
		game.clear()
		self.setear()
	}
	}
}
