import wollok.game.*

object mundo {
	var aniosDeVida = 10
	
	var property position = game.at(1,0)
	method image() = if (aniosDeVida <= 12) {"ecosistemaFondo2.png"} else "ecosistemaFondo1.png"
	method sumarAniosDeVida(){
		aniosDeVida += 1
	}
	
}
