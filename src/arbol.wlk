import wollok.game.*
import bosque.*
// PARA EL BOSQUE
class Arbol {
	var property position
	var property image = "corn_baby.png"
	var property esAdulto = false
	
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) { /* No hace nada */}
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje)  {
		game.colliders(personaje).forEach({arbol => arbol.estasSiendoRegado()})
		bosque.estasSiendoSalvado()	
	}
	
	// DIVISION DE ESTAS INTERACTUANDO CON 
	method estasSiendoRegado() { 
		if (not esAdulto){
			image = "arbolSanoCHiquito.png"	
			esAdulto = true
			bosque.sumarVida()}		
	}
	
	// DIVISION DE SEMBRAR DEL PERSONAJE
	method estasSiendoSembrado(personaje) { game.addVisualIn(self, personaje.position()) }
	

}