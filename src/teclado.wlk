import heroes.*
import enemigos.*
import direcciones.*
import movimiento.*

object teclado{

	method configurarTeclas(){
		keyboard.left().onPressDo({ self.mover(izquierda, lider) })   // deberiamos despues una vez que funcione con el lider agregar a los personajes que lo siguen
		keyboard.right().onPressDo({ self.mover(derecha, lider) })
		keyboard.e().onPressDo({ game.stop() })	
		//aca hay q poner para salir del juego
	}

	method mover(direccion, personaje) {
		personaje.position(direccion.siguientePosicion(personaje.position()))
	}

	
}

object izquierda { 
	method siguientePosicion(position) = position.left(1) 
}

object derecha { 
	method siguientePosicion(position) = position.right(1) 
}
