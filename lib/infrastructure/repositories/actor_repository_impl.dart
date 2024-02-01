import 'package:cinemapp/domain/datasources/actors_datasource.dart';
import 'package:cinemapp/domain/entities/actor.dart';
import 'package:cinemapp/domain/repositories/actors_repository.dart';

//Implementación concreta del repositorio de actores que utiliza un datasource para obtener datos
class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return datasource.getActorByMovie(movieId);
  }
}

/*
Este código define una clase llamada ActorRepositoryImpl que implementa la 
interfaz ActorsRepository. La clase ActorRepositoryImpl tiene un constructor 
que toma un objeto ActorsDatasource como parámetro y lo asigna a la 
variable datasource.

La clase ActorRepositoryImpl implementa el método 
getActorByMovie(String movieId) que devuelve una lista de objetos Actor. 
El método getActorByMovie(String movieId) simplemente delega la llamada al 
método getActorByMovie(movieId) del objeto datasource.

En resumen, la clase ActorRepositoryImpl proporciona una implementación 
concreta del repositorio de actores que utiliza un datasource para obtener 
datos, lo que permite aislar la lógica de acceso a datos y facilita la unidad 
de pruebas y el mantenimiento del código.
 */