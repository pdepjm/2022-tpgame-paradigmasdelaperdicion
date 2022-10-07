import wollok.game.*
import enemigos.*
import movimiento.*

object teclado{

	method configurarTeclas() {
		keyboard.left().onPressDo({ lider.mover(izquierda) })   // deberiamos despues una vez que funcione con el lider agregar a los personajes que lo siguen
		keyboard.right().onPressDo({ lider.mover(derecha) })
		keyboard.e().onPressDo({ game.stop() })	
		//aca hay q poner para salir del juego
	}
}

object izquierda { 
	method siguientePosicion(position) = position.left(2) 
}

object derecha { 
	method siguientePosicion(position) = position.right(2) 
}
