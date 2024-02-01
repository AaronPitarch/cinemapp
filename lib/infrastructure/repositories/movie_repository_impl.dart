import 'package:cinemapp/domain/datasources/movies_datasource.dart';
import 'package:cinemapp/domain/entities/entities.dart';
import 'package:cinemapp/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDataSource datasource;
  MovieRepositoryImpl(this.datasource);

  //Obtiene la lista de peliculas en cartelera
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
  
  //Obtiene las peliculas populares
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
  
  //Obtiene las peliculas mejor calificadas
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }
  
  //Obtiene las proximas peliculas en salir
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }
  
  //Obtiene los datos de una pelicula
  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
  
  //Busca peliculas
  @override
  Future<List<Movie>> searchMovies(String query) {
    return datasource.searchMovies(query);
  }
  
  //Obtiene peliculas similares
  @override
  Future<List<Movie>> getSimilarMovies(int movieId) {
    return datasource.getSimilarMovies(movieId);
  }

  //Obtiene videos de youtuve asociados a la pelicula
  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) {
    return datasource.getYoutubeVideosById(movieId);
  }
}

/*
Este código define una clase llamada MovieRepositoryImpl que implementa la 
interfaz MoviesRepository. La clase MovieRepositoryImpl tiene un constructor 
que toma un objeto MoviesDataSource como parámetro y lo asigna a la variable 
datasource.

La clase MovieRepositoryImpl implementa los métodos 
getNowPlaying({int page = 1}), getPopular({int page = 1}), 
getTopRated({int page = 1}), getUpcoming({int page = 1}), 
getMovieById(String id), searchMovies(String query), 
getSimilarMovies(int movieId), y getYoutubeVideosById(int movieId) que 
devuelven un Future de List<Movie> y Movie respectivamente. Los métodos 
simplemente delega la llamada a los métodos correspondientes del objeto 
datasource.

En resumen, la clase MovieRepositoryImpl proporciona una implementación 
concreta del repositorio de películas que utiliza un datasource para obtener 
datos, lo que permite aislar la lógica de acceso a datos y facilita la unidad 
de pruebas y el mantenimiento del código.
 */