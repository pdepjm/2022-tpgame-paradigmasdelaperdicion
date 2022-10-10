import wollok.game.*
import enemigos.*
import movimiento.*

class Heroe {
	//var habilidades = []
	var vida = 100
	var property estoyVivo = true
	var property image
	var enemigo = bichito
 
	method atacar(habilidad) {	
		enemigo.recibirAtaque(habilidad)
	}

	method seMuere() {
		estoyVivo = false
		game.say(lider, "LA QUEDE")
	}
	
	method recibirAtaque(ataque) {
		vida -= ataque.danio() 
		if (vida <= 0) {
			self.seMuere()
		}
	}
}

class Habilidad {
	var property danio
}

const cascotaso = new Habilidad(danio = 20)
const glotoneria = new Habilidad(danio = 110)

const caballero = new Heroe(image = "caballero.png")
const doctor = new Heroe(image = "doctor.png")
const leproso = new Heroe(image = "leproso.png")