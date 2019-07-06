import wollok.game.*
import	ciudad.*
import	agua.*
import	bosque.*
import	selva.*
import mundo.*
import personaje.*
object fondo {
	var property position = game.at(0,0)
	var property candados = []
	var property ecosistemaActual = null
	
	// IMAGEN DE LA PANTALLA
	method image(){
		if (ecosistemaActual == null){
			return "ecosistemaFondo1.png"
		}
		else { return ecosistemaActual.image() }
	} 
	
	//POLIMORFISMO CON LOS ELEMENTOS DE CADA JUEGO 
	method estasInteractuandoCon(personaje){/* No hace nada */}
	method fuisteChocadaPor(personaje) { /* No hace nada */}
	
	//AL APRETAR ESPACIO
	method volverAInicio() {
		if (ecosistemaActual != null) {
			personaje.position(game.origin())
			mundo.sumarAniosDeVidaSiFueSalvado(ecosistemaActual)
			self.ponerInicioLimpio()
		}
	}
	//VOLVER AL INICIO 
	method ponerInicioLimpio() {
			self.agregarCandadosAPantalla()
			ecosistemaActual.eliminarTodo()
			self.ecosistemaActual(null)
			mundo.meSalvaste()
	}
	
	
	
	//INICIALIZA LOS ECOSISTEMAS
	method inicializar(ecosistema) {
		ecosistemaActual = ecosistema
		self.sacarCandadosDePantalla()
		personaje.position(game.origin())
		game.say(mundo, ecosistema.mensaje())
	}

	//SOBRE CANDADOS
	method agregarCandado(ecosistema) 	{ candados.add(ecosistema.candado()) }
	method sacarCandadoDe(ecosistema) 	{ candados.remove(ecosistema.candado())}
	method sacarCandadosDePantalla() 	{ candados.forEach{candado => game.removeVisual(candado)} }
	method agregarCandadosAPantalla()   { candados.forEach{candado => game.addVisual(candado)} }
	method agregarCandados() {
		self.agregarCandado(agua)
		self.agregarCandado(bosque)
		self.agregarCandado(selva)
		self.agregarCandado(ciudad)
		self.agregarCandadosAPantalla()
	}
}
