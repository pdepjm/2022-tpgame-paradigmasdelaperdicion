import wollok.game.*
import enemigos.*
import movimiento.*
import heroes.*
import turnos.*

object teclado{
	var property movimiento = true
	var property combate = false

	method configurarTeclas() {
		keyboard.left().onPressDo({ if(movimiento) {lider.mover(izquierda, 2)} }) 
		keyboard.right().onPressDo({if(movimiento) {lider.mover(derecha, 2)} })
		keyboard.g().onPressDo({if(combate) { turno.tocoletraG() } })
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

