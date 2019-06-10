import wollok.game.*
import	ciudad.*
import	agua.*
import	bosque.*
import	selva.*
import personaje.*
object fondo {
	var property position = game.at(0,0)
	var property image = "ecosistemaFondo1.png"
	var property candados = []
	
//Volver a Inicio del Personaje
	method ponerInicioLimpio() {
		self.image("ecosistemaFondo1.png")
		self.agregarCandadosAPantalla()
		personaje.ecosistemaActual(null)
		ciudad.eliminarNubes()
		bosque.eliminarArboles() 
		agua.eliminarMugre()
		selva.eliminarAnimales()
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
		self.agregarCandado(ciudad)
		self.agregarCandado(selva)
		self.agregarCandado(agua)
		self.agregarCandado(bosque)
	}
// CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) { /* No hace nada */}
}
