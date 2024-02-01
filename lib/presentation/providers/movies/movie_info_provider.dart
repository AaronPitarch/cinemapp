import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}): super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}

/*
Este código define un proveedor de estado llamado movieInfoProvider en Flutter 
Riverpod, que se utiliza para proporcionar una instancia de MovieMapNotifier 
al resto de la aplicación.

La clase MovieMapNotifier es un notificador de estado que gestiona un mapa de 
películas, donde cada clave es el ID de una película y el valor es la propia 
película. La clase tiene una referencia a una función de callback getMovie que 
se utiliza para obtener una película por su ID.

La lógica de la clase MovieMapNotifier se encarga de actualizar el estado del 
mapa de películas cuando se invoca el método loadMovie. Si la película ya 
existe en el mapa, no se hace nada. De lo contrario, se obtiene la película 
por su ID y se actualiza el estado del mapa con la nueva película.

En resumen, este código define un proveedor de estado para gestionar un mapa 
de películas, donde cada clave es el ID de una película y el valor es la propia 
película. La clase MovieMapNotifier tiene una referencia a una función de 
callback getMovie que se utiliza para obtener una película por su ID y 
actualiza el estado del mapa cuando se invoca el método loadMovie.
 */