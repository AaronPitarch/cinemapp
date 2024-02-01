import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final searchMoviesProvider = StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
  final movieRepository = ref.read(movieRepositoryProvider);

  return SearchMoviesNotifier(
    searchMovies: movieRepository.searchMovies,
    ref: ref
  );
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchMoviesNotifier({required this.ref, required this.searchMovies}): super([]);

  //Método para buscar películas por un término de búsqueda
  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);

    //Se actualiza el término de búsqueda en el estado global
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;
    return movies;
  }
}

/*
Este código define dos proveedores de estado en Flutter Riverpod para realizar 
búsquedas de películas en una fuente de datos, en este caso, una implementación 
concreta de MovieRepositoryImpl.

Los proveedores definidos son:

searchQueryProvider: proveedor de estado para almacenar la consulta de 
búsqueda de películas.
searchMoviesProvider: proveedor de estado para obtener las películas que 
coincidan con la consulta de búsqueda.
La clase SearchMoviesNotifier es un notificador de estado que se utiliza para 
gestionar la lista de películas que coinciden con la consulta de búsqueda. 
El notificador de estado tiene una referencia a una función de callback 
searchMovies que se utiliza para obtener las películas que coinciden con la 
consulta de búsqueda.

La lógica de la clase SearchMoviesNotifier se encarga de actualizar el estado 
de la lista de películas cuando se invoca el método searchMoviesByQuery. 
La búsqueda se realiza de forma asíncrona y se actualiza el estado de la lista 
de películas con las nuevas películas encontradas. Además, se actualiza el 
estado del proveedor searchQueryProvider con la consulta de búsqueda utilizada.

En resumen, este código define dos proveedores de estado para realizar 
búsquedas de películas en una fuente de datos y un notificador de estado 
para gestionar la lista de películas que coinciden con la consulta de búsqueda. 
La clase SearchMoviesNotifier tiene una referencia a una función de callback 
searchMovies que se utiliza para obtener las películas que coinciden con la 
consulta de búsqueda y actualiza el estado de la lista de películas y del 
proveedor searchQueryProvider cuando se invoca el método searchMoviesByQuery.
 */