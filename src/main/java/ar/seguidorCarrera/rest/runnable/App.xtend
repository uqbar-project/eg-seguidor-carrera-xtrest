package ar.seguidorCarrera.rest.runnable

import ar.edu.seguidorCarrera.dummyData.DummyData
import ar.seguidorCarrera.rest.server.RestfulServer
import org.uqbar.xtrest.api.XTRest

class App {
	
	def static void main(String[] args) {
		val carrera = new DummyData().crearCarreraDummy

        XTRest.startInstance(9000, new RestfulServer(carrera))
    }
	
}