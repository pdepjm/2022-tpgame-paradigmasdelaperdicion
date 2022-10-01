import heroes.*
import enemigos.*
import direcciones.*

class Teclado{
	method configurarTeclas(){
		keyboard.left().onPressDo({ lider.moverPara(izquierda) })
		keyboard.right().onPressDo({ lider.moverPara(derecha) })
		keyboard.enter().onPressDo({ personaje.hablar() })
		keyboard.e().onPressDo({ game.stop() })	
		//aca hay q poner para salir del juego
	}
}