import wollok.game.*
const spot1 = new LugarParaPonerAnimal(animalCorrespondiente = leon, position = game.at(4,4))
const spot2 = new LugarParaPonerAnimal(animalCorrespondiente = mono, position = game.at(2,8))
const spot3 = new LugarParaPonerAnimal(animalCorrespondiente = pajaro, position = game.at(9,9))
const spot4 = new LugarParaPonerAnimal(animalCorrespondiente = elefante, position = game.at(8,2))

const leon = new Animal(image = "leon.png", position = spot1.position())
const mono = new Animal(image = "mono.png", position = spot2.position())
const pajaro = new Animal(image = "pepita1.png", position = spot3.position())
const elefante = new Animal(image = "elefante.png", position = spot4.position())

class Animal {
	var property image
	var property position
	method fuisteChodadaPor(personaje) {}
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

class LugarParaPonerAnimal {
	var property animalCorrespondiente
	var property position
	const property image = "flecha.png"
	method fuisteChodadaPor(personaje) {}
}
