import wollok.game.*
import mundo.*

object personaje {
	var property position = game.at(0,0)
	method image() = "player.png"
	method move(nuevaPosicion)	{
		position = nuevaPosicion 
		mundo.sumarAniosDeVida()
		game.removeVisual(self)
		game.addVisual(self)
	}
		
}
	


