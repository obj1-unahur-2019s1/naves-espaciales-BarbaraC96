class NaveEspacial {
	var velocidad = 12000
	var direccion = 0	
	var combustible = 4000
	method velocidad(cuanto) { velocidad = cuanto }
	method acelerar(cuanto) { velocidad = (velocidad + cuanto).min(100000) }
	method desacelerar(cuanto) { velocidad -= cuanto }
	
	method irHaciaElSol() { direccion = 10 }
	method escaparDelSol() { direccion = -10 }
	method ponerseParaleloAlSol() { direccion = 0 }
	
	method acercarseUnPocoAlSol() { direccion += 1 }
	method alejarseUnPocoDelSol() { direccion -= 1 }
	
	method agregarCombustible(cuanto) {combustible += cuanto }
	method quitarCombustible(cuanto) { combustible -= cuanto }
	
	method prepararViaje() {self.agregarCombustible(30000)
		self.acelerar(5000)
	}
	
	method recibirAmenaza() {self.escapar()
		self.avisar()}
		
	method escapar() {}
	method avisar() {}
	method estaTranquila() {}
}

class NaveBaliza inherits NaveEspacial {
	var colorBaliza = "rojo"
	
	method cambiarColorDeBaliza(colorNuevo) { colorBaliza = colorNuevo }
	method color() = colorBaliza
	override method prepararViaje() {super() self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
	}
	override method escapar() { super() self.irHaciaElSol() }
    override method avisar() { super() self.cambiarColorDeBaliza("rojo") }
    method estaTranquila(colorNuevo) { self.cambiarColorDeBaliza(colorNuevo) }
} 

class NavePasajeros inherits NaveEspacial {
	var property cantidadDePasajeros = 0
	var property racionesDeBebidas = 0
	var property racionesDeComida = 0
	
	method cargarComida(cantidad) { racionesDeComida += cantidad }
	method descargarComida(cantidad) { racionesDeComida -= cantidad } 
	method cargarBebida(cantidad) { racionesDeBebidas += cantidad }
	method descargarBebida(cantidad) { racionesDeBebidas -= cantidad }
	
	override method prepararViaje() { super() self.cargarComida(4*cantidadDePasajeros)
		self.cargarBebida(6*cantidadDePasajeros)
		self.acercarseUnPocoAlSol()
	}
	override method escapar() { super() self.acelerar(velocidad) }
	override method avisar() { super() self.racionesDeComida(cantidadDePasajeros)
		self.racionesDeBebidas(2*cantidadDePasajeros)
	}
}

class NavesCombate inherits NaveEspacial {
	var property invisible = false 
	var property estaDesplegado = false
	const property menEmitidos = []
	
	method ponerseVisible() { invisible = true }
	method ponerseInvisible() { invisible = false }
	method estaInvisible() { return invisible } //devuelve, te dice si esta invisible
	
	method desplegarMisiles() { estaDesplegado = true }
	method replegarMisiles() { estaDesplegado = false }
	method misilesDesplegados() { return estaDesplegado }
	
	method emitirMensaje(mensaje) { menEmitidos.add(mensaje) }
	method mensajesEmitidos() { return menEmitidos }
	method primerMensajeEmitido() { return menEmitidos.first()}
	method ultimoMensajeEmitido() { return menEmitidos.last()}
	method esEscueta() { return not menEmitidos.any({mensaje => mensaje.size()>30})}
	method emitioMensaje(mensaje) { return menEmitidos.contains(mensaje) }
	//return menEmitidos.size()>0
	
	override method prepararViaje() { super() self.ponerseVisible()
		self.replegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en misión")
	}
	
	override method escapar() { super() self.acercarseUnPocoAlSol()
		self.acercarseUnPocoAlSol()
	} 
	override method avisar() { super() self.emitirMensaje("Amenaza recibida")}
	 override method estaTranquila() { super() self.estaDesplegado()}
}

class NavesHospital inherits NavePasajeros {
	var property quirofanosPreparados = false
	
	override method recibirAmenaza() { super() self.quirofanosPreparados(true) }
	override method estaTranquila() { super() self.quirofanosPreparados() }
}

class NavesDeCombateSigilosa inherits NavesCombate {

    override method escapar() { super() self.desplegarMisiles()
    	self.ponerseInvisible()
    }
     override method estaTranquila() { super() self.estaDesplegado()
     	self.invisible()
     }

}