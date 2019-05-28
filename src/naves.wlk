class NaveEspacial {
	var velocidad = 0
	var direccion = 0	
	var combustible 
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
}

class NaveBaliza inherits NaveEspacial {
	var colorBaliza = "rojo"
	
	method cambiarColorDeBaliza(colorNuevo) { colorBaliza = colorNuevo }
	method color() = colorBaliza
	
	
}

class NavePasajeros inherits NaveEspacial {
	var property cantidadDePasajeros = 0
	var property racionesDeBebidas = 0
	var property racionesDeComida = 0
	
	method cargarComida(cantidadC) { racionesDeComida += cantidadC }
	method descargarComida(cantidadC) { racionesDeComida -= cantidadC } 
	method cargarBebida(cantidadB) { racionesDeBebidas += cantidadB }
	method descargarBebida(cantidadB) { racionesDeBebidas -= cantidadB }
	
}

class NavesCombate inherits NaveEspacial {
	var property invisible = false 
	var property estaDesplegado = false
	
	
	method ponerseVisible() { invisible = true }
	method ponerseInvisible() { invisible = false }
	method estaInvisible() { return invisible } //devuelve, te dice si esta invisible
	
	method desplegarMisiles() { estaDesplegado = true }
	method replegarMisiles() { estaDesplegado = false }
	method misilesDesplegados() { return estaDesplegado }
	
	method emitirMensaje(mensaje) {}
	method mensajesEmitidos() {}
	method primerMensajeEmitido() {}
	method ultimoMensajeEmitido() {}
	method esEscueta() {}
	method emitioMensaje(mensaje) {}
	
}