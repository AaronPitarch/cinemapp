import 'package:cinemapp/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapp/domain/entities/entities.dart';
import 'package:cinemapp/presentation/providers/providers.dart';

final similarMoviesProvider = FutureProvider.family((ref, int movieId) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return movieRepository.getSimilarMovies(movieId);
});

class SimilarMovies extends ConsumerWidget {

  final int movieId;

  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final similarMoviesFuture = ref.watch(similarMoviesProvider(movieId));

    return similarMoviesFuture.when(
      data: ( movies) => _Recomendations( movies: movies ), 
      error: (_ , __) => const Center(child: Text('No se pudo cargar películas similares') ), 
      loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

class _Recomendations extends StatelessWidget {
  final List<Movie> movies;

  const _Recomendations({ required this.movies });

  @override
  Widget build(BuildContext context) {

    if ( movies.isEmpty ) return const SizedBox();

    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 50),
      child: MovieHorizontalListView(
        title: 'Recomendaciones',
        movies: movies
      ),
    );
  }
}

/*
Este código define un widget SimilarMovies que muestra las películas similares 
a una película específica. La clase SimilarMovies extiende ConsumerWidgety 
recibe un parámetromovieId` que se utiliza para obtener las películas similares 
a esa película en particular.

En el método build, se utiliza el proveedor similarMoviesProvider para obtener 
una lista de películas similares. El proveedor similarMoviesProvider es una 
instancia de FutureProvider.family que toma un parámetro movieId y devuelve 
una llamada asíncrona al método getSimilarMovies del repositorio de películas.

El widget SimilarMovies muestra un indicador de carga mientras se cargan las 
películas similares y muestra un mensaje de error si ocurre algún problema al 
cargar las películas. Si se cargan las películas correctamente, se pasan a la 
clase _Recomendations como parámetro movies.

La clase _Recomendations extiende StatelessWidget y muestra una lista 
horizontal de películas utilizando el widget MovieHorizontalListView. El 
título de la lista es "Recomendaciones". Si la lista de películas está vacía, 
se muestra un contenedor vacío.

En resumen, el widget SimilarMovies muestra una lista de películas similares a 
una película específica, con un indicador de carga y un mensaje de error en 
caso de que ocurra algún problema al cargar las películas.
 */
