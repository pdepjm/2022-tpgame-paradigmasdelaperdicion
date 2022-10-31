
import wollok.game.*
import heroes.*
import estadosEventosDirecciones.*
import barrasDeVida.*

object turno {
	const heroes = [lider, seguidor1, seguidor2]
    var iteradorHeroes = []
    var property enemigo
    var property nivel
    
    method jugadorActual() = self.aCualesAtacaElBicho().head()
    
    method jugadorQueLeTocaAtacar() = iteradorHeroes.head()
    
    method aCualesAtacaElBicho() = heroes.filter({unHeroe => unHeroe.estoyVivo()})
	
    method iteradorHeroesAgregarlos() {
        iteradorHeroes.addAll(self.aCualesAtacaElBicho())
        game.addVisual(flecha)
    }
    
    method iniciar() {
    	lider.mover(izquierda, 6)
        self.iteradorHeroesAgregarlos()
        configuradorDeEventosYEstados.estado(enCombate) 
    }

method atacaUnHeroe() {
    	const danioDeAtaque = self.jugadorQueLeTocaAtacar().danioDeAtaqueHeroe()
    	if(self.elBichoMoririacon(danioDeAtaque) && nivel.esElUltimo()) {
    		self.jugadorQueLeTocaAtacar().atacar()
    		 game.schedule(3000, {nivel.ganaste()})
    	}
    	if(self.elBichoMoririacon(danioDeAtaque)) {
    		self.jugadorQueLeTocaAtacar().atacar()
    		self.finDelTurno()
    	}
    	else {
    		self.jugadorQueLeTocaAtacar().atacar()
        	self.iterarHeroes()
    	}
    }

    method curaUnHeroe() { 
        iteradorHeroes.head().curar()
        self.iterarHeroes()
    }
    
    method iterarHeroes() {
    	iteradorHeroes.remove(iteradorHeroes.head())
        if (iteradorHeroes.isEmpty()) {        	
			game.removeVisual(flecha)
        	self.atacaElBicho()
        }
            
    }    

    method atacaElBicho() {
    	const danioDeAtaque = enemigo.elegirDanioDeAtaque()
    	if(self.elUltimoHeroeMoririaCon(danioDeAtaque)) {
    		game.schedule(3000, {nivel.perdiste()})
    	}
        enemigo.atacar(danioDeAtaque)        
        self.iteradorHeroesAgregarlos()
    }
    
method finDelTurno() {	
		game.removeVisual(flecha)	
		iteradorHeroes.clear()		
		configuradorDeEventosYEstados.estado(enMovimiento)
	}
	
method elBichoMoririacon(danioDeAtaque) = 
		enemigo.vida() - enemigo.cuantoDanioMeHacen(danioDeAtaque, self.jugadorQueLeTocaAtacar().fuerza()) <= 0
	
	method elUltimoHeroeMoririaCon(danioDeAtaque) = 
		self.aCualesAtacaElBicho().size() == 1 && 
		self.jugadorActual().vida() - self.jugadorActual().cuantoDanioMeHacen(danioDeAtaque) <= 0	
}
