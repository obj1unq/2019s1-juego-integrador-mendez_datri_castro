import wollok.game.*
import fondo.*
object personaje {
	var property position = game.at(0,0)
	var property ecosistemaActual = null
	method image() = "player.png"
	
	method move(nuevaPosicion)	{ position = nuevaPosicion }

	//REGRESAR A INICIO
	method volverAInicio() {
		fondo.ponerInicioLimpio()
		self.position(game.origin())
	}
	
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