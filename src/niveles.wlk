import wollok.game.*
import movimiento.*
import teclado.*
import enemigos.*
import heroes.*
import turnos.*


object nivelIntro {
	
	const comienzo = new Visual (image = "intro2a.jpg", position = game.at(0,0))
	
	method inicio(){
		game.title("Perdidigma")
		game.boardGround("fondito.png")
		game.addVisual(comienzo)
		keyboard.space().onPressDo({self.configuracionInicial()})
	}

	method configuracionInicial(){
		game.clear()
		game.addVisual(lider)
		game.addVisual(seguidor1)
		game.addVisual(seguidor2)
		nivel1.configurarNivel()
		game.addVisual(tope)
		game.addVisual(barraLider)
		game.addVisual(barraSeguidor1)
		game.addVisual(barraSeguidor2)
		teclado.configurarTeclas()
		teclado.configurarColision()
		
	}
}

class NivelJuego{
	
	const enemigo
	const barraEnemigo

	method configurarNivel(){
		game.addVisual(enemigo)
		game.addVisual(barraEnemigo)
	}
}	

class Visual {
	var property image
	var property position = game.at(50,50)
	
}

object tope {
	
	const property position = game.at(50,3)
	var property image = "invisible.png"

	method colisionConHeroe(){
		turno.enemigo(hongo)
		lider.moverAlInicio()
		nivel2.configurarNivel()
		
	}
}

const nivel1 = new NivelJuego(enemigo = ectoplasma, barraEnemigo = barraEctoplasma)
const nivel2 = new NivelJuego(enemigo = hongo, barraEnemigo = barraHongo)


object ganaste {
	
	method position() = game.center().left(10)
	
	method image() = "victoria.png"
}


object perdiste {
	
	method position() = game.center().left(10)
	
	method image() = "derrota.png"
}