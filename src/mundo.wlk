import wollok.game.*
import fondo.*
import personaje.*
import candado.*
import ecosistemas.*
object mundo {
	var aniosDeVida = 12
	var property position = game.at(1,0)
	var property candados = []
	method image() = if (aniosDeVida <= 15) {"mundoInicial.png"} else "mundoSegundo.png"
	
	//VOLVER A PANTALLA INICIAL al finalizar el juego.
	method irAPantallaInicial(ecosistema) {
	if (ecosistema.fuisteSalvado())
		game.say(self, "GRACIAS! Apreta espacio para continuar")
		aniosDeVida ++
	}
	
	//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {
		game.say(self, "Ayudame a salvar el planeta")
	}
	
	//FINAL
	method meSalvaste() {
		if (aniosDeVida == 15)	{game.say(self, "MUCHAS GRACIAS, me has salvado")}
		else {}
	}
}



