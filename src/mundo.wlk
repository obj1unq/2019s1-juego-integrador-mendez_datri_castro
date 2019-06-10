import wollok.game.*
object mundo {
	var property aniosDeVida = 12
	var property position = game.at(1,0)
	method image() = if (aniosDeVida < 16) {"mundoInicial.png"} else "mundoSegundo.png"
	
	//VOLVER A PANTALLA INICIAL al finalizar el juego.
	method irAPantallaInicial() {
		game.say(self, "GRACIAS! Apreta espacio para continuar")
	}
	
	//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {
//		game.say(self, "Ayudame a salvar el planeta") //Se tilda y nunca se sale
	}
	
	//Para que los arboles no sumen vida
	method elEcosistemaFueSalvadoSumarVida(ecosistema) {
		if (ecosistema.fuisteSalvado()) aniosDeVida ++
		else aniosDeVida
	}
	
	//FINAL???
	method meSalvaste() {
		if (aniosDeVida == 16)	{game.say(self, "MUCHAS GRACIAS, me has salvado")}
		else {}
	}
}



