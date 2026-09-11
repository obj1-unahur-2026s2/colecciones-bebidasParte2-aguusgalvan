object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}
object licuado {

  var nutrientes = []

  method rendimientoQueOtorga(cantidad) =
    nutrientes.sum() * cantidad / 1000

  method agregarNutriente(nutriente) {
    nutrientes.add(nutriente)
  }
}
object aguaSaborizada {

  var bebida = whisky

  method rendimientoQueOtorga(cantidad) =
    1 + bebida.rendimientoQueOtorga(cantidad / 4)

  method cambiarBebida(nuevaBebida) {
    bebida = nuevaBebida
  }
}
object coctel {

  var bebidas = []

  method rendimientoQueOtorga(cantidad) =
    bebidas.map { bebida => bebida.rendimientoQueOtorga(cantidad / bebidas.size()) }.product()

  method agregarBebida(bebida) {
    bebidas.add(bebida)
  }
}