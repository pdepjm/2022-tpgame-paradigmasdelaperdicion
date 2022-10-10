import wollok.game.*
import enemigos.*
import movimiento.*
import heroes.*
import turnos.*

object teclado{
	var property movimiento = true

	method configurarTeclas() {
		if (movimiento) {
			keyboard.left().onPressDo({ lider.mover(izquierda, 2)}) 
			keyboard.right().onPressDo({ lider.mover(derecha, 2) })
		}
		else{
			keyboard.left().onPressDo({ self.vacio() }) 
			keyboard.right().onPressDo({ self.vacio() })
			keyboard.g().onPressDo({turno.tocoletraG()})
		}
		keyboard.e().onPressDo({ game.stop() })	
	}
	
	method vacio() {}

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

