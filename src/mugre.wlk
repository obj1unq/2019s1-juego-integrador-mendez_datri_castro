import wollok.game.*
import agua.*
import mundo.*
import elementos.*

const botella = new Mugre(position= game.at(13,3), image = "basura3.png")
const basura = new Mugre(position = game.at(10,4), image = "basura1.png")
const tablaDeComida = new Mugre(position= game.at(15,4), image = "basura2.png")
class Mugre inherits Elemento {
	var property position
	var property image
	var movimientos = 0
	
	// DIVISION DEL APARECER
		method moverse(){
		game.onTick(1500, "mugre moviendose", {=> self.mover()})
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
	
	//DIVISION DEL MOVERSE
	method move(nuevaPosicion)	{ position = nuevaPosicion }
}
