import wollok.game.*
import enemigos.*
import movimiento.*
import heroes.*
import turnos.*

object teclado{
	var property movimiento = true
	var property combate = false

	method configurarTeclas() {
<<<<<<< HEAD
		keyboard.left().onPressDo({ if(movimiento) {lider.mover(izquierda, 2)} }) 
		keyboard.right().onPressDo({if(movimiento) {lider.mover(derecha, 2)} })
			
		keyboard.g().onPressDo({if(combate) { turno.ataqueBasico() } })
		
=======
		if (movimiento) {
			keyboard.left().onPressDo({ lider.mover(izquierda, 2)}) 
			keyboard.right().onPressDo({ lider.mover(derecha, 2) })
		}
		else{
			keyboard.left().onPressDo({ self.vacio() }) 
			keyboard.right().onPressDo({ self.vacio() })
			keyboard.g().onPressDo({turno.tocoletraG()})
		}
>>>>>>> 0a10d4fd89fcfff0b5162cbb54fb76542f22f8a9
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

