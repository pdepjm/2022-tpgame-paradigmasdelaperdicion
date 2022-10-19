import wollok.game.*
import heroes.*
import movimiento.*
import teclado.*
import turnos.*

class Bicho {
	var habilidades = [glotoneria]
    const property position = game.at(30, 5)
	var property vida = 1000
	var enemigos = [lider, seguidor1, seguidor2]
	var property estoyVivo = true
	var property nombre
	var property image = nombre + ".png"

	method atacar() {	
		var habilidadDeAtaque = habilidades.anyOne()	
		enemigos.filter({ enemigo => enemigo.estoyVivo() }).head().recibirAtaque(habilidadDeAtaque)
		self.image(nombre + "Ataca.png")
		//game.schedule(3000, self.image(nombre + ".png"))
	}
	
	method seMuere() {
		estoyVivo = false
		game.say(self, "ME MORI")
		//game.schedule(3000 ,game.removeVisual(self))
	}
	
	method recibirAtaque(ataque, fuerzaDelHeroe) {
		vida -= ataque.danio()  * fuerzaDelHeroe
		if (vida <= 0) {
			self.seMuere()
			turno.finDelCombate()	
		}
	}
    
    method colisionConHeroe() {
        lider.mover(izquierda,6)
        turno.enemigo(self)
		turno.iniciar()	
    }

}

const bichito = new Bicho(nombre = "ectoplasma")
