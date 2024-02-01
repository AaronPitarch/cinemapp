import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/movies_datasource.dart';
import 'package:cinemapp/domain/entities/entities.dart';
import 'package:cinemapp/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapp/infrastructure/mappers/video_mapper.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapp/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapp/infrastructure/models/moviedb/moviedb_videos.dart';
import 'package:dio/dio.dart';

//Datasource que implementa la obtención de información sobre películas desde la API de The Movie DB
class MovieDbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-ES',
    }
  ));

  //Convierte el mapa JSON de respuesta en una lista de objetos Movie
  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
      .where((moviedb) => moviedb.posterPath != 'no-poster')
      .map((moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }

  //Obtiene la lista de películas que están actualmente en cartelera
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    
    return _jsonToMovies(response.data);
  }
  
  //Obtiene la lista de peliculas populares
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });

    return _jsonToMovies(response.data); 
    
  }

  //Obtiene la lista de las mejores peliculas 
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });

    return _jsonToMovies(response.data); 
    
  }

  //Obtiene la lista de las proximas peliculas a estrenarse
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });

    return _jsonToMovies(response.data); 
    
  }

  //Obtiene peliculas similares
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) throw Exception('Movie with id: $id not found');

    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    
    return movie;
  }
  
  //Busca peliculas
  @override
  Future<List<Movie>> searchMovies(String query) async{
    if (query.isEmpty) return [];
    
    final response = await dio.get('/search/movie', queryParameters: {
      'query': query
    });

    return _jsonToMovies(response.data); 
  }

  //Obtiene peliculas similares
  @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    final response = await dio.get('/movie/$movieId/similar');
    return _jsonToMovies(response.data);
  }

  //Obtiene videos de youtube asociados a la pelicula
  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) async {
    final response = await dio.get('/movie/$movieId/videos');
    final moviedbVideosReponse = MoviedbVideosResponse.fromJson(response.data);
    final videos = <Video>[];

    for (final moviedbVideo in moviedbVideosReponse.results) {
      if ( moviedbVideo.site == 'YouTube' ) {
        final video = VideoMapper.moviedbVideoToEntity(moviedbVideo);
        videos.add(video);
      }
    }

    return videos;
  }
}

/*
Este código define una clase llamada MovieDbDatasource que implementa la 
interfaz MoviesDataSource. La clase se encarga de obtener información sobre 
películas desde la API de The Movie DB.

La clase MovieDbDatasource utiliza la biblioteca Dio para realizar solicitudes 
HTTP a la API de The Movie DB. La instancia de Dio se inicializa con la URL 
base de la API y los parámetros de consulta necesarios, como la clave de 
API y el idioma.

La clase MovieDbDatasource define un método 
_jsonToMovies(Map<String, dynamic> json) que convierte el mapa JSON de 
respuesta en una lista de objetos Movie.

La clase MovieDbDatasource implementa los siguientes métodos abstractos de 
la interfaz MoviesDataSource:

getNowPlaying({int page = 1}): Este método obtiene la lista de películas que 
están actualmente en cartelera, con una página opcional para la paginación.

getPopular({int page = 1}): Este método obtiene la lista de películas 
populares, con una página opcional para la paginación.

getTopRated({int page = 1}): Este método obtiene la lista de las mejores 
películas, con una página opcional para la paginación.

getUpcoming({int page = 1}): Este método obtiene la lista de las próximas 
películas a estrenarse, con una página opcional para la paginación.

getMovieById(String id): Este método obtiene los detalles de una película 
específica dado su identificador (id).

searchMovies(String query): Este método busca películas basadas en una 
consulta de búsqueda (query).

getSimilarMovies(int movieId): Este método obtiene las películas similares 
a una película específica dado su identificador (movieId).

getYoutubeVideosById(int movieId): Este método obtiene los videos de YouTube 
asociados a una película específica dado su identificador (movieId).

En resumen, la clase MovieDbDatasource proporciona una implementación 
concreta de la interfaz MoviesDataSource para obtener información sobre 
películas desde la API de The Movie DB.
 */