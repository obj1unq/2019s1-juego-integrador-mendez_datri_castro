import wollok.game.*
import fondo.*
object mundo {
	var property aniosDeVida = 12
	var property position = game.at(1,0)
	method image() = if (aniosDeVida < 16) {"mundoInicial.png"} else "mundoSegundo.png"
	
	//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	
	//DIVISION estasSiendoSalvado de los ecosistemas
	method irAPantallaInicial() { game.say(self, "GRACIAS! Apreta espacio para continuar") }

	//PARA SABER CUANDO FUE SALVADO EL MUNDO
	method elEcosistemaFueSalvadoSumarVida(ecosistema) {
		if (ecosistema.fuisteSalvado()) { aniosDeVida ++ }
		else aniosDeVida
	}

	//FINAL
	method meSalvaste() { 
		if (aniosDeVida == 16)	{
			game.say(self, "MUCHAS GRACIAS, me has salvado")
			fondo.sacarCandadosDePantalla()
		} 
	}
	//CAMBIO DE ASPECTO CUANDO SE SALVO EL MUNDO	
	method estaSiendoSalvado(ecosistema) { 
		if(ecosistema.fuisteSalvado()){
			self.irAPantallaInicial()
			ecosistema.termino()
			ecosistema.candado().abrir()
		}
	}
	
	//SUMA DE AÑOS DE VIDA 
	method sumarAniosDeVidaSiFueSalvado(ecosistema){
		if (ecosistema.fuisteSalvado()){
			aniosDeVida ++
		}
	}
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje){/* No hace nada */}
}



