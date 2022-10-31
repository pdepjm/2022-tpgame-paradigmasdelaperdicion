
import wollok.game.*
import heroes.*
import bichos.*
import turnos.*
import estadosEventosDirecciones.*

class BarraDeVida {
	var personaje

	method image() {
        const stringVida = self.numeroQueCorresponde()
         if (stringVida == "0") 
            return "invisible.png"
         else
        	return "BarraVida" + stringVida + ".png"
    }
	
	method position() = personaje.position().down(1) 

	method numeroQueCorresponde() = (personaje.vida() / 10).roundUp().toString()
}

class BarraBicho inherits BarraDeVida {

	override method position() = personaje.position().up(8)
}

/*------------------------------INSTANCIACIONES-----------------------------------------------*/

const barraLider = new BarraDeVida(personaje = lider)
const barraSeguidor1 = new BarraDeVida(personaje = seguidor1)
const barraSeguidor2 = new BarraDeVida(personaje = seguidor2)

object barraHongo inherits BarraBicho(personaje = hongo){
	override method numeroQueCorresponde() = (personaje.vida() / 150).roundUp().toString()
}

object barraEctoplasma inherits BarraBicho(personaje = ectoplasma){
	override method numeroQueCorresponde() = (personaje.vida() / 100).roundUp().toString()
}

/*---------------------------------------FLECHA-----------------------------------------------*/

object flecha {
	
	method image() = "flecha.png" //flecha.png
	method position() = turno.jugadorQueLeTocaAtacar().position().up(5)
}

/*-----------------------------------INSTRUCCIONES--------------------------------------------*/

object instrucciones {
	
	method image() = configuradorDeEventosYEstados.estado().instrucciones()
	
	method position() = game.at(8, 25) // ahora vemos
	
	
}









