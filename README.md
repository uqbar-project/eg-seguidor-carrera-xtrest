# RESTful Web Services Demo en XTrest

Demostración de uso de [xtrest](https://github.com/uqbar-project/xtrest) para una API Rest para un [dominio](https://github.com/uqbar-project/eg-seguidor-carrera-domain-xtend/) con entidades anidadas (Carrera tiene Materia, que tiene Nota), para las cuales un DTO (MateriaSinNotas) demuestra cómo adaptar.


## Modo de uso

El servidor se levanta en el puerto 9000. Dos formas de hacerlo:

### Opción A: Desde Eclipse

1. Importar este proyecto en Eclipse como **Maven project**.
2. Ejecutar `ar.seguidorCarrera.rest.runnable.App`

### Opción B: Desde línea de comandos

1. Generar jar con dependencias: `mvn clean compile assembly:single`
2. Ejecutar el jar generador: `java -jar target/seguidorCarrera-xtrest-0.0.1-SNAPSHOT-jar-with-dependencies.jar`

Esta opción requiere menos recursos de sistema porque no es necesario ejecutar Eclipse.
# eg-seguidor-carrera-xtrest
