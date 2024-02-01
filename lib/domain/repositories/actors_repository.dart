import 'package:cinemapp/domain/entities/actor.dart';

//Interfaz abstracta que maneja la obtencion de actores por pelicula
abstract class ActorsRepository {
  Future <List<Actor>> getActorByMovie(String movieId);
}

/*
Este código define una interfaz abstracta en Dart llamada ActorsRepository. 
La interfaz es una clase abstracta que define un contrato para la 
implementación de métodos específicos, pero no proporciona una 
implementación real.

La interfaz ActorsRepository contiene un método abstracto llamado 
getActorByMovie(String movieId) que devuelve un futuro (Future) de una 
lista de objetos Actor. Este método se utilizará para obtener una lista de 
actores que actuaron en una película específica, dado su identificador (movieId).

La implementación concreta de este repositorio de actores se encargará de 
proporcionar la lógica necesaria para obtener los actores de una película, 
ya sea desde una base de datos local, una API remota u otra fuente de datos. 
De esta forma, el código que utiliza este repositorio no necesita conocer 
los detalles de implementación y puede interactuar con él de manera uniforme.
 */