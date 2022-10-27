
import wollok.game.*
import heroes.*
import movimiento.*
import teclado.*
import enemigos.*
import niveles.*

object turno {
    var heroes = []
    var property enemigo = ectoplasma
    
    method jugadorActual() = self.aCualesAtacaElBicho().head()
    
    method aCualesAtacaElBicho() = [lider, seguidor1, seguidor2].filter({heroe => heroe.estoyVivo()})
	
    method heroes(_heroes) {
        heroes.addAll(_heroes)
    }
    
    method iniciar() {
        self.heroes(self.aCualesAtacaElBicho())
        teclado.estado(enCombate) 
    }

    method atacarCon(habilidad) {
        heroes.head().atacar(habilidad)
        heroes.remove(heroes.head())
        if (heroes.isEmpty()) 
            self.atacaElBicho()
    }
    

    method curar(){ 
        heroes.head().curar()
        heroes.remove(heroes.head())
        if (heroes.isEmpty()) 
            self.atacaElBicho()
    }
    

    method atacaElBicho() {
    	const habilidadDeAtaque = enemigo.elegirAtaque()
    	if(self.moririanCon(habilidadDeAtaque)){
    		game.clear()
			game.addVisualCharacter(perdiste)
    	}
        enemigo.atacar(habilidadDeAtaque)        
        self.iniciar()
    }
    
	method finDelCombate(){
		//game.schedule(3000 , {teclado.estado(enMovimiento)})
		teclado.estado(enMovimiento)
		heroes.clear()
	}
	
	method moririanCon(habilidadDeAtaque) = 
		self.aCualesAtacaElBicho().size() == 1 && 
		self.jugadorActual().vida() - self.jugadorActual().cuantoDanioMeHacen(habilidadDeAtaque) <= 0
	
}