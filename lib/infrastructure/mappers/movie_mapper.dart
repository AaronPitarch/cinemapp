import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movie_details.dart';
import 'package:cinemapp/infrastructure/models/moviedb/movie_moviedb.dart';


//Clase de mapeo para convertir datos de la API de películas (MovieMovieDB y MovieDetails) a la entidad Movie
class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: (moviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}' 
      : 'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}' 
      : 'https://movieguide.b-cdn.net/wp-content/uploads/2021/09/Poster-Not-Available.jpg',
    releaseDate: moviedb.releaseDate != null ? moviedb.releaseDate! : DateTime.now(),
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
  );

  static Movie movieDetailsToEntity(MovieDetails movie) => Movie(
    adult: movie.adult,
    backdropPath: (movie.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}' 
      : 'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
    genreIds: movie.genres.map((e) => e.name).toList(),
    id: movie.id,
    originalLanguage: movie.originalLanguage,
    originalTitle: movie.originalTitle,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: (movie.posterPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}' 
      : 'https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
    releaseDate: movie.releaseDate,
    title: movie.title,
    video: movie.video,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount
  );
}

/*
Este código define una clase llamada MovieMapper que se utiliza para 
convertir los datos de la API de películas (MovieMovieDB y MovieDetails) a 
la entidad Movie. La clase MovieMapper tiene dos métodos estáticos 
movieDBToEntity(MovieMovieDB moviedb) y movieDetailsToEntity(MovieDetails movie) 
que toman un objeto MovieMovieDB o MovieDetails como parámetro y devuelven 
un objeto Movie.

Los métodos movieDBToEntity(MovieMovieDB moviedb) y 
movieDetailsToEntity(MovieDetails movie) crean un nuevo objeto Movie y 
asignan los valores de adult, backdropPath, genreIds, id, originalLanguage, 
originalTitle, overview, popularity, posterPath, releaseDate, title, video, 
voteAverage, y voteCount del objeto MovieMovieDB o MovieDetails a los 
correspondientes campos del objeto Movie. El campo backdropPath y posterPath 
se utilizan para construir la URL de la imagen de la película, utilizando la 
URL base de la API de The Movie DB y el valor de backdropPath o posterPath 
del objeto MovieMovieDB o MovieDetails. Si el valor de backdropPath o 
posterPath es nulo, se utiliza una imagen de reemplazo como reemplazo.

En resumen, la clase MovieMapper proporciona una forma de convertir los 
datos de la API de películas (MovieMovieDB y MovieDetails) a la entidad 
Movie, lo que facilita la integración de los datos de la API con el resto 
del código de la aplicación.
 */