import empresa.*
import servicios.*

//Etapa 2 - solicitantes

class Solicitante{
    var puedeSerAtendidoPorProfesional = true

    method puedeSerAtendidoPor(unProfesional){
        return 
    }
    method noPuedeSerAtendido(){
        puedeSerAtendidoPorProfesional = false
    }

}

class Persona inherits Solicitante{
    const provincia 
    
    method provinciaDondeVive(){
        return provincia
    }
    override method puedeSerAtendidoPor(unProfesional){
        return unProfesional.puedeTrabajarEn() == self.provinciaDondeVive()
    }
}
class Institucion inherits Solicitante{
    const universidades = #{}

    override method puedeSerAtendidoPor(unProfesional){
        return universidades.contains({unProfesional.universidadDondeEstudio()})
    }
}
class Club inherits Solicitante{
    const provincias = #{}

    method provincias(){
        return provincias
    }
    override method puedeSerAtendidoPor(unProfesional){
        return provincias.any({unProfesional.puedeTrabajarEn()})
    }
}


