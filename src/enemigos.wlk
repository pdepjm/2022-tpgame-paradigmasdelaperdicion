import wollok.game.*
import heroes.*
import movimiento.*
import teclado.*
import turnos.*
import niveles.*

class Bicho {
	const habilidades = [glotoneria, ataque2malo, ataque3malo, ataque4malo]
    const property position = game.at(30, 5)
	var property vida = 1000
	const enemigos = [lider, seguidor1, seguidor2]
	var property estoyVivo = true
	var property nombre
	var property image = nombre + ".png"

	method atacar() {
		const aQuienAtaco = enemigos.filter({ enemigo => enemigo.estoyVivo()})
		
		const habilidadDeAtaque = habilidades.anyOne()	
		
		if (aQuienAtaco.size() == 1 && aQuienAtaco.head().vida() - aQuienAtaco.head().cuantoDanioMeHacen(habilidadDeAtaque) <= 0){
			game.clear()
			game.addVisualCharacter(perdiste)
		}
		
		aQuienAtaco.head().recibirAtaque(habilidadDeAtaque)
		
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

object hongo inherits Bicho (nombre="hongo") {
	override method seMuere() {		
		super()
		game.clear()
		game.addVisualCharacter(ganaste)
	}
}

class BarraBicho inherits BarraDeVida {

	override method position() = personaje.position().up(8)
	
	override method numeroQueCorresponde() = (personaje.vida() / 100).roundUp().toString()
}

const barraEctoplasma = new BarraBicho(personaje = ectoplasma)
const barraHongo = new BarraBicho(personaje = hongo)

const ectoplasma = new Bicho(nombre = "ectoplasma")
