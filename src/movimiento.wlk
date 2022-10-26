import wollok.game.*
import teclado.*
import heroes.*

class Jugador {
    var property profesion 
	
	method vida()= profesion.vida()
	
	method vida(_vida)= profesion.vida(_vida)

	method image() = profesion.image()
	
	method estoyVivo() = profesion.estoyVivo()
	
	method atacar(habilidad) = profesion.atacar(habilidad)

	method curar() = profesion.curar()
	 
	method recibirAtaque(habilidad) = profesion.recibirAtaque(habilidad)
}

object lider inherits Jugador(profesion = caballero) {
    var property position = game.at(20, 5)
    const seguidores = [seguidor1 , seguidor2]

    method mover(direccion,cantidad) {
		position = direccion.siguientePosicion(self.position(), cantidad)        
	}
	
	method moverAlInicio(){
		position = game.at(20,5)
	}
	
}

class Seguidor inherits Jugador {
    var desfasaje

	method position() = lider.position().left(desfasaje)    
}

class BarraDeVida {
	var personaje

	method image() {
        const stringVida = self.numeroQueCorresponde()
         if (stringVida == "0") 
            return "invisible.png"
         else
        	return "BarraVida" + stringVida + ".png"
    }
	
	method position() = personaje.position().down(1) 

	method numeroQueCorresponde() = (personaje.vida() / 10).roundUp().toString()
}

const seguidor1 = new Seguidor(desfasaje = 6, profesion = doctor)
const seguidor2 = new Seguidor(desfasaje = 12, profesion = leproso)

const barraLider = new BarraDeVida(personaje = lider)
const barraSeguidor1 = new BarraDeVida(personaje = seguidor1)
const barraSeguidor2 = new BarraDeVida(personaje = seguidor2)