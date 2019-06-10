import wollok.game.*
import fondo.*
object personaje {
	var property position = game.at(0,0)
	method image() = "player.png"
	
	method move(nuevaPosicion)	{ position = nuevaPosicion }

//REGRESAR A INICIO
	method volverAInicio() {
		fondo.ponerInicioLimpio()
		self.position(game.origin())
	}
	
	method interactuar(){
		if (self.estaSobreUnObjeto()){
			self.objetoDebajo().estasInteractuandoCon(self)
		}
	}
	
	method estaSobreUnObjeto() = not game.colliders(self).isEmpty()
	method objetoDebajo() = game.colliders(self).head() //TIENE QUE TOCAR A TODOS
}