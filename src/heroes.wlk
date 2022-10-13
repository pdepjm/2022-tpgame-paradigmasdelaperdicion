import wollok.game.*
import enemigos.*
import movimiento.*
import turnos.*

class Profesion {
	var vida = 100
	var property image
	var enemigo = turno.enemigo()
	var fuerza 
	var defensa 
	var curacion // numero de dos digitos
	 
	method atacar(habilidad) {	
		enemigo.recibirAtaque(habilidad, fuerza)
	}

	method seMuere() {
		game.say(lider, "LA QUEDE")
	}
	
	method estoyVivo() = vida > 0
	
	method recibirAtaque(ataque) {
		vida -= ataque.danio() / defensa
		if (vida <= 0) {
			self.seMuere()
		}
	}
	
	method curacionAccion() {
		vida = (vida + curacion).min(100)		
	}
}

const caballero = new Profesion(image = "caballero.png", fuerza = 2, defensa = 1, curacion = 10)
const doctor = new Profesion(image = "doctor.png", fuerza = 1, defensa = 2, curacion = 30)
const leproso = new Profesion(image = "leproso.png", fuerza = 1, defensa = 2, curacion = 10)


class Habilidad {
	var property danio
	
}



const cascotaso = new Habilidad(danio = 1000)
const glotoneria = new Habilidad(danio = 110)