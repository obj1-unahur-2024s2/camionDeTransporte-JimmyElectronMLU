object camion {
    const property carga = [] 
    const tara = 1000

    method cargar(cosa) {
      self.carga().add(cosa)
    }

    method descargar(cosa) {
      if (self.carga().contains(cosa)){
        self.carga().remove(cosa)
      }
    }

    method pesoTotal(){
        return tara + self.carga().sum({cosa => cosa.peso()}) // la suma de las cargas podria ser un method aparte que sea pesoCargaTotal
    }

    method sonCargasImpares() = self.carga().all({cosa=> cosa.peso().odd()}) 
    //podriamos hacer un method  para los pesos de las cargas y compararlas directamente con el odd()
    // method pesosDeLaCarga return carga().map({c => c.peso()})   y luego    ... self.pesosDeLaCarga().all({e=> e.odd()})

    method algunaCosaPesa(valor) = self.carga().any({c => c.peso() == valor}) 

    method PrimerObjetoPeligroso(nivelPeligroso) {
        return self.carga().find({c => c.peligrosidad() == nivelPeligroso})
    }

    method obtenerElementosPeligrosos(nivelPeligroso) {
        return self.carga().filter({c => c.peligrosidad() >= nivelPeligroso})
    }

    method objetosQueSuperanPeligrosidadDe(cosa) {
        return self.carga().filter({c => c.peligrosidad() > cosa.peligrosidad()})
    }

    method estaExcedido() = self.pesoTotal() > 2500

    method puedeCircular(nivelMaximoPermitido){
        return !self.estaExcedido() and self.carga().all({c => c.peligrosidad() < nivelMaximoPermitido})
    }

    //method puedeCircular(nivelPeligrosidad) = !self.estaExcedido() and obtenerElementosPeligrosos(nivelPeligrosidad).isEmpty // esto porque el filter me crea otra lista y puedo utilizarla aca.
    
// method peligrosidadPermitida(nivelMaximoPermitido) = self.carga().all({c => c.peligrosdad() < nivelMaximoPermitido}) 
  
    method tieneCosaQuePesaEntre(valorMinimo, valorMaximo) {
        return !self.carga().isEmpty() and self.carga().any({c=>c.peso().between(valorMinimo, valorMaximo)})
    }

    method cosaMasPesada() {
      if (!self.carga().isEmpty())
        return self.carga().max({c=>c.peso()})
      else 
        return self.carga()
    }

} 
 
