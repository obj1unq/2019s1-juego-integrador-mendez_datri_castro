import wollok.game.*

class Ecosistema {
	var property position = game.at(0,0)
	var property elementos = []
	
	method termino(){}
	method fuisteSalvado()  = elementos.isEmpty()
	method quitar(elemento){
		game.removeVisual(elemento)
		elementos.remove(elemento)
	}
	method agregar(elemento){
		elementos.add(elemento)
		game.addVisual(elemento)
	}
	
		//SACA TODO PARA VOLVER A LA PANTALLA INICIAL
	method eliminarTodo(){ self.eliminarElementos()}
	
	//DIVISION DE ELIMINAR TODOS
	method eliminarElementos(){
		if(not elementos.isEmpty()) {
			elementos.forEach{elemento => game.removeVisual(elemento)}
			elementos.clear()
		}	
	}
	method jugar(){
		self.crearElementos()
		self.agregarElementos() 
	}	
	method crearElementos(){}
	method agregarElementos(){}
}
