import wollok.game.*
import barrasDeVida.*
import estadosEventosDirecciones.*
import bichos.*
import heroes.*
import turnos.*
import topeGanastePerdisteIntro.*

object nivelIntro {	
	
	method inicio() {
		game.title("Perdidigma")
		game.boardGround("fondito.png")
		game.addVisual(imagenIntro)
		keyboard.space().onPressDo({self.configuracionInicial()})
	}

	method configuracionInicial() {
		
		game.clear()
		
		game.addVisual(tope)
		
		game.addVisual(lider)
		game.addVisual(seguidor1)
		game.addVisual(seguidor2)
		game.addVisual(barraLider)
		game.addVisual(barraSeguidor1)
		game.addVisual(barraSeguidor2)
		
		nivel1.configurarNivel()	
		
		configuradorDeEventosYEstados.configurarTeclas()
		configuradorDeEventosYEstados.configurarColision()	
		configuradorDeEventosYEstados.estado(enMovimiento)
			
	}
}

class NivelJuego {	
	const enemigo
	const barraEnemigo
	const property esElUltimo = false

	method configurarNivel() {
		lider.moverAlInicio()		
		game.addVisual(enemigo)
		game.addVisual(barraEnemigo)
		turno.enemigo(enemigo)
		turno.nivel(self)
	}
	
	method perdiste() {
		game.clear()
		game.addVisualCharacter(yaPerdiste)
	}
	
	method ganaste() {
		game.clear()
		game.addVisualCharacter(yaGanaste)
	}
}	

/*------------------------------INSTANCIACIONES-----------------------------------------------*/

const nivel1 = new NivelJuego(enemigo = ectoplasma, barraEnemigo = barraEctoplasma)
const nivel2 = new NivelJuego(enemigo = hongo, barraEnemigo = barraHongo, esElUltimo = true)