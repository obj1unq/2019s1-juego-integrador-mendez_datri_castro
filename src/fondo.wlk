import wollok.game.*
import	ecosistemas.*
object fondo {
	var property position = game.at(0,0)
	var property image = "ecosistemaFondo1.png"
	var property candados = []
	
//Volver a Inicio del Personaje
	method ponerInicioLimpio() {
		self.image("ecosistemaFondo1.png")
		self.agregarCadadosAPanatalla()
		bosque.eliminarArboles()
		agua.eliminarMugre()
	}
	
// SOBRE CANDADOS
	method agregarCandado(ecosistema) 	{ candados.add(ecosistema.candado()) }
	method sacarCandadoDe(ecosistema) 	{	candados.remove(ecosistema.candado())}
	method sacarCandadosDePantalla() 	{ candados.forEach{candado => game.removeVisual(candado)} }
	method agregarCadadosAPanatalla() {
		candados.forEach{candado => candado.fueSalvado()}
		candados.forEach{candado => game.addVisual(candado)}
	}
	
	
// CUANDO COLISIONA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) { /* No hace nada */}
}
