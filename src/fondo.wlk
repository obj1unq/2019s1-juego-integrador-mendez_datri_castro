import wollok.game.*
import	ciudad.*
import	agua.*
import	bosque.*
import	selva.*
import mundo.*
import personaje.*
object fondo {
	var property position = game.at(0,0)
	var property image = "ecosistemaFondo1.png"
	var property candados = []
	var property ecosistemaActual = null
	
	//POLIMORFISMO CON LOS ELEMENTOS DE CADA JUEGO 
	method estasInteractuandoCon(personaje){/* No hace nada */}
	
	// CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) { /* No hace nada */}
	
	//VOLVER AL INICIO DEL PERSONAJE
	method ponerInicioLimpio() {
		if (ecosistemaActual != null) {
			self.image("ecosistemaFondo1.png")
			self.agregarCandadosAPantalla()
			self.eliminarTodo()
			self.ecosistemaActual(null)
			mundo.meSalvaste()
		}
}
	
	//INICIALIZA LOS ECOSISTEMAS
	method inicializar(ecosistema) {
		self.sacarCandadosDePantalla()
		personaje.position(game.origin())
		self.image(ecosistema.image())
		game.say(mundo, ecosistema.mensaje())
	}
	
	//SACA TODO PARA VOLVER A LA PANTALLA INICIAL
	method eliminarTodo(){ self.eliminarElementos(ecosistemaActual)}
	
	//DIVISION DE ELIMINAR TODOS
	method eliminarElementos(ecosistema){
		if(not ecosistema.elementos().isEmpty()) {
		ecosistema.elementos().forEach{elemento => game.removeVisual(elemento)}
		ecosistema.elementos().clear()
		}
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
