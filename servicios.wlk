import empresa.*

class EmpresaDeServicios {
    const profesionales = #{}
    const clientes = #{}
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

//Etapa 2 - solicitantes

    method puedeSatisfacerA_(unSolicitante){
        return profesionales.any({p=>unSolicitante.puedeSerAtendidoPor(p)})
    }

//Etapa 4 - registro de trabajos hechos

    method darServicio(unSolicitante){
        //si el solicitante puede ser atendido (etapa 3),
        if(not unSolicitante.puedeSerAtendidoPor(self)){
            self.error("El solicitante no puede ser atendido por esta empresa.")
        }
        // 2. entonces elegir uno cualquiera de los profesionales que puede atenderlo
        var profesionalesCapaces = profesionales.filter({ p => unSolicitante.puedeSerAtendidoPorProfesional(p) })

        if (profesionalesCapaces.isEmpty()) {
            self.error("No hay profesionales disponibles en la empresa para este solicitante.")
        }
        // 3.  hacer que ese profesional cobre (etapa 2) su honorario por hora (etapa 1),
        var profesionalElegido = profesionalesCapaces.anyOne()
        profesionalElegido.cobrar(profesionalElegido.honorarios())
    
        /* 4. agregar al solicitante al conjunto de clientes de la empresa.*/
        clientes.add(unSolicitante)
    }

    method cuantosClienteTiene(){
        clientes.size()
    }

    method tieneComoClienteA(unSolicitante){
        clientes.contains(unSolicitante)
    }

//Desafío final - profesional poco atractivo

    method esPocoAtractivo(unProfesional){
// Para CADA provincia del profesional que estamos evaluando...
        return unProfesional.provincias().all({ prov => 
            // ... tiene que EXISTIR OTRO profesional en la empresa que:
            profesionales.any({ otro => 
                otro != unProfesional 
                and otro.provincias().contains(prov) 
                and otro.honorarios() < unProfesional.honorarios()
            })
        })
    }
}