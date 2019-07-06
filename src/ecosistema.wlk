import wollok.game.*
class Ecosistema {
	var property position = game.at(0,0)
	var property elementos = []
	
	// PARA INICIAR EL JUEGO
	method jugar(){
		self.crearElementos()
		self.agregarElementos() 
	}	
	
	// PARA JUGAR
	method crearElementos(){ /*CADA JUEGO PONE SUS ELEMENTOS */}	
	method agregarElementos(){elementos.forEach({ elemento => game.addVisual(elemento) })}
	method termino () {/* NO HACE NADA */}

	//PARA estaSiendoSalvado(ecosistema) de MUNDO
	method fuisteSalvado()  = elementos.isEmpty()
	method quitar(elemento){
		game.removeVisual(elemento)
		elementos.remove(elemento)
	}

	//SACA TODO PARA VOLVER A LA PANTALLA INICIAL
	method eliminarTodo(){ 
		if(not elementos.isEmpty()) {
			self.elementos().forEach{elemento => game.removeVisual(elemento)}
			elementos.clear()
		}
	}

	
}