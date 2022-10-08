import wollok.game.*
import enemigos.*
import movimiento.*

class Heroe {
	//var habilidades = []
	var vida = 100
	var estoyVivo = true
	var property image
	//var enemigo
 /* 
	method atacar() {	
		enemigo.recibirAtaque(habilidadDeAtaque)
	}*/

	method seMuere() {
		estoyVivo = false
		image = "muerto.png"
	}
	
	method recibirAtaque(ataque) {
		vida -= ataque.danio() 
		if (vida <= 0) {
			self.seMuere()
		}
	}
}

/*
class Habilidades {
	var property danio
	

}

*/
const caballero = new Heroe(image = "caballero.png")
const doctor = new Heroe(image = "doctor.png")
const leproso = new Heroe(image = "leproso.png")