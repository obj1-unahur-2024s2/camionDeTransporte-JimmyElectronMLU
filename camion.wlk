object camion {
    const property carga = [] 
    var tara = 1000

    method cargar(cosa) {
      self.carga().add(cosa)
    }

    method descargar(cosa) {
      if (self.carga().contains(cosa)){
        self.carga().remove(cosa)
      }
    }

    method pesoTotal(){
        return tara + self.carga().sum(cosa.peso())
    }

    method cargasImpares() = self.carga().all({cosa=> cosa.peso().odd()}) 

    method algunaCosaPesa(valor) = self.carga().any({c => c.peso() == valor}) 

    method PrimerObjetoPeligroso(nivelPeligroso) {
        return self.carga().find({c => c.peligrosidad() == nivelPeligroso})
    }

    method obtenerElementosPeligrosos(nivelPeligroso) {
        return self.carga().filter({c => c.peligrosidad() >= nivelPeligroso})
    }

    method objetosQueSuperanPeligrosidad(cosa) {
        return self.carga().filter({c => c.peligrosidad() > cosa.peligrosidad()})
    }

    method estaExcedido() = self.pesoTotal() > 2500

    method puedeCircular(nivelMaximoPermitido){
        return !self.estaExcedido() and self.carga().all({c => c.peligrosidad() < nivelMaximoPermitido})
    }
    
// method peligrosidadPermitida(nivelMaximoPermitido) = self.carga().all({c => c.peligrosdad() < nivelMaximoPermitido}) 

} 
 
