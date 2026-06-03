import empresa.*

class EmpresaDeServicios {
    const profesionales = #{}
    const honorarioDeReferencia


    method honorario(){
    return honorarioDeReferencia
    }
    method ingresarProfesional(unProfesional){
        profesionales.add(unProfesional)
    }

    method cuantosEstudiaronEn(unaUni){
        return profesionales.count({p=> p.universidadDondeEstudio() == unaUni})
    }

    method profesionalesDeLaUni(unaUni){
        return profesionales.filter({p=>p.universidadDondeEstudio() == unaUni})
    }
    method profesionalesCaros(){
        return profesionales.filter({
                p=>p.honorarios() > self.honorario()
                }).asList()
    }
    method universidadesFormadoras(){
        return profesionales.map({p=>p.universidadDondeEstudio()}).asSet().asList()
    }
    method profesionalMasBarato(){
        return profesionales.min({p=>p.honorarios()})
        
    }
//ningún profesional está habilitado para más de tres provincias, o lo que es equivalente, todos trabajan en a lo sumo tres provincias).
    method esDeGenteAcotada(){
        return profesionales.all({p=>p.puedeTrabajarEn().size() <= 3})
    }

}