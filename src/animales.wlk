import wollok.game.*

const leon = new Leon()
const mono = new Mono()
const ave = new Ave()
const elefante = new Elefante()
const spot1 = new LugarParaPonerAnimal(animalCorrespondiente = leon, position = game.at(4,4))
const spot2 = new LugarParaPonerAnimal(animalCorrespondiente = mono, position = game.at(2,8))
const spot3 = new LugarParaPonerAnimal(animalCorrespondiente = ave, position = game.at(9,9))
const spot4 = new LugarParaPonerAnimal(animalCorrespondiente = elefante, position = game.at(8,2))


class Animal {
	var property image
	var property position
	method fuisteChocadaPor(personaje){}
	method moverse(){
		game.onTick(2000, "animal moviendose", {=> self.mover()})
	}
	method mover() {
		var movimientos = 0
		if (movimientos <= 3){
			position = position.left(1)
			movimientos ++
		}
		else if (movimientos > 3 and movimientos <= 6){
			position = position.right(1)
			movimientos ++
		}
		else {movimientos = 0}
	}
}
class Leon inherits Animal {
	override method position() = game.at(4,4)
	override method image() = "leon.png"
}
class Mono inherits Animal {
	override method position() = game.at(2,8)
	override method image() = "mono.png"
}
class Elefante inherits Animal {
	override method position() = game.at(8,2)
	override method image() = "elefante.png"
}
class Ave inherits Animal {
	override method position() = game.at(9,9)
	override method image() = "pepita1.png"
}

class LugarParaPonerAnimal {
	var property animalCorrespondiente
	var property position
	var property image = "flecha.png"
	method fuisteChocadaPor(personaje) {}
}
