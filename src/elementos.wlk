import wollok.game.*
import mundo.*
import selva.*
import bosque.*
import fondo.*

//CONSTANTES:

//Agua
const botella = new ElementoQueSeMueve(position= game.at(13,3), image = "basura3.png")
const basura = new ElementoQueSeMueve(position = game.at(10,4), image = "basura1.png")
const tablaDeComida = new ElementoQueSeMueve(position= game.at(15,4), image = "basura2.png")
//Bosque
const semilla1 = new Semilla()
const semilla2 = new Semilla()
const semilla3 = new Semilla()
//Ciudad
const nube1 = new Elemento(image= "nubeNegra.png", position = game.at(4,2))
const nube2 = new Elemento(image= "nubeNegra.png", position = game.at(15,9))
const nube3 = new Elemento(image= "nubeNegra.png", position = game.at(6,10))
const nube4 = new Elemento(image= "nubeNegra.png", position = game.at(2,8))
const nube5 = new Elemento(image= "nubeNegra.png", position = game.at(9,6))
const nube6 = new Elemento(image= "nubeNegra.png", position = game.at(14,2))
//Selva
const spot1 = new LugarParaPonerAnimal(animal = "leon", position = game.at(6,2))
const spot2 = new LugarParaPonerAnimal(animal = "mono", position = game.at(3,8))
const spot3 = new LugarParaPonerAnimal(animal = "ave", position = game.at(14,8))
const spot4 = new LugarParaPonerAnimal(animal = "elefante", position = game.at(14,2))

class Elemento {
	var property position
	var image = null
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	
	// DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje){
		self.estasSiendoProcesada()
		mundo.estaSiendoSalvado(fondo.ecosistemaActual())
	}
	
	// DIVISION DE ESTAS INTERACTUANDO CON 
	method estasSiendoProcesada(){
		fondo.ecosistemaActual().quitar(self)
	}
	
}

class ElementoQueSeMueve inherits Elemento{
	var movimientos = 0
	
	// DIVISION DEL APARECER
	method moverse(){
		game.onTick(1500, "basura moviendose", {=> self.mover()})
	}
	
	//DIVISION DE MOVERSE
	method mover() {
		if (movimientos < 3){
			position = position.left(1)
			movimientos ++
		}
		else if (movimientos >= 3 and movimientos <= 5){
			position = position.right(1)
			movimientos ++
		}
		else {movimientos = 0}
	}
}

//PARA SELVA
class LugarParaPonerAnimal inherits ElementoQueSeMueve {
	var property animal
	var property elAnimalFuePuesto = false
	
	//POLIMORFICO CON FONDO
	method image() = if (not elAnimalFuePuesto){
		"flecha.png"
	} else {
		animal + ".png"
	}
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	override method estasInteractuandoCon(personaje){
		if(not elAnimalFuePuesto){
			elAnimalFuePuesto = true
			mundo.estaSiendoSalvado(selva)
		}
	}

}

//PARA BOSQUE
class Semilla inherits Elemento{
	var property esAdulto = false
	var property fuePlantado = false
	
	//IMAGEN
	method image() = if (not esAdulto){
		"corn_baby.png"
	} else {
		"arbolSanoCHiquito.png"
	}
	
	//PARA sembarArbol(personaje) DE BOSQUES
	method plantar(personaje) {
		game.addVisualIn(self, personaje.position())
		fuePlantado = true
	}
	
	//CUANDO SE USA LA E
	override method estasInteractuandoCon(personaje){
		self.regar(personaje)
		mundo.estaSiendoSalvado(bosque)
	}
	
	
	//DIVISION DEL ESTASINTERACTUANDOCON
	method regar(personaje) {
		if (not esAdulto)  {
			esAdulto = true
		}
	}
}	


