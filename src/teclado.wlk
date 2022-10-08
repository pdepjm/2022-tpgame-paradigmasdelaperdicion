import wollok.game.*
import enemigos.*
import movimiento.*
import heroes.*

object teclado{

	method configurarTeclas() {
		keyboard.left().onPressDo({ lider.mover(izquierda,2)})   // deberiamos despues una vez que funcione con el lider agregar a los personajes que lo siguen
		keyboard.right().onPressDo({ lider.mover(derecha,2) })
		keyboard.e().onPressDo({ game.stop() })	
		//aca hay q poner para salir del juego
	}

	method configurarColision() {
		game.onCollideDo(lider, { algo => algo.colisionConHeroe() })
		
	}

}

object izquierda { 
	method siguientePosicion(position,cantidad) = position.left(cantidad) 
}

object derecha { 
	method siguientePosicion(position,cantidad) = position.right(cantidad) 
}

