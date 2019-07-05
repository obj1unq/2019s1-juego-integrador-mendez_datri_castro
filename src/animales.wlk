import wollok.game.*
import selva.*
import mundo.*
import elementos.*

const spot1 = new LugarParaPonerAnimal(animal = "leon", position = game.at(6,2))
const spot2 = new LugarParaPonerAnimal(animal = "mono", position = game.at(3,8))
const spot3 = new LugarParaPonerAnimal(animal = "ave", position = game.at(14,8))
const spot4 = new LugarParaPonerAnimal(animal = "elefante", position = game.at(14,2))

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
