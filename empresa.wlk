
import profesionales.*


class Profesional {
    const universidadDondeEstudio
    
    method universidadDondeEstudio(){
        return universidadDondeEstudio
    }


}
class ProfesionalVinculadoAUnaUniversidad inherits Profesional{
    var donacion = 0

    method puedeTrabajarEn() {
        return [universidadDondeEstudio.provincia()]
    }
    method honorarios(){
        return universidadDondeEstudio.honorario()
    }
//Etapa 3 - cobros

    method cobrar(unImporte){
        donacion = donacion / 2
        universidadDondeEstudio.registrarDonacion(donacion)
        
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

    //Etapa 3 - cobros
    method cobrar(unImporte){
        asociacionProfesionalesDelLitoral.registrar(unImporte)
    }
}
class ProfesionalesLibres inherits Profesional{
    var property  provincias = []
    var honorarios 
    var totalRecaudado = 0
    
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

    //Etapa 3 - cobros
    method cobrar(unImporte){
        
        totalRecaudado = totalRecaudado + unImporte
    }
    method totalRecaudado(){
        return totalRecaudado
    }
    method pasarDinero(otroProfesional, unaCantidad){
        if(unaCantidad > totalRecaudado){
            self.error("No tengo dinero suficiente para pasar")
        }
        self.totalRecaudado() - unaCantidad
        otroProfesional.cobrar(unaCantidad)
    }

}

object asociacionProfesionalesDelLitoral {
    var donacion = 0

    method registrar(unImporte){ //setter
        donacion= donacion + unImporte
    }
    method totalRegistrado(){ //getter
        return donacion
    }
}


class Universidad{
    var provincia 
    var honorarioRecomendado 
    var totalDonaciones = 0

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
    method totalDonaciones(){ //getter
        return totalDonaciones 
    }

    method registrarDonacion(unImporte){ // setter
        totalDonaciones = totalDonaciones + unImporte


    }

   //method provinciasHabilitadas(unaUniversidad)
       //return tipoDeProfesional.puedeTrabajarEn(unaUniversidad)
    
}






