import wollok.game.*
import teclado.*

object lider {
    var property position = game.at(20, 5)
    var seguidores = [seguidor1 , seguidor2]
    
    method image() = "caballero.png"

    method mover(direccion) {
		position = direccion.siguientePosicion(lider.position())
        seguidores.forEach({ seguidor => seguidor.fijateDondeEstaElLider() })        
	}
}

class Seguidor {
    var desfasaje
    var property position = lider.position().left(desfasaje)
    const imagen

    method image() = imagen

    method fijateDondeEstaElLider() {
        position = lider.position().left(desfasaje)
    }
    
}

const seguidor1 = new Seguidor(desfasaje = 6, imagen = "doctor.png")
const seguidor2 = new Seguidor(desfasaje = 12, imagen = "leproso.png")

