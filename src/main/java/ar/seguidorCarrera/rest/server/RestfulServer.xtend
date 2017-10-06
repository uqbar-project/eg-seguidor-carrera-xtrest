package ar.seguidorCarrera.rest.server

import ar.edu.seguidorCarrera.domain.Carrera
import ar.edu.seguidorCarrera.domain.Materia
import ar.edu.seguidorCarrera.domain.Nota
import ar.seguidorCarrera.rest.dto.MateriaSinNotas
import java.util.List
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

/**
 * Servidor RESTful implementado con XtRest.
 */
@Controller
class RestfulServer {
    extension JSONUtils = new JSONUtils
    
    Carrera carrera
    
    new(Carrera carrera) {
        this.carrera = carrera
    }


    @Get("/materias")
    def getMaterias() {
        response.contentType = ContentType.APPLICATION_JSON
        
        val materias = carrera.materias.map [each | new MateriaSinNotas(each)]
        
        return ok(materias.toJson)
    }
    

    @Get("/materias/:nombre")
    def getMateria() {
        response.contentType = ContentType.APPLICATION_JSON

        val materia = carrera.buscarMateria(nombre)
        
        if (materia == null) {
            return notFound()
        } else {
            return ok(new MateriaSinNotas(materia).toJson)
        }
    }

    
    @Get("/materias/:nombreMateria/notas")
    def getNotas() {
        response.contentType = ContentType.APPLICATION_JSON

        val materia = carrera.buscarMateria(nombreMateria)
        
        if (materia == null) {
            return badRequest()
        } else {
            return ok(materia.notas.toJson)
        }
    }


    @Get("/materias/:nombreMateria/notas/:descripcionNota")
    def getNotas() {
        response.contentType = ContentType.APPLICATION_JSON

        val materia = carrera.buscarMateria(nombreMateria)
        
        if (materia == null) {
            return badRequest()
        } else {

            val nota = materia.buscarNota(descripcionNota)
            
            if (nota == null) {
                return notFound()
            } else {
                return ok(nota.toJson)
            }
        }
    }


    @Delete("/materias/:nombreMateria/notas/:descripcionNota")
    def deleteNota() {
        response.contentType = ContentType.APPLICATION_JSON

        val materia = carrera.buscarMateria(nombreMateria)
        
        if (materia == null) {
            return badRequest()
        } else {

            val nota = materia.buscarNota(descripcionNota)

            if (nota != null) {
                materia.eliminarNota(nota)
            }
            return ok()
        }
    }


    @Post("/materias/:nombreMateria/notas")
    def postNota(@Body String bodyConNota) {
        response.contentType = ContentType.APPLICATION_JSON
        
        val nota = bodyConNota.fromJson(Nota)
        val materia = carrera.buscarMateria(nombreMateria)
        
        if (materia == null) {
            return badRequest()
        } else {
            materia.agregarNota(nota)
            return ok()
        }
    }
    
}

