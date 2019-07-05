import wollok.game.*
import selva.*
import mundo.*


const spot1 = new LugarParaPonerAnimal(animal = "leon", position = game.at(6,2))
const spot2 = new LugarParaPonerAnimal(animal = "mono", position = game.at(3,8))
const spot3 = new LugarParaPonerAnimal(animal = "ave", position = game.at(14,8))
const spot4 = new LugarParaPonerAnimal(animal = "elefante", position = game.at(14,2))

class LugarParaPonerAnimal {
	var property animal
	var property elAnimalFuePuesto = false
	var property position
	var movimientos = 0
	
	method image() = if (not elAnimalFuePuesto){
		"flecha.png"
	} else {
		animal + ".png"
	}
	//POR SI CHOCA CON EL PERSONAJE
	method fuisteChocadaPor(personaje){ /* NO HACE NADA */ }
	
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
	method estasInteractuandoCon(personaje){
		if(not elAnimalFuePuesto){
			elAnimalFuePuesto = true
			mundo.estaSiendoSalvado(selva)
		}
	}

}
/* 
class LugarParaPonerAnimal {
	var property animalCorrespondiente
	var property position
	var property image = "flecha.png"
	
	//POR SI CHOCA CON EL PERSONAJE
	method fuisteChocadaPor(personaje) {/* NO HACE NADA }
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje){
		selva.agregar(animalCorrespondiente)
		selva.quitar(self)
		mundo.estaSiendoSalvado(selva)
	}
}
*/
