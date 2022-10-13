import wollok.game.*
import heroes.*
import movimiento.*
import teclado.*
import enemigos.*

object turno {
    var heroes = []
    var property enemigo = bichito

    method heroes(_heroes) {
        heroes.addAll(_heroes)
    }
    
    method iniciar() {
        self.heroes([lider, seguidor1, seguidor2].filter({heroe => heroe.estoyVivo()}))
        teclado.estado(enCombate)
    }

    method tocoletra(habilidad) {
        if (heroes.isEmpty()) {
            self.atacaElBicho()
        }
        heroes.head().atacar(habilidad)
        heroes.remove(heroes.head())
    }

    method atacaElBicho() {
        enemigo.atacar()        
        self.iniciar()
    }
    
	method finDelCombate(){
		teclado.estado(enMovimiento)
		heroes.clear()
	}

}