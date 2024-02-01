import 'package:cinemapp/domain/entities/actor.dart';

//Interfaz abstracta que proporciona informacion sobre actores
abstract class ActorsDatasource {
  Future <List<Actor>> getActorByMovie(String movieId);
}

/*
Este codigo define una interfaz abstracta llamada ActorsDatasource 
en Dart. Esta interfaz se utiliza para proporcionar una abstracción sobre 
cómo se obtiene información sobre actores en una aplicación.

La interfaz define un método abstracto llamado getActorByMovie, que toma 
un parámetro de cadena movieId y devuelve una Future de una lista de 
objetos Actor. La Future es un objeto que representa un valor que puede 
estar disponible en el futuro, lo que permite que el código continúe 
ejecutándose mientras se espera que el valor esté disponible.

En este caso, la Future se utiliza para representar la operación asíncrona 
de obtener información sobre los actores de una película en particular. 
La implementación de este método dependerá del origen de los datos, que 
podría ser una base de datos local, una API remota u otro origen de datos.

La interfaz ActorsDatasource se utiliza para definir un contrato que debe 
cumplir cualquier clase que implemente esta interfaz. Esto significa que 
cualquier clase que implemente ActorsDatasource debe proporcionar una 
implementación del método getActorByMovie. Esto permite a la aplicación 
interactuar con diferentes orígenes de datos de actores de manera 
consistente, independientemente de cómo se implementen los detalles de 
la obtención de datos.
 */