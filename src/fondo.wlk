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
	var property ecosistemas = [agua, bosque, ciudad, selva]
	
//Volver a Inicio del Personaje
	method ponerInicioLimpio() {
		self.image("ecosistemaFondo1.png")
		self.agregarCandadosAPantalla()
		personaje.ecosistemaActual(null)
		self.eliminarTodo()
		mundo.meSalvaste()
	}
	
	method inicializar(ecosistema) {
		self.sacarCandadosDePantalla()
		ecosistema.candado().estaCerrado(true)
		personaje.position(game.origin())
		self.image(ecosistema.image())
		game.say(mundo, ecosistema.mensaje())
	}
	
	method eliminarTodo(){
		ecosistemas.forEach({ ecosistema => self.eliminarElementos(ecosistema) })
	}
	
	method eliminarElementos(ecosistema){
		if(not ecosistema.elementos().isEmpty()) {
		ecosistema.elementos().forEach{elemento => game.removeVisual(elemento)}
		ecosistema.elementos().clear()
		}
	}

// SOBRE CANDADOS
	method agregarCandado(ecosistema) 	{ candados.add(ecosistema.candado()) }
	method sacarCandadoDe(ecosistema) 	{	candados.remove(ecosistema.candado())}
	method sacarCandadosDePantalla() 	{ candados.forEach{candado => game.removeVisual(candado)} }
	method agregarCandadosAPantalla() {
		candados.forEach{candado => candado.fueSalvado()}
		candados.forEach{candado => game.addVisual(candado)}
	}
	
	method agregarCandados() {
		ecosistemas.forEach({ ecosistema => self.agregarCandado(ecosistema) })
		self.agregarCandadosAPantalla()
	}
// CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) { /* No hace nada */}
}
