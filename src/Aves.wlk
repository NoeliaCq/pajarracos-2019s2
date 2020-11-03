class Ave {
	method fuerza()	
	method recibirUnDisgusto()
	method esDebil() { return self.fuerza() < 1000	}
	method relajate()
	method estaConformeConLaIsla(isla)
	method comerDeLaIsla(isla)
}

class Aguilucho inherits Ave {
	var property velocidad = 20
	override method fuerza() {
		return if(velocidad <= 60) { 180 } else { velocidad * 3 }
	}
	override method recibirUnDisgusto() { velocidad *= 2 }
	
	override method relajate() { velocidad -= 10 }
	
	override method estaConformeConLaIsla(isla) {
		return isla.cantidadDeAlpiste() > 8
	}
	override method comerDeLaIsla(isla) {
		isla.cantidadDeAlpiste(isla.cantidadDeAlpiste() - 3)
		velocidad += 15
	}
}

class Albatros inherits Ave {
	var property peso = 4000
	var property masaMuscular = 600
	
	override method fuerza() {
		return if(peso < 6000) { masaMuscular } else { masaMuscular / 2 }
	}
	
	override method recibirUnDisgusto() { peso += 800 }
	
	method irAlGimnasio() { masaMuscular += 500 ; peso += 500 }
	
	override method relajate() { peso -= 300 }
	
	override method estaConformeConLaIsla(isla) {
		const avesMasFuertesQueYo = isla.avesEnLaIsla().filter({ave=> ave.fuerza() > self.fuerza()})
		return avesMasFuertesQueYo.size() >= 2
	}
	
	override method comerDeLaIsla(isla) {
		isla.cantidadDeMaiz(isla.cantidadDeMaiz() - 4)
		peso += 700
		masaMuscular += 700
	}
}

class Paloma inherits Ave {
	var property ira = 200
	
	override method fuerza() { return ira * 2 }
	
	override method recibirUnDisgusto() { ira += 300 }
	
	override method relajate() { ira -= 50 }
	
	override method estaConformeConLaIsla(isla) {
		return isla.cantidadDeAvesDebiles() <= 1
	}
	
	override method comerDeLaIsla(isla) {}
	
	method equilibrarse() {
		if(self.fuerza() <= 700) { self.recibirUnDisgusto() } else { self.relajate() }
	}
}

class AguiluchoColorado inherits Aguilucho {
	override method fuerza() {
		return super() + 400		
	}
}

class Torcaza inherits Paloma {
	var property huevos = 3
	
	override method fuerza() {
		return super() + huevos * 100
	}
	override method recibirUnDisgusto() { super() ; huevos += 1 }
}

class PalomaMontera inherits Paloma {
	var property topeDeFuerza = 2000
	
	override method fuerza() {
		return super().min(topeDeFuerza)
	}
}

class PalomaManchada inherits Paloma {
	var property nidos = []
	
	method cantidadDeNidos() { return nidos.size() }
	
	override method recibirUnDisgusto() { super() ; nidos.add(new Nido()) }
	
	override method relajate() { 
		if(self.cantidadDeNidos() <= 2) { super() } 
		else { nidos.forEach({nido=> nido.grosor(nido.grosor() + 1)}) }
		
	}
	
	method potenciaTotal() { return nidos.sum({nido=> nido.potencia()})}
	
	override method ira() { return ira + self.potenciaTotal() }
}

class Nido {
	var property grosor = 5
	var property resistencia = 3
	
	method potencia() { return (grosor * resistencia) + 20 }
}






