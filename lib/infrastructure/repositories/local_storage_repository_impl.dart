import 'package:cinemapp/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/domain/repositories/local_storage_repository.dart';

//Implementación concreta del repositorio de almacenamiento local que utiliza 
//un datasource para interactuar con los datos locales
class LocalStorageRepositoryImpl extends LocalStorageRepository {

  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  //Verifica si una pelicula esta marcada como favorita
  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  //Carga una lista de peliculas desde la base de datos local
  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  //Cambia el estado de favorito de una pelicula
  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}

/*
Este código define una clase llamada `LocalStorageRepositoryImpl` que 
implementa la interfaz `LocalStorageRepository`. La clase 
`LocalStorageRepositoryImpl` tiene un constructor que toma un objeto 
`LocalStorageDatasource` como parámetro y lo asigna a la variable `datasource`.

La clase LocalStorageRepositoryImpl implementa los métodos 
isMovieFavorite(int movieId), loadMovies({int limit = 10, offset = 0}), y 
toggleFavorite(Movie movie) que devuelven un Future de bool, List<Movie>, y 
void respectivamente. Los métodos simplemente delega la llamada a los métodos 
correspondientes del objeto datasource.

En resumen, la clase LocalStorageRepositoryImpl proporciona una implementación 
concreta del repositorio de almacenamiento local que utiliza un datasource 
para interactuar con los datos locales, lo que permite aislar la lógica de 
acceso a datos y facilita la unidad de pruebas y el mantenimiento del código.
 */