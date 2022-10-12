import wollok.game.*
import teclado.*
import heroes.*

object lider {
    var property position = game.at(20, 5)
    var seguidores = [seguidor1 , seguidor2]
    var property heroe = caballero


    method image() = heroe.image()

    method mover(direccion,cantidad) {
		position = direccion.siguientePosicion(self.position(), cantidad)
        seguidores.forEach({ seguidor => seguidor.fijateDondeEstaElLider() })        
	}
}

class Seguidor {
    var desfasaje
    var property position = lider.position().left(desfasaje) //esto habria que delegarlo ya sabemos
    var property heroe

    method image() = heroe.image()

    method fijateDondeEstaElLider() {
        position = lider.position().left(desfasaje)
    }
    
}

const seguidor1 = new Seguidor(desfasaje = 6, heroe = doctor)
const seguidor2 = new Seguidor(desfasaje = 12, heroe = leproso)