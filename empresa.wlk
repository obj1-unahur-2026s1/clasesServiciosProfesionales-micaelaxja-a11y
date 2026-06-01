
import profesionales.*


class Profesional {
    const universidadDondeEstudio
    var property horas 
    var property costoPorHora
    var tipo 
    var property  honorario
    
    method universidadDondeEstudio(){
        return universidadDondeEstudio
    }

    method honorario(){
        return 
    }
    method honorario(nuevoValor){
        honorario = nuevoValor
    }

}

class Universidad{
    var provincia 
    var honorario
    var property horas
    var property  tipoDeProfesional =[]

    method honorario(){
        return self.precioPorHora() * self.horas()
    }

    method provincia(){
        return provincia
    }

    method cambiarProvincia(nuevaProvincia){
        provincia = nuevaProvincia
    }

    method precioPorHora(){
        return honorario * horas
    }
    method provinciasHabilitadas(){
        
    }
}

object vinculadoAUnaUniversidad {
    
    method puedeTrabajarEn(unaUniversidad) {
        return unaUniversidad.provincia()
    }
    method honorarios(unaUniversidad){
        return unaUniversidad.honorario()
    }

}

object profesionalesDelLitoral{
    const provincias = #{"Entre Rios", "Santa fe", "Corrientes"}



    method puedeTrabajarEn() {
        return provincias
}
    method honorarios(unaUniversidad){
        return 3000
    }
}

object profesionalesLibres{
    var provincia = "Salta"
    var honorarios = 10
    var universidadHabilitada = "Universidad de Hurligham"
    
    method puedeTrabajarEn(){
        return provincia
    }
    method modificarLugar(nuevoLugar){
        provincia = nuevoLugar
    }
    method honorarios(unaUniversidad){
        return honorarios
    }
    method modificarHonorarios(nuevoValor){
        honorarios = nuevoValor
    }
    method universidadHabilitada(){
        return universidadHabilitada
    }
    method universidadHabilitada(nuevaUni){
        universidadHabilitada = nuevaUni
    }
}