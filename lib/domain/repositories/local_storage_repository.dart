import 'package:cinemapp/domain/entities/movie.dart';

//Interfaz abstracta que maneja la interacción con el almacenamiento local.
abstract class LocalStorageRepository {
  //Cambia el estado de favorito de una pelicula
  Future<void> toggleFavorite(Movie movie);
  //Verifica si una pelicula esta marcada como favorita
  Future<bool> isMovieFavorite(int movieId);
  //Carga una lista de peliculas desde el almacenamiento local
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}

/*
Este código define otra interfaz abstracta en Dart llamada 
LocalStorageRepository. La interfaz es una clase abstracta que define un 
contrato para la implementación de métodos específicos, no proporciona 
una implementación real.

La interfaz LocalStorageRepository tiene tres métodos abstractos:

toggleFavorite(Movie movie): Este método cambia el estado de favorito de 
una película específica (movie) en el almacenamiento local.

isMovieFavorite(int movieId): Este método verifica si una película con el 
identificador dado (movieId) está marcada como favorita en el almacenamiento 
local y devuelve un valor booleano en función del resultado.

loadMovies({int limit = 10, offset = 0}): Este método carga una lista de 
películas desde el almacenamiento local, con un límite y un desplazamiento 
opcionales para la paginación.

La implementación concreta de este repositorio de almacenamiento local se 
encargará de proporcionar la lógica necesaria para interactuar con el 
almacenamiento local, ya sea una base de datos SQLite, un archivo JSON o 
algún otro tipo de almacenamiento. De esta forma, el código que utiliza este 
repositorio no necesita conocer los detalles de implementación y puede 
interactuar con él de manera uniforme.
 */