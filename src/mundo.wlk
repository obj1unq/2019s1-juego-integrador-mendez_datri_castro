import wollok.game.*
import fondo.*
import personaje.*
import bosque.*
object mundo {
	var aniosDeVida = 12
	var property position = game.at(1,0)
	method image() = if (aniosDeVida <= 12) {"mundoInicial.png"} else "mundoSegundo.png"
	method irAPantallaInicial() {
		game.say(self, "Apreta espacio para continuar")
	}
	
}



