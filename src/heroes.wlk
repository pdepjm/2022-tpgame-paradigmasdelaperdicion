import wollok.game.*
import direcciones.*
import niveles.*
import movimiento.*

class Heroe {
	//var habilidades = []
	var vida = 100
	var estoyVivo = true
	var property image
	//var enemigo

	method atacar() {	
		enemigo.recibirAtaque(habilidadDeAtaque)
	}

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

var doctor = new Heroe(image = "doctor.png")
var leproso = new Heroe(image = "leproso.png")