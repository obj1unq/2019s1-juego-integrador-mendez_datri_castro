import wollok.game.*
import agua.*
import mundo.*
import elementos.*

const botella = new Mugre(position= game.at(13,3), image = "basura3.png")
const basura = new Mugre(position = game.at(10,4), image = "basura1.png")
const tablaDeComida = new Mugre(position= game.at(15,4), image = "basura2.png")
class Mugre inherits ElementoQueSeMueve { var property image }


