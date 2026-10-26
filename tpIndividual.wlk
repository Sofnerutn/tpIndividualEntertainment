class Entrada {
 const banda
 const fecha 
 var impuesto
 method precioFinal () = 10000 + impuesto
}

class Asistente {
  const tipoDeAbono
  var descuento
  var property entradasObtenidas = #{}
  var property dineroDisponible

  method montoaPagar(unaEntrada){
    if(tipoDeAbono == "vip"){
      return unaEntrada.precioFinal() * ((100 - descuento) / 100)
    }
    
    else {
     return unaEntrada.precioFinal()
    }
  }
  method comprarEntrada(unaEntrada){
    if(self.dineroDisponible() < 0){
      self.error("No tiene suficiente dinero para comprar esta entrada")
    }
    else{
      dineroDisponible = dineroDisponible - self.montoaPagar(unaEntrada)
      entradasObtenidas.add(unaEntrada)
    }
  }
  method VerEntradasAñoAnterior(){
    entradasObtenidas.filter({unaEntrada => unaEntrada.fecha()%10000 == new Date().year()-1})
  }
  method nombresBandas (){
    entradasObtenidas.map({unaEntrada => unaEntrada.banda()})
  }
  method recaudacion(){
    entradasObtenidas.map({unaEntrada => unaEntrada.precioFinal()}).sum()
  }
  method cantidadDeEntradasCompradas()=entradasObtenidas.size()
   method bonificar() {
    if(tipoDeAbono == "vip"){
      descuento = descuento + 1
    }
  }
  
}

class Banda {
  const nombre
  var property canon
  method gastoExtra ()
  method popularidad()
  method presupuesto(){
    canon + self.gastoExtra()
  }
}

class BandaDeRock inherits Banda(canon = 1000000){
  var property solosDeGuitarra 
  override method gastoExtra () = 10000
  override method popularidad (){
    100*solosDeGuitarra
  }
}
class BandaDeTrap inherits Banda(){
  const tieneHielo
  override method gastoExtra() = 0
  override method popularidad (){
    if (tieneHielo){
      canon = 1000000
      return 1000
    }
    else{
      canon = 0
      return 0
    }
  }
}

class BandaDeIndie inherits Banda (){
  var property cantidadDeInstrumentos
  override method gastoExtra()=cantidadDeInstrumentos*500
  override method popularidad()=nombre.length()*3.14
}

object productora {
  var asistentes = #{}
  const todasLasEntradas = self.todasLasEntradasVendidas().flatten()
  const todasLasBandas = todasLasEntradas.map({unaEntrada => unaEntrada.banda()})
  method todasLasEntradasVendidas()=asistentes.map({unAsistente => unAsistente.entradasObtenidas()})
  method gananciaTotal(){
    const recaudacionTotal=(asistentes.map({unAsistente => unAsistente.recaudacion()})).sum()
    const bandasUnicas = todasLasBandas.asSet()
    const presupuestoTotal = bandasUnicas.map({unaBanda => unaBanda.presupuesto()}).sum()
    return recaudacionTotal - presupuestoTotal
  }
  method cantidadDeEntradasVendidas()=asistentes.map({unAsistente => unAsistente.cantidadDeEntradasCompradas()}).sum()
  method bandaMasPopular(){
    return todasLasBandas.max({unaBanda => todasLasBandas.occurrencesOf(unaBanda)}) 
  }
 
}