
import profesionales.*


class Profesional {
    const universidadDondeEstudio
    
    method universidadDondeEstudio(){
        return universidadDondeEstudio
    }

}
class ProfesionalVinculadoAUnaUniversidad inherits Profesional{

    method puedeTrabajarEn() {
        return [universidadDondeEstudio.provincia()]
    }
    method honorarios(){
        return universidadDondeEstudio.honorario()
    }

}
class ProfesionalesDelLitoral inherits Profesional{
    const provincias = #{"Entre Ríos", "Santa Fe", "Corrientes"}

    method puedeTrabajarEn() {
        return [provincias]
}
    method honorarios(){
        return 3000
    }
}
class ProfesionalesLibres inherits Profesional{
    var property  provincias = []
    var honorarios 
    
    method puedeTrabajarEn(){
        return provincias
    }
    method modificarLugar(nuevoLugar){
        provincias= nuevoLugar
    }
    method honorarios(){
        return honorarios
    }
    method modificarHonorarios(nuevoValor){
        honorarios = nuevoValor
    }

}


class Universidad{
    var provincia 
    var honorarioRecomendado 

    method provincia(){
        return provincia
    }
    method modificarProvincia(nuevaProvincia) {
        provincia = nuevaProvincia
    }

    method honorario(){
        return honorarioRecomendado
    }
    method honorario(nuevoValor){
        honorarioRecomendado = nuevoValor
    }

   //method provinciasHabilitadas(unaUniversidad)
       //return tipoDeProfesional.puedeTrabajarEn(unaUniversidad)
    
}






