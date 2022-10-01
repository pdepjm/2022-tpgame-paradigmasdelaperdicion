import wollok.game.*
import direcciones.*
import niveles.*


//Hay que cambiar los limites 
object izquierda {
	method proximaPosicion(posicionActual,objeto) =
		if(objeto.position().x()>0)
		{
		    posicionActual.left(1) 
		}
		else {
		    posicionActual.left(0) 
		}	
}

object derecha {
	method proximaPosicion(posicionActual,objeto) =
		if(objeto.position().x()<50)
		{
		    posicionActual.right(1) 
		}
		else {
		    posicionActual.right(0) 
		}
	
}

class Teclado{
	method configurarTeclas(){
		keyboard.left()..onPressDo({ lider.moverPara(izquierda) })
		keyboard.right().onPressDo({ lider.moverPara(derecha) })
	}