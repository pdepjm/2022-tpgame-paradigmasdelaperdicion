import wollok.game.*
import heroes.*
import movimiento.*
import teclado.*
import turnos.*

class Bicho {
	//var habilidades = []
    const property position = game.at(30, 5)
	var property vida = 100
	//var enemigos = [lider, seguidor1, seguidor2]
	var estoyVivo = true
	var property imagen

	method image() = imagen
	/*method atacar() {	
		var habilidadDeAtaque = habilidades.anyOne()	
		enemigos.filter({ enimgo => enemigo.estoyVivo() }).head().recibirAtaque(habilidadDeAtaque)
	}*/
	
	method seMuere() {
		estoyVivo = false
		//imagen = "muerto.png"//lider muerto
		game.say(self, "ME MORI")
	}
	
	method recibirAtaque(ataque) {
		vida -= ataque.danio() 
		if (vida <= 0) {
			self.seMuere()
		}
	}
    
    method colisionConHeroe() {
        lider.mover(izquierda,6)
		turno.iniciar()
     	
    }


	


}

const bichito = new Bicho(imagen = "ectoplasma.png")
