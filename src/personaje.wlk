import wollok.game.*
import mundo.*
import candado.*
import ecosistemas.*
import fondo.*
object personaje {
	var property position = game.at(0,0)
	method image() = "player.png"
	
	method move(nuevaPosicion)	{ position = nuevaPosicion }

//REGRESAR A INICIO
	method volverAInicio() {
		fondo.ponerInicioLimpio()
		self.position(game.origin())
		mundo.elEcosistemaFueSalvadoSumarVida(agua)
		mundo.elEcosistemaFueSalvadoSumarVida(bosque)
	}
}