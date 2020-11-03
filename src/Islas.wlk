class Isla {
	var property avesEnLaIsla = []
	var property cantidadDeAlpiste = 10
	var property cantidadDeMaiz = 10
	
	method agregarAve(ave) {
		avesEnLaIsla.add(ave)
	}
	method agregarAves(listaDeAves) {
		avesEnLaIsla.addAll(listaDeAves)
	}
	method sacarAve(ave) {
		avesEnLaIsla.remove(ave)
	}
	method avesDebiles() {
		return avesEnLaIsla.filter({ave=> ave.esDebil()})
	}
	method cantidadDeAvesDebiles() {
		return self.avesDebiles().size()
	}
	method fuerzaTotal() {
		return avesEnLaIsla.sum({ave=> ave.fuerza()})
	}
	method esRobusta() {
		return avesEnLaIsla.all({ave=> ave.fuerza() > 300 })
	}
	method huboUnTerremoto() { 
		avesEnLaIsla.forEach({ave=> ave.recibirUnDisgusto()})
	}
	method huboUnaTormenta() {
		self.avesDebiles().forEach({ave=> ave.recibirUnDisgusto()})
	}
	method posiblesAvesCapitanas() {
		return avesEnLaIsla.filter({ave=> ave.fuerza().between(1000, 3000)})
	}
	method aveCapitana() {
		return self.posiblesAvesCapitanas().max({ave=> ave.fuerza()})
	}
	method sesionDeRelax() {
		avesEnLaIsla.forEach({ave=> ave.relajate()})
	}
	method estaEnPaz() {
		return avesEnLaIsla.all({ave=> ave.estaConformeConLaIsla(self)})
	}
	method alimentarALasAves() {
		avesEnLaIsla.forEach({ave=> ave.comerDeLaIsla(self)})
	}
}