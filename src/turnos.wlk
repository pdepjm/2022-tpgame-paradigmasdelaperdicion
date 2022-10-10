import wollok.game.*
import heroes.*
import movimiento.*
import teclado.*
import enemigos.*

object turno {
    var heroes = []

    method heroes(_heroes) {
        heroes.addAll(_heroes)
    }
    
    method iniciar() {
        turno.heroes([lider, seguidor1, seguidor2])
        teclado.movimiento(false)
        teclado.combate(true)
    }

    method tocoletraG() {
        if (heroes.isEmpty()) {
            self.atacaElBicho()
        }
        heroes.head().heroe().atacar(cascotaso)
        heroes.remove(heroes.head())
    }
    method tocoletraH() {
        if (heroes.isEmpty()) {
            self.atacaElBicho()
        }
        heroes.head().atacar()
        heroes.remove(heroes.head())
    }
    method tocoletraJ() {
        if (heroes.isEmpty()) {
            self.atacaElBicho()
        }
        heroes.head().atacar()
        heroes.remove(heroes.head())
    }
    method atacaElBicho() {
        teclado.combate(false)
        bichito.atacar()        
        self.iniciar()
    }


}