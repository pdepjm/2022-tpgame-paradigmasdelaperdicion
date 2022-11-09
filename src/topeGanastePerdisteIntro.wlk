import wollok.game.*
import niveles.*

object yaGanaste {
	
	method position() = game.center().left(10)
	
	method image() = "victoria.png"
}


object yaPerdiste {
	
	method position() = game.center().left(10)
	
	method image() = "derrota.png"
}

object imagenIntro {
	
	method image() = "intro2a.jpg"
	
	method position() = game.at(0,0)
}

object tope {	
	
	method position() = game.at(50,3)

	method colisionConHeroe() { 		
		nivel2.configurarNivel()//hay q ver q onda esto
	}
}

































