import wollok.game.*
import agua.*
import mundo.*

const botella = new Mugre(position= game.at(13,3), image = "basura3.png")
//const botellaArena = new Mugre(position= game.at(8, 1), image = "basura3.png")
const basura = new Mugre(position = game.at(10,4), image = "basura1.png")
const tablaDeComida = new Mugre(position= game.at(15,4), image = "basura2.png")
class Mugre {
	var property position
	var property image
	var movimientos = 0
	
	// CUANDO EL PERSONAJE COLISIONA
	method fuisteChocadaPor(personaje) {/* NO HACE NADA */}
	
	//DIVISION DE INTERACTUAR de PERSONAJE
	method estasInteractuandoCon(personaje){
		self.estasSiendoProcesada()
		mundo.estaSiendoSalvado(agua)
	}
	
	//PARA EL JUGAR DEL ECOSISTEMA
	method aparecer() {
		agua.agregarMugre(self)	
		game.addVisual(self)
		self.moverse()
	}	
	
	// DIVISION DEL APARECER
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
	
	// DIVISION DE ESTAS INTERACTUANDO CON
	method estasSiendoProcesada() {
		agua.sacarMugre(self)
		game.removeVisual(self)
	}
	
	//DIVISION DEL MOVERSE
	method move(nuevaPosicion)	{ position = nuevaPosicion }
}
