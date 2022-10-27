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

object izquierda { 
	method siguientePosicion(position,cantidad){
		if(position.left(cantidad) == game.at(12,3)){
			return	position
		}else{
			return position.left(cantidad)
		}
	}
}

object derecha { 
	method siguientePosicion(position,cantidad) = position.right(cantidad) 
}

object enMovimiento {
	method liderMovete(direccion) {
		lider.mover(direccion, 2)
	}
	
	method modoCombate(habilidad) {}
	
	method modoCombate() {}
}

object enCombate{
	method liderMovete(direccion) {}
	
	method modoCombate(habilidad){
		turno.atacarCon(habilidad)
	}
	
	method modoCombate(){
		turno.curar()
	}
	
}

object removedorDeImagenes{
	method eliminarVisual(visual){
		game.removeVisual(visual)
	}
}