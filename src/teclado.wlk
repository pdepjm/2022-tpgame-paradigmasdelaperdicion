import wollok.game.*
import enemigos.*
import movimiento.*
import heroes.*

object teclado{

	method configurarTeclas() {
		keyboard.left().onPressDo({ lider.mover(izquierda, 2)}) 
		keyboard.right().onPressDo({ lider.mover(derecha, 2) })
		keyboard.e().onPressDo({ game.stop() })	
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

