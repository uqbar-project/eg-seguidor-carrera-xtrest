package ar.seguidorCarrera.rest.dto

import ar.edu.seguidorCarrera.domain.Materia
import ar.edu.seguidorCarrera.domain.Ubicacion
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class MateriaSinNotas {

    String nombreMateria
    Integer anioCursada
    String profesor 
    Ubicacion ubicacion
    Boolean estaAprobada

    new(Materia materia) {
        this.nombreMateria = materia.nombreMateria
        this.anioCursada = materia.anioCursada
        this.profesor = materia.profesor
        this.ubicacion = materia.ubicacion
        this.estaAprobada = materia.estaAprobada
    }
}