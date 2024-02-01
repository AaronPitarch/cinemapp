import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Definición de un proveedor de estado para obtener películas en reproducción actualmente
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  //Obtiene la función de callback para obtener películas en reproducción actualmente
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  //Retorna una instancia de MoviesNotifier con la función de callback
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//Definición de un proveedor de estado para obtener películas populares
final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  //Obtiene la función de callback para obtener películas populares
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  //Retorna una instancia de MoviesNotifier con la función de callback
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//Definicion de un proveedor de estado para obtener peliculas proximas a estrenarse
final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  //Obtiene la función de callback para obtener películas proximas a estrenarse
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  //Retorna una instancia de MoviesNotifier con la función de callback
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

//Definicion de un proveedor de estado para obtener peliculas mejor valoradas
final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  //Obtiene la función de callback para obtener peliculas mejor valoradas
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  //Retorna una instancia de MoviesNotifier con la funcion de callback
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});


class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}): super([]);
  
  //Metodo para cargar la siguiente página de películas
  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(milliseconds: 300));

    isLoading = false;
  }
}

/*
Este código define varios proveedores de estado en Flutter Riverpod para 
obtener diferentes listas de películas de una fuente de datos, en este caso, 
una implementación concreta de MovieRepositoryImpl.

Los proveedores definidos son:

nowPlayingMoviesProvider: proveedor de estado para obtener películas en 
reproducción actualmente.

popularMoviesProvider: proveedor de estado para obtener películas populares.

upcomingMoviesProvider: proveedor de estado para obtener películas próximas 
a estrenarse.

topRatedMoviesProvider: proveedor de estado para obtener películas mejor 
valoradas.

Cada proveedor crea una instancia de MoviesNotifier, que es un notificador de 
estado que se utiliza para gestionar el estado de la lista de películas. El 
notificador de estado tiene una referencia a una función de callback 
fetchMoreMovies que se utiliza para obtener más películas de la fuente de datos.

La clase MoviesNotifier también tiene una lógica para cargar la siguiente 
página de películas cuando se invoca el método loadNextPage. La carga se 
realiza de forma asíncrona y se actualiza el estado de la lista de películas 
con las nuevas películas cargadas.

En resumen, este código define varios proveedores de estado para obtener 
diferentes listas de películas de una fuente de datos y un notificador de 
estado para gestionar el estado de la lista de películas.
 */