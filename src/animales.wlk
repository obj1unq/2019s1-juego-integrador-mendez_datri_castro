import wollok.game.*
import selva.*

const leon = new Animal(position = game.at(6,2), image = "leon.png")
const mono = new Animal(position = game.at(3,8), image = "mono.png")
const ave = new Animal(position = game.at(14,8), image = "pepita1.png")
const elefante = new Animal(position = game.at(14,2), image = "elefante.png")
const spot1 = new LugarParaPonerAnimal(animalCorrespondiente = leon, position = game.at(6,2))
const spot2 = new LugarParaPonerAnimal(animalCorrespondiente = mono, position = game.at(3,8))
const spot3 = new LugarParaPonerAnimal(animalCorrespondiente = ave, position = game.at(14,8))
const spot4 = new LugarParaPonerAnimal(animalCorrespondiente = elefante, position = game.at(14,2))

class Animal {
	var property image
	var property position
	var movimientos = 0
	method fuisteChocadaPor(personaje){}
	method moverse(){
		game.onTick(1500, "animal moviendose", {=> self.mover()})
	}
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
	method estasInteractuandoCon(personaj){}
}

class LugarParaPonerAnimal {
	var property animalCorrespondiente
	var property position
	var property image = "flecha.png"
	method fuisteChocadaPor(personaje) {}
	method estasInteractuandoCon(personaje){
		game.addVisual(animalCorrespondiente)
		selva.agregarAnimal(animalCorrespondiente)
		game.removeVisual(self)
		selva.sacarSpot(self)
		selva.estasSiendoSalvado()
	}
}
