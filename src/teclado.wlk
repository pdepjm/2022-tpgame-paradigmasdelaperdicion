import wollok.game.*
import enemigos.*
import movimiento.*
import heroes.*
import turnos.*
import niveles.*

object teclado{
	var property estado = enMovimiento

	method configurarTeclas() {
		keyboard.left().onPressDo({ estado.liderMovete(izquierda)}) 
		keyboard.right().onPressDo({estado.liderMovete(derecha)})
		keyboard.g().onPressDo({estado.modoCombate(cascotaso)})
		keyboard.h().onPressDo({estado.modoCombate(/*curacion*/)})
		keyboard.e().onPressDo({ game.stop() })	
	}
	
	method configurarColision() {
		game.onCollideDo(lider, { algo => algo.colisionConHeroe()})
	}
}

class Direccion {
	method siguientePosicion(position,cantidad)
}
object izquierda inherits Direccion { 
	override method siguientePosicion(position,cantidad){
		if(position.left(cantidad) == game.at(12,3)){
			return	position
		}else{
			return position.left(cantidad)
		}
	}
}

object derecha inherits Direccion { 
	override method siguientePosicion(position,cantidad) = position.right(cantidad) 
}

class Estado {
	method liderMovete(direccion)
	
	method modoCombate(habilidad)
	
	method modoCombate()
}
object enMovimiento inherits Estado {
	override method liderMovete(direccion) {
		lider.mover(direccion, 2)
	}
	
	override method modoCombate(habilidad) {}
	
	override method modoCombate() {}
}

object enCombate inherits Estado{
	override method liderMovete(direccion) {}
	
	override method modoCombate(habilidad){
		turno.atacarCon(habilidad)
	}
	
	override method modoCombate(){
		turno.curar()
	}
	
}

object removedorDeImagenes{
	method eliminarVisual(visual){
		game.removeVisual(visual)
	}
}