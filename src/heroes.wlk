/*import wollok.game.*
import direcciones.*
import niveles.*


object lider {
	var property position = 
	
	method moverPara(direccion) {
		self.position(direccion.proximaPosicion(self.position(), self)) 
	}
}

class seguidores {
	var posicion 
	const distancia   // empecemos tirando 5 unidades menos que el lider
	

	method posicionSeguidor() {
		posicion = lider.posicion() + distancia
	}

	method moverPara(){
		posicion(self.posicionSeguidor())
	}
}


class Visual {
	var property image	
}
*/