import wollok.game.*
import fondo.*
object mundo {
	var property aniosDeVida = 12
	var property position = game.at(1,0)
	method image() = if (aniosDeVida < 16) {"mundoInicial.png"} else "mundoSegundo.png"
	
	
	//DIVISION estasSiendoSalvado de los ecosistemas
	method mensajeDeVolver() { game.say(self, "GRACIAS! Apreta espacio para continuar") }

	//PARA SABER CUANDO FUE SALVADO EL MUNDO
	method elEcosistemaFueSalvadoSumarVida(ecosistema) {
		if (ecosistema.fuisteSalvado()) { aniosDeVida ++ }
		else aniosDeVida
	}

	//CAMBIOs CUANDO SE SALVA EL MUNDO	
	method estaSiendoSalvado(ecosistema) { 
		if(ecosistema.fuisteSalvado()){
			self.mensajeDeVolver()
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
	
	//CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje){/* No hace nada */}
	
	//FINAL
	method meSalvaste() { 
		if (aniosDeVida == 16)	{
			game.say(self, "MUCHAS GRACIAS, me has salvado")
			fondo.sacarCandadosDePantalla()
		} 
	}
}



