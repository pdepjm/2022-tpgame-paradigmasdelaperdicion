import wollok.game.*
import heroes.*
import turnos.*

/*------------------------------ESTADOS--Y--EVENTOS-------------------------------------------*/

object configuradorDeEventosYEstados {
	var property estado = enPresentacion

	method configurarTeclas() {
		keyboard.left().onPressDo({ estado.liderMovete(izquierda) }) 
		keyboard.right().onPressDo({ estado.liderMovete(derecha) })
		keyboard.g().onPressDo({ estado.modoCombateAtacar() })
		keyboard.h().onPressDo({ estado.modoCombateCurar() })
		keyboard.e().onPressDo({ game.stop() })	
	}
	
	method configurarColision() {
		game.onCollideDo(lider, { bicho => bicho.colisionConHeroe()})
	}
}

class Estado {
	
	method liderMovete(direccion)
	
	method modoCombateAtacar()
	
	method modoCombateCurar()
	
	method instrucciones()
}

object enPresentacion inherits Estado {
	
	override method liderMovete(direccion) {}
	
	override method modoCombateAtacar() {}
	
	override method modoCombateCurar() {}
	
	override method instrucciones() {}
}

object enMovimiento inherits Estado {
	
	override method liderMovete(direccion) {
		lider.mover(direccion, 2)
	}
	
	override method modoCombateAtacar() {}
	
	override method modoCombateCurar() {}
	
	override method instrucciones() = "./habilidades/instruccionesFlechas.png"
}

object enCombate inherits Estado{
	
	override method liderMovete(direccion) {}
	
	override method modoCombateAtacar() {
		turno.atacaUnHeroe()
	}
	
	override method modoCombateCurar() {
		turno.curaUnHeroe()
	}	
	
	override method instrucciones() = "./habilidades/instruccionesLetrasGyH.png"
}

/*------------------------------DIRECCIONES-------------------------------------------*/

class Direccion {
	
	method siguientePosicion(position,cantidad)
}

object izquierda inherits Direccion { 
	
	override method siguientePosicion(position,cantidad) {
		if(position.left(cantidad) == game.at(12,3)) {
			return	position
		}
		else {
			return position.left(cantidad)
		}
	}
}

object derecha inherits Direccion { 
	
	override method siguientePosicion(position,cantidad) = position.right(cantidad) 
}



