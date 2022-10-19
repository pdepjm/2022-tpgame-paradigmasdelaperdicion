import wollok.game.*
import enemigos.*
import movimiento.*
import turnos.*

class Profesion {
	var nombre
	var vida = 100
	var property image = nombre + ".png"
	var enemigo = turno.enemigo()
	var fuerza 
	var defensa 
	var curacion // numero de dos digitos
	
	method vida() = vida

	method vida(cantidadDeVida) {
		vida = (vida + cantidadDeVida).min(100)
	}
	
	method atacar(habilidad) {	
		enemigo.recibirAtaque(habilidad, fuerza)
		self.image(nombre + "Ataca.png")
		game.schedule(3000 , self.image(nombre + ".png"))
	}

	method seMuere() {
		//game.say(lider, "LA QUEDE")
		self.image(nombre + "Muerto.png")
		game.schedule(3000, self.image("invisible.png"))
	}
	
	method estoyVivo() = vida > 0
	
	method recibirAtaque(ataque) {
		vida -= ataque.danio() / defensa
		if (vida <= 0) {
			self.seMuere()
		}
	}
	
	method curar() {
		var heroes = [lider, seguidor1, seguidor2] //Podria estar polemico
		var heroeACurar = heroes.filter({ unHeroe => unHeroe.estoyVivo() }).head()
		heroeACurar.vida(curacion)
		self.image(nombre + "Cura.png")
		game.schedule(3000 , self.image(nombre + ".png"))
	}
}

const caballero = new Profesion(nombre = "caballero", fuerza = 2, defensa = 1, curacion = 10)
const doctor = new Profesion(nombre = "doctor", fuerza = 1, defensa = 2, curacion = 30)
const leproso = new Profesion(nombre = "leproso", fuerza = 1, defensa = 2, curacion = 10)


class Habilidad {
	var property danio
	
}

const cascotaso = new Habilidad(danio = 10)
const glotoneria = new Habilidad(danio = 10)