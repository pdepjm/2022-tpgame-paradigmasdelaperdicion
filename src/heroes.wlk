
import wollok.game.*
import enemigos.*
import movimiento.*
import turnos.*

class Profesion {
	var nombre
	var vida = 100
	var property image = nombre + ".png"
	var fuerza 
	var defensa
	var curacion // numero de dos digitos
	
	method vida() = vida
	
	method enemigo() = turno.enemigo()

	method vida(cantidadDeVida) {
		vida = (vida + cantidadDeVida).min(100)
	}
	
	method atacar(habilidad) {	
		self.enemigo().recibirAtaque(habilidad, fuerza)
		self.image(nombre + "Ataca.png")
		game.schedule(1000 , {self.image(nombre + ".png")})
	}

	method seMuere() {
		self.image(nombre + "Muerto.png")
		game.schedule(2000, {self.image("invisible.png")})
	
	}
	
	method estoyVivo() = vida > 0
	
	method recibirAtaque(ataque) {
		vida -= self.cuantoDanioMeHacen(ataque)
		if (vida <= 0) 
			self.seMuere()
	}
		
	method cuantoDanioMeHacen(ataque) = ataque.danio() / defensa
	

	method curar() {
		var heroes = [lider, seguidor1, seguidor2] 
		var heroeACurar = heroes.filter({ unHeroe => unHeroe.estoyVivo() }).head()
		heroeACurar.vida(curacion)
		self.image(nombre + "Cura.png")
		game.schedule(1000 , {self.image(nombre + ".png")})
	}
}
class Caballero inherits Profesion(nombre = "caballero", fuerza = 1, defensa = 3, curacion = 15){}
class Doctor inherits Profesion(nombre = "doctor", fuerza = 2, defensa = 1, curacion = 20){}
class Leproso inherits Profesion(nombre = "leproso", fuerza = 4, defensa = 1, curacion = 10){}


const caballero = new Caballero()
const doctor = new Doctor()
const leproso = new Leproso()


class Habilidad {
	var property danio
}
const ataque1malo = new Habilidad(danio = 20)
const ataque2malo = new Habilidad(danio = 40)
const ataque3malo = new Habilidad(danio = 50)
const ataque4malo = new Habilidad(danio = 100)
const ataque5malo = new Habilidad(danio = 60)
const ataque6malo = new Habilidad(danio = 75)
const ataque7malo = new Habilidad(danio = 30)
const ataque8malo = new Habilidad(danio = 200)
const cascotaso = new Habilidad(danio = 15)







