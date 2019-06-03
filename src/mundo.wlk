import wollok.game.*
import fondo.*
import personaje.*
object mundo {
	var aniosDeVida = 12
	var property position = game.at(1,0)
	method image() = if (aniosDeVida <= 18) {"mundoInicial.png"} else "mundoSegundo.png"
	
	//VOLVER A PANTALLA INICIAL al finalizar el juego.
	method irAPantallaInicial() {
		game.say(self, "GRACIAS! Apreta espacio para continuar")
		aniosDeVida ++
	}
	
	//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {
		game.say(self, "Ayudame a salvar el planeta para ello")
	}
}



