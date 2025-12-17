# Proyecto final de la microcredencial Python C1 de la UOC

## Resumen

Este es el proyecto final de la microcredencial Python C1 de la UOC hecho por greusr

## Enunciado

El enunciado del ejercicio es el siguiente.

> Una red de clínicas dentales ha decidido modernizar sus operaciones mediante la creación de una aplicación a medida que permita gestionar las citas de los pacientes y la disponibilidad de los odontólogos.
>
> Actualmente, estos procesos se realizan de forma manual, lo que genera errores frecuentes, duplicidad de información y una falta de trazabilidad en los procesos administrativos.
>
> Como desarrollador backend asignado al proyecto, tu misión será diseñar y construir una solución integral, robusta y escalable, capaz de cubrir todas las necesidades del nuevo sistema de gestión denominado OdontoCare.
>
> Para ello, se espera el desarrollo de una API RESTful profesional, aplicando buenas prácticas de arquitectura de software, principios de seguridad, y una adecuada persistencia de datos.
>
> Este ejercicio está alineado con los conocimientos adquiridos durante el curso. A este nivel, ya cuentan con conocimientos avanzados, por lo que se espera una solución bien fundamentada, coherente y técnicamente sólida.
>
> Ánimo a ustedes, que son el grupo de estudiantes con el nivel más avanzado de la Escuela de Programación, a divertirse con un ejercicio diferente, del que se espera creatividad por su parte.
>
> Saludos

## Requisitos Funcionales
El ejercicio nos pide hacer una pequeña aplicación en la que se gestione las agendas de los odontólogos  de una red de clínicas dentales.

Para abordar el proyecto, haremos una serie de simplificaciones o suposiciones que nos facilitarán el proyecto:
+ Las citas las gestionarán los administrativos, es decir... no habrá forma que el cliente de forma remota se gestione sus citas.
+ Un paciente quedará ligado a su odontólogo tras la primera cita por lo que en las visitas sucesivas, se citará en las agenadas de SU odontólogo.
+ Sólo se citarán visitas sin tener en cuenta cirugias, extracciones... y todas las visitas serán del mismo tipo y duración.
+ Cada odontólogo tendrá una única agenda.

## Diseño

### Casos de uso
Los casos de uso detectado para este ejercicio són los siguientes:

Usuario Administrador.
+ Crear centro.
+ Consultar citas de un centro.
+ Eliminar centro. (incluye consultar citas de un centro para validar que el centro eliminado no tiene citas pendientes.)
+ Modificar centro.
+ Listar centros.
+ Crear administrativo.
+ Modificar administrativo.
+ Eliminar administrativo.
+ Listar administrativos por centro.

Usuario Administrativo.
+ Crear paciente.
+ Consultar citas de paciente.
+ Modificar paciente.
+ Eliminar paciente. (Incluye consultas citas de paciente para validar que no tenga citas pendientes)
+ Crear odontologo.
+ Modificar odontologo.
+ Eliminar odontologo. (incluye consultar agenda , para comprobar que no se elimine un odontologo con citas programadas)
+ Listar odontologos por centro.
+ Crear agenda.
+ Consultar agenda.
+ Eliminar agenda. (incluye consultar agenda , para comprobar que no se elimine una agenda con citas programadas)
+ Modificar agenda. (incluye consultar agenda , para comprobar que no afecte a citas)

+ Programar/Reprogramar cita.  (incluye consultar agenda)
+ Eliminar cita.  

Usuario Odontologo.
+ Marcar cita como completada.
+ Marcar cita como no presentado.
+ Consultar lista de trabajo del día.

### Diseño Técnico

Para ofrecer esta funcionalidad como un API restful, se decide que se implementarán microservicios. Cada microservicio se ejecutará en un contenedor Docker y para temas de persistencia se guardarán los datos con SQLite ( pero en un sistema productivo, sería mejor usar un servidor de BBDD como mariaDb , por ejemplo)


#### Microservicios

En concreto, se han detectado los siguientes microservicios:
+ Usuarios.
+ Agendas.
+ Pacientes.
+ Autenticación.


Cada microservicio se implementará mediante Flask y los accesos a BBDD se harán mediante ORM, ( con la librería SQLAlchemy).
Para la autenticación se decide usar tokens JWT