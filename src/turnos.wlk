
import wollok.game.*
import heroes.*
import movimiento.*
import teclado.*
import enemigos.*
import niveles.*

object turno {
    var heroes = []
    var property enemigo = ectoplasma
	
    method heroes(_heroes) {
        heroes.addAll(_heroes)
    }
    
    method iniciar() {
        self.heroes([lider, seguidor1, seguidor2].filter({heroe => heroe.estoyVivo()}))
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
        enemigo.atacar()        
        self.iniciar()
    }
    
	method finDelCombate(){
		//game.schedule(3000 , {teclado.estado(enMovimiento)})
		teclado.estado(enMovimiento)
		heroes.clear()
	}
	
	
}