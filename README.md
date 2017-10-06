# RESTful Web Services Demo en XTrest

Demostración de uso de [xtrest](https://github.com/uqbar-project/xtrest) para una API Rest para un [dominio](https://github.com/uqbar-project/eg-seguidor-carrera-domain-xtend/) con entidades anidadas (Carrera tiene Materia, que tiene Nota), para las cuales un DTO (MateriaSinNotas) demuestra cómo adaptar.


## Modo de uso

El servidor se levanta en el puerto 9000. 

Para ello, desde Eclipse:

1. Tener descargado también al [dominio branch ciu](https://github.com/uqbar-project/eg-seguidor-carrera-domain-xtend/tree/ciu).
2. Importar ambos proyectos en Eclipse como Maven project.
3. Ejecutar `ar.seguidorCarrera.rest.runnable.App`.
