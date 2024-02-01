import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/domain/entities/video.dart';

//Interfaz abstracta que proporciona informacion sobre las peliculas
abstract class MoviesDataSource {
  //Obtiene la lista de peliculas que estan en cartelera
  Future<List<Movie>> getNowPlaying({int page = 1});
  //Obtiene la lista de peliculas populares
  Future<List<Movie>> getPopular({int page = 1});
  //Obtiene la lista de peliculas para estrenarse
  Future<List<Movie>> getUpcoming({int page = 1});
  //Obtiene la lista de las mejores peliculas
  Future<List<Movie>> getTopRated({int page = 1});
  //Obtiene los de lates de una pelicula 
  Future<Movie> getMovieById(String id);
  //Busca la pelicula
  Future<List<Movie>> searchMovies(String query);
  //Obtiene peliculas similares 
  Future<List<Movie>> getSimilarMovies( int movieId );
  //Obtiene videos asociados a la pelicula
  Future<List<Video>> getYoutubeVideosById( int movieId );
}

/*
Este codigo define una interfaz abstracta llamada MoviesDataSource en Dart. 
Esta interfaz se utiliza para proporcionar una abstracción sobre cómo se 
obtiene información sobre películas en una aplicación.

La interfaz define seis métodos abstractos:

getNowPlaying: Este método devuelve una Future de una lista de objetos Movie 
que representan las películas que actualmente se están exhibiendo en 
los cines. El método acepta un parámetro opcional page que se utiliza para 
controlar la página de resultados que se devuelve.

getPopular: Este método devuelve una Future de una lista de objetos Movie 
que representan las películas más populares en la actualidad. El método
acepta un parámetro opcional page que se utiliza para controlar la página 
de resultados que se devuelve.

getUpcoming: Este método devuelve una Future de una lista de objetos Movie 
que representan las películas que se estrenarán en el futuro. El método 
acepta un parámetro opcional page que se utiliza para controlar la página de 
resultados que se devuelve.

getTopRated: Este método devuelve una Future de una lista de objetos Movie 
que representan las películas mejor calificadas en la actualidad. El método 
acepta un parámetro opcional page que se utiliza para controlar la página de 
resultados que se devuelve.

getMovieById: Este método devuelve una Future de un objeto Movie que 
representa una película específica, dado su ID.

searchMovies: Este método devuelve una Future de una lista de objetos Movie 
que representan las películas que coinciden con una consulta de búsqueda 
específica.

getSimilarMovies: Este método devuelve una Future de una lista de objetos 
Movie que representan las películas similares a una película 
específica, dado su ID.

getYoutubeVideosById: Este método devuelve una Future de una lista de 
objetos Video que representan los videos asociados a una película 
específica, dado su ID.

La interfaz MoviesDataSource se utiliza para definir un contrato que debe 
cumplir cualquier clase que implemente esta interfaz. Esto significa que 
cualquier clase que implemente MoviesDataSource debe proporcionar una 
implementación de los métodos definidos en la interfaz. Esto permite a la 
aplicación interactuar con diferentes orígenes de datos de películas de 
manera consistente, independientemente de cómo se implementen los detalles 
de la obtención de datos.
 */