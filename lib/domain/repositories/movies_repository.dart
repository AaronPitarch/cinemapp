import 'package:cinemapp/domain/entities/entities.dart';

//Interfaz abstracta que maneja la obtención de información sobre películas.
abstract class MoviesRepository {
  //Obtiene la lista de películas que están en cartelera.
  Future<List<Movie>> getNowPlaying({int page = 1});
  //Obtiene la lista de películas populares.
  Future<List<Movie>> getPopular({int page = 1});
  //Obtiene la lista de peliculas proximas a estrenarse
  Future<List<Movie>> getUpcoming({int page = 1});
  //Obtiene la lista de las mejores peliculas
  Future<List<Movie>> getTopRated({int page = 1});
  //Obtiene detalles de una pelicula
  Future<Movie> getMovieById(String id);
  //Busca peliculas
  Future<List<Movie>> searchMovies(String query);
  //Obtiene peliculas similares 
  Future<List<Movie>> getSimilarMovies( int movieId );
  //Obtiene videos de youtube asociados a la pelicula
  Future<List<Video>> getYoutubeVideosById( int movieId );
}

/*
Este código define una interfaz abstracta en Dart llamada MoviesRepository. 
La interfaz es una clase abstracta que define un contrato para la 
implementación de métodos específicos, no proporciona una implementación real.

La interfaz MoviesRepository contiene siete métodos abstractos:

getNowPlaying({int page = 1}): Este método obtiene la lista de películas que 
están actualmente en cartelera, con una página opcional para la paginación.

getPopular({int page = 1}): Este método obtiene la lista de películas 
populares, con una página opcional para la paginación.

getUpcoming({int page = 1}): Este método obtiene la lista de películas 
próximas a estrenarse, con una página opcional para la paginación.

getTopRated({int page = 1}): Este método obtiene la lista de las mejores 
películas, con una página opcional para la paginación.

getMovieById(String id): Este método obtiene los detalles de una película 
específica dado su identificador (id).

searchMovies(String query): Este método busca películas basadas en una 
consulta de búsqueda (query).

getSimilarMovies(int movieId): Este método obtiene las películas similares a 
una película específica dado su identificador (movieId).

getYoutubeVideosById(int movieId): Este método obtiene los videos de YouTube 
asociados a una película específica dado su identificador (movieId).

La implementación concreta de este repositorio de películas se encargará de 
proporcionar la lógica necesaria para obtener la información sobre las 
películas, ya sea desde una API remota, una base de datos local u otra fuente 
de datos. De esta forma, el código que utiliza este repositorio no necesita 
conocer los detalles de implementación y puede interactuar con él de 
manera uniforme.
 */