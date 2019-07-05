import wollok.game.*
import selva.*
import mundo.*
import elementos.*

const spot1 = new LugarParaPonerAnimal(animal = "leon", position = game.at(6,2))
const spot2 = new LugarParaPonerAnimal(animal = "mono", position = game.at(3,8))
const spot3 = new LugarParaPonerAnimal(animal = "ave", position = game.at(14,8))
const spot4 = new LugarParaPonerAnimal(animal = "elefante", position = game.at(14,2))

class LugarParaPonerAnimal inherits Elemento {
	var property animal
	var property elAnimalFuePuesto = false
	var movimientos = 0
	
	//POLIMORFICO CON FONDO
	method image() = if (not elAnimalFuePuesto){
		"flecha.png"
	} else {
		animal + ".png"
	}

	//DIVISION DEL MOVERSE de SELVA
	method moverse(){
		game.onTick(1500, "animal moviendose", {=> self.mover()})
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
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	override method estasInteractuandoCon(personaje){
		if(not elAnimalFuePuesto){
			elAnimalFuePuesto = true
			mundo.estaSiendoSalvado(selva)
		}
	}

}
