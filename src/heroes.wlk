
import wollok.game.*
import turnos.*

class Jugador {
    var property profesion 
	
	method vida()= profesion.vida()
	
	method fuerza()= profesion.fuerza()
	
	method vida(_vida)= profesion.vida(_vida)

	method image() = profesion.image()
	
	method estoyVivo() = profesion.estoyVivo()
	
	method atacar() = profesion.atacar()
	
	method danioDeAtaqueHeroe() = profesion.danioDeAtaqueHeroe()

	method curar() = profesion.curar()
	 
	method recibirAtaque(danioDeAtaque) = profesion.recibirAtaque(danioDeAtaque)
	
	method cuantoDanioMeHacen(danioDeAtaque) = profesion.cuantoDanioMeHacen(danioDeAtaque)
}

object lider inherits Jugador(profesion = caballero) {
    var property position = game.at(20, 3)

    method mover(direccion,cantidad) {
		position = direccion.siguientePosicion(self.position(), cantidad)        
	}
	
	method moverAlInicio(){
		position = game.at(20,3)
	}	
}

class Seguidor inherits Jugador {
    var desfasaje
    
    method desfasaje() = desfasaje

	method position() = lider.position().left(desfasaje)    
}

/*--------------------------------------------------------------------------------------------*/

class Profesion {
	const nombre
	var property vida = 100
	var property image = nombre + ".png"
	const property danioDeAtaqueHeroe = 15
	const property fuerza 
	const defensa
	const curacion // numero de dos digitos
	
	method enemigo() = turno.enemigo()

	method vida(cantidadDeVida) {
		vida = (vida + cantidadDeVida).min(100)
	}
	
	method atacar() {	
		self.enemigo().recibirAtaque(danioDeAtaqueHeroe, fuerza)
		self.image(nombre + "Ataca.png")
		game.schedule(1000 , {self.image(nombre + ".png")})
	}

	method seMuere() {
		self.image(nombre + "Muerto.png")
		game.schedule(2000, {self.image("invisible.png")})	
	}
	
	method estoyVivo() = vida > 0
	
	method recibirAtaque(danioDeAtaque) {
		vida -= self.cuantoDanioMeHacen(danioDeAtaque)
		if (vida <= 0) 
			self.seMuere()
	}
		
	method cuantoDanioMeHacen(danioDeAtaque) = danioDeAtaque / defensa	

	method curar() {
		turno.jugadorActual().vida(curacion)
		self.image(nombre + "Cura.png")
		game.schedule(1000 , {self.image(nombre + ".png")})
	}
}

/*------------------------------INSTANCIACIONES-----------------------------------------------*/

const caballero = new Profesion(nombre = "caballero", fuerza = 1, defensa = 3, curacion = 15)
const doctor = new Profesion(nombre = "doctor", fuerza = 2, defensa = 1, curacion = 20)
const leproso = new Profesion(nombre = "leproso", fuerza = 4, defensa = 1, curacion = 10)

const seguidor1 = new Seguidor(desfasaje = 6, profesion = doctor)
const seguidor2 = new Seguidor(desfasaje = 12, profesion = leproso)