import wollok.game.*
import bosque.*
import mundo.*
// PARA EL BOSQUE
class Arbol {
	var property position
	var property image = "corn_baby.png"
	var property esAdulto = false
	
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) { /* No hace nada */}
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje)  {
		if (not esAdulto){
			self.estasSiendoRegado()
			mundo.estaSiendoSalvado(bosque)
		}	
	}
	
	// DIVISION DE ESTAS INTERACTUANDO CON 
	method estasSiendoRegado() { 
		image = "arbolSanoCHiquito.png"	
		esAdulto = true
		bosque.sumarVida()	
	}
	
	// DIVISION DE SEMBRAR DEL PERSONAJE
	method estasSiendoSembrado(personaje) { game.addVisualIn(self, personaje.position()) }
	

}