import wollok.game.*
import turnos.*

class Bicho {
	//const daniosDeAtaquePosibles = [20, 30, 40, 50, 60, 75, 100, 200]
	const daniosDeAtaquePosibles = [20, 30, 40, 50, 60, 75]
    const property position = game.at(30, 3)
	var property vida
	const property nombre
	var property image = nombre + ".png"
	
	method elegirDanioDeAtaque() = daniosDeAtaquePosibles.anyOne()	

	method atacar(danioDeAtaque) {	
		turno.jugadorActual().recibirAtaque(danioDeAtaque)		
		self.image(nombre + "Ataca.png")		
		game.schedule(1000, {self.image(nombre + ".png")})
			
	}
	
	method seMuere() {
		self.image(nombre + "Muerto.png")
		game.schedule(3000 , {game.removeVisual(self)})
		
	}
	
	method recibirAtaque(danioDeAtaque, fuerzaDelHeroe) {
		vida -= self.cuantoDanioMeHacen(danioDeAtaque, fuerzaDelHeroe)
		if (vida <= 0) {
			self.seMuere()				
		}
	}
	
	method cuantoDanioMeHacen(danioDeAtaque, fuerzaDelHeroe) = danioDeAtaque * fuerzaDelHeroe
    
    method colisionConHeroe() {        
		turno.iniciar()	
    }
}

/*------------------------------INSTANCIACIONES-----------------------------------------------*/

const ectoplasma = new Bicho(nombre = "ectoplasma", vida = 1000)
const hongo = new Bicho (nombre="hongo", vida = 1500) 


