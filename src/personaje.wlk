import wollok.game.*
import fondo.*
object personaje {
	var property position = game.at(0,0)
	method image() = "player.png"
	
	//MOVIMIENTO EL PERSONAJE
	method move(nuevaPosicion)	{ position = nuevaPosicion }

	//PAR USAR LA E
	method interactuar(){
		if (self.estaSobreUnObjeto()){
			self.objetoDebajo().estasInteractuandoCon(self)
		}
	}
	
	//DIVISION DE INTERACTUAR
	method estaSobreUnObjeto() = not game.colliders(self).isEmpty()
	method objetoDebajo() = game.colliders(self).head()
}