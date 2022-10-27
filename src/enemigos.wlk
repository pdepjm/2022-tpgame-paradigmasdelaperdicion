import wollok.game.*
import heroes.*
import movimiento.*
import teclado.*
import turnos.*
import niveles.*

class Bicho {
	const habilidades = [ataque1malo, ataque2malo, ataque3malo, ataque4malo,ataque5malo,ataque6malo,ataque7malo,ataque8malo]
    const property position = game.at(30, 3)
	var property vida = 1000
	var property estoyVivo = true
	var property nombre
	var property image = nombre + ".png"
	
	method elegirAtaque() = habilidades.anyOne()	

	method atacar(habilidadDeAtaque) {	
		turno.jugadorActual().recibirAtaque(habilidadDeAtaque)		
		self.image(nombre + "Ataca.png")		
		game.schedule(1000, {self.image(nombre + ".png")})
			
	}
	
	method seMuere() {
		estoyVivo = false
		self.image(nombre + "Muerto.png")
		game.schedule(3000 , {removedorDeImagenes.eliminarVisual(self)})
		
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

const ectoplasma = new Bicho(nombre = "ectoplasma")
object hongo inherits Bicho (nombre="hongo", vida=1500) {
	
	
	override method seMuere() {		
		super()
		game.clear()
		game.addVisualCharacter(ganaste)
	}
}

class BarraBicho inherits BarraDeVida {

	override method position() = personaje.position().up(8)
}


object barraHongo inherits BarraBicho(personaje = hongo){
	override method numeroQueCorresponde() = (personaje.vida() / 150).roundUp().toString()
}
object barraEctoplasma inherits BarraBicho(personaje = ectoplasma){
	override method numeroQueCorresponde() = (personaje.vida() / 100).roundUp().toString()
}
