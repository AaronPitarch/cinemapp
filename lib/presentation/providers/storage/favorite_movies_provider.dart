import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/domain/repositories/local_storage_repository.dart';
import 'package:cinemapp/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider = StateNotifierProvider<StorageMoviesNotifier,Map<int,Movie>>((ref) {
  final localStorageRepository = ref.watch( localStorageRepositoryProvider );
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}): super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;

  final tempMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}

/*
Este código define un proveedor de estado llamado favoriteMoviesProvider en 
Flutter Riverpod, que se utiliza para proporcionar una instancia de 
StorageMoviesNotifier al resto de la aplicación.

La clase StorageMoviesNotifier es un notificador de estado que gestiona un 
mapa de películas favoritas, donde cada clave es el ID de una película y el 
valor es la propia película. La clase tiene una referencia a una instancia de 
LocalStorageRepository que se utiliza para guardar y cargar las películas 
favoritas en almacenamiento local.

La lógica de la clase StorageMoviesNotifier se encarga de actualizar el 
estado de las películas favoritas cuando se invoca el método toggleFavorite. 
Si la película ya existe en el mapa, se elimina. De lo contrario, se agrega 
al mapa. Además, se utiliza el método loadNextPage para cargar más películas 
desde el almacenamiento local y actualizar el estado del mapa de películas 
favoritas.

En resumen, este código define un proveedor de estado para gestionar un mapa 
de películas favoritas en almacenamiento local y un notificador de estado 
para gestionar el estado del mapa de películas favoritas. La clase 
StorageMoviesNotifier tiene una referencia a una instancia de 
LocalStorageRepository que se utiliza para guardar y cargar las películas 
favoritas en almacenamiento local y actualiza el estado del mapa de películas 
favoritas cuando se invoca el método toggleFavorite. Además, se utiliza el 
método loadNextPage para cargar más películas desde el almacenamiento local 
y actualizar el estado del mapa de películas favoritas.
 */