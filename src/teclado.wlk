import wollok.game.*
import enemigos.*
import movimiento.*
import heroes.*

object teclado{
	var property movimiento = true

	method configurarTeclas() {
		if (movimiento) {
			keyboard.left().onPressDo({ lider.mover(izquierda, 2)}) 
			keyboard.right().onPressDo({ lider.mover(derecha, 2) })
		}
		else{
			keyboard.left().onPressDo({ /* VACIO */ }) 
			keyboard.right().onPressDo({ /* VACIO */ })
			keyboard.g().onPressDo({turno => turno.ataqueBasico()})
		}
		keyboard.e().onPressDo({ game.stop() })	
	}

	method configurarColision() {
		game.onCollideDo(lider, { algo => algo.colisionConHeroe()  })
		
	}

}

object izquierda { 
	method siguientePosicion(position,cantidad) = position.left(cantidad) 
}

object derecha { 
	method siguientePosicion(position,cantidad) = position.right(cantidad) 
}

