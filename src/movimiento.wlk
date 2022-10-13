import wollok.game.*
import teclado.*
import heroes.*

class Jugador {
    var property profesion 
	
	method image() = profesion.image()
	
	method estoyVivo() = profesion.estoyVivo()
	
	method atacar(habilidad) = profesion.atacar(habilidad)
	
	method recibirAtaque(habilidad) = profesion.recibirAtaque(habilidad)
}

object lider inherits Jugador(profesion = caballero) {
    var property position = game.at(20, 5)
    const seguidores = [seguidor1 , seguidor2]

    method mover(direccion,cantidad) {
		position = direccion.siguientePosicion(self.position(), cantidad)        
	}
	
}

class Seguidor inherits Jugador {
    var desfasaje

	method position() = lider.position().left(desfasaje)    
}

const seguidor1 = new Seguidor(desfasaje = 6, profesion = doctor)
const seguidor2 = new Seguidor(desfasaje = 12, profesion = leproso)