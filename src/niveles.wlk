import wollok.game.*
import movimiento.*
import teclado.*
import enemigos.*
import heroes.*


object nivelIntro {
	
	const comienzo = new Visual (image = "intro2.jpg", position = game.at(0,0))
	
	method inicio(){
		game.title("Perdidigma")
		game.boardGround("fondito.png")
		game.addVisual(comienzo)
		keyboard.space().onPressDo({nivelJuego.configuracionInicial()})
	}
}

object nivelJuego{
	
	method configuracionInicial(){
		game.clear()
		game.addVisual(lider)
		game.addVisual(seguidor1)
		game.addVisual(seguidor2)
		game.addVisual(bichito)
		game.addVisual(barraBicho)
		game.addVisual(barraLider)
		game.addVisual(barraSeguidor1)
		game.addVisual(barraSeguidor2)
		teclado.configurarTeclas()
		teclado.configurarColision()
		
	}
}	

class Visual {
	var property image
	
	//Posicion aleatoria
	//const x = 2.randomUpTo(27.truncate(2))
    //const y = 2.randomUpTo(17.truncate(2))
	var property position = game.at(50,50)
	
}
