import wollok.game.*
import enemigos.*
import movimiento.*

object teclado{

	method configurarTeclas(personaje){
		keyboard.left().onPressDo({ self.mover(izquierda, personaje) })   // deberiamos despues una vez que funcione con el lider agregar a los personajes que lo siguen
		keyboard.right().onPressDo({ self.mover(derecha, personaje) })
		keyboard.e().onPressDo({ game.stop() })	
		//aca hay q poner para salir del juego
	}

	method mover(direccion, personaje) {
		personaje.position(direccion.siguientePosicion(personaje.position()))
	}

	
}

object izquierda { 
	method siguientePosicion(position) = position.left(2) 
}

object derecha { 
	method siguientePosicion(position) = position.right(2) 
}
