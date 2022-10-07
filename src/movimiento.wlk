import wollok.game.*
import teclado.*

object lider {
    var property position = game.at(20, 30)
    var seguidores = [seguidor1 , seguidor2]
    
    method image() = "caballero.png"

    method mover(direccion) {
		posicion = direccion.siguientePosicion(personaje.position())
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

const seguidor1 = new Seguidor(desfasaje = 2, imagen = "doctor.png")
const seguidor2 = new Seguidor(desfasaje = 4, imagen = "leproso.png")

