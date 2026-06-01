import empresa.*

class EmpresaDeServicios {
    const profesionales = #{}
    const honorarioDeReferencia


    method honorario(){
    return honorarioDeReferencia
    }

    method cuantosEstudiaronEn(unaUni){
        return self.profesionalesDeLaUni(unaUni).sum()
    }

    method profesionalesDeLaUni(unaUni){
        return profesionales.filter({p=>p.universidadDondeEstudio() == unaUni})
    }

}