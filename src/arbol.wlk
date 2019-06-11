import wollok.game.*
import bosque.*
// PARA EL BOSQUE
class Arbol {
	var property position
	var property image = "corn_baby.png"
	var property esAdulto = false
	
	// DIVISION DE SEMBRAR DEL PERSONAJE
	method estasSiendoSembrado(personaje) { game.addVisualIn(self, personaje.position()) }
	
	// DIVISION DE REGAR DEL PERSONAJE
	method estasSiendoRegado() { 
		if (not esAdulto){
			image = "arbolSanoCHiquito.png"	
			esAdulto = true
			bosque.sumarVida()}		
	}
	
	//POLIMORFISMO CON LA E
	method estasInteractuandoCon(personaje)  {
		game.colliders(personaje).forEach({arbol => arbol.estasSiendoRegado()})
		bosque.estasSiendoSalvado()	
	}
	
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) { /* No hace nada */}
}