object knightRider {
   
    method peso(){
        return 500
    }
    method peligrosidad() {
      return 10
    }

}

object bumblebee {
    var property modo = auto

    method peso() {
      return 800
    }

    method peligrosidad() {
      return modo.peligrosidad()
    }

}

object auto {
  method peligrosidad() {
    return 15
  }
}

object robot {
  method peligrosidad() {
    return 30
  }
}

object paqueteLadrillos {
    var property cantidadLadrillos = 0

    method peso() {
      return self.cantidadLadrillos() * 2
    }

    method peligrosidad() = 2
}

object arena {
    var property peso = 0

    method peligrosidad() {
      return 1
    } 
}

object bateria {
    var tieneMisiles = true
    
    method cambiarEstadoMisil() {
      tieneMisiles = !tieneMisiles
    }

    method tieneMisiles() = tieneMisiles

    method peso() {
      if (tieneMisiles)
        return 300
      else
        return 200
    }

    method peligrosidad() {
      if (tieneMisiles)
        return 100
      else
        return 0
    }

}

object contenedor {
    const property cosasContenidas = []

    method peso() {
      return 100 + self.cosasContenidas().sum({ e => e.peso()})
    }  

    method agregarCosa(cosa) {
      self.cosasContenidas().add(cosa)
    }

    method quitarCosa(cosa) {
      self.cosasContenidas().remove(cosa)
    }

    method objetoMasPeligroso() {
       return self.cosasContenidas().max({e=>e.peligrosidad()})
    }

    method peligrosidad() {
      if (!self.cosasContenidas().isEmpty())
        return self.objetoMasPeligroso().peligrosidad()
      else
        return 0
    }
}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() { 
       return 200
    }  
}

object embalaje {
    var cosaEmbalada = paqueteLadrillos

    method cosaAEmbalar(cosa) {
      cosaEmbalada = cosa
    }
    method peso() {
      return cosaEmbalada.peso()
    }
    method peligrosidad() {
      return cosaEmbalada.peligrosidad() * 1.5
    }
}


