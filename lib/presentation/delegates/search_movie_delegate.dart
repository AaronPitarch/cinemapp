import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/config/helpers/human_formats.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({required this.searchMovies, required this.initialMovies});

  //Metodo para limpiar los streams utilizados en la busqueda
  void clearStreams() {
    debouncedMovies.close();
  }

  //Manejador de cambios en la consulta de busqueda
  void _onQueryChanged(String query) {
    isLoadingStream.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    //Se utiliza un temporizador para evitar realizar búsquedas en cada cambio de carácter
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {

      final movies = await searchMovies(query);
      debouncedMovies.add(movies);
      initialMovies = movies;
      isLoadingStream.add(false);
     });
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder(
      initialData: initialMovies,
      stream: debouncedMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return _MovieItem(
              movie: movies[index],
              onMovieSelected: (context, movie) {
                clearStreams();
                close(context, movie);
              },
            );
          }
        );
      }
    );
  }

  @override
  String get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream, 
        builder: (context, snapshot) {
         if (snapshot.data ?? false) {
          return SpinPerfect(
            duration: const Duration(seconds: 10),
            spins: 10,
            infinite: true,
            child: IconButton(
              onPressed: () => query = '',
              icon: const Icon(Icons.refresh_rounded)
            ),
          ); 
         }

          return FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
              onPressed: () => query = '',
              icon: const Icon(Icons.clear)
            ),
          );
        }
      ),
    ];
  }

  //Construye el icono de retroceso en la barra de búsqueda
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        clearStreams();
        close(context, null); 
      }, 
      icon: const Icon(Icons.arrow_back_ios_new_rounded)
    );
  }

  //Construye los resultados de la búsqueda
  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  //Construye las sugerencias de búsqueda
  @override
  Widget buildSuggestions(BuildContext context) {
    //Inicia la búsqueda cada vez que cambia la consulta
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _MovieItem extends StatelessWidget {

  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child)
                ),
              ),
            ),
      
            const SizedBox(width: 10),
      
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyle.titleMedium),
      
                  (movie.overview.length > 100) 
                    ? Text('${movie.overview.substring(0,100)}...')
                    : Text(movie.overview),
                  
                  Row(
                    children: [
                      Icon(Icons.star_half_rounded, color: Colors.yellow.shade800),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textStyle.bodyMedium!.copyWith(color: Colors.yellow.shade900),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
Este código define una clase llamada SearchMovieDelegate que extiende la clase 
SearchDelegate<Movie?> de la biblioteca animate_do. La clase SearchMovieDelegate 
tiene un constructor que toma un objeto SearchMoviesCallback como parámetro y 
lo asigna a la variable searchMovies.

La clase SearchMovieDelegate tiene una variable initialMovies de tipo 
List<Movie> y dos StreamController llamados debouncedMovies y isLoadingStream 
que se utilizan para manejar el estado de la búsqueda.

La clase SearchMovieDelegate implementa los métodos buildResultsAndSuggestions(), 
buildActions(BuildContext context), buildLeading(BuildContext context), 
buildResults(BuildContext context), y buildSuggestions(BuildContext context) 
que devuelven un Widget.

El método buildResultsAndSuggestions() construye una lista de Movie utilizando 
un StreamBuilder y un ListView.builder.

El método buildActions(BuildContext context) construye una lista de Widget que 
se mostrarán en la barra de búsqueda, como un botón de actualización y un botón de limpieza.

El método buildLeading(BuildContext context) construye el icono de retroceso 
en la barra de búsqueda.

El método buildResults(BuildContext context) construye los resultados de la 
búsqueda utilizando el método buildResultsAndSuggestions().

El método buildSuggestions(BuildContext context) construye las sugerencias de 
búsqueda utilizando el método buildResultsAndSuggestions() y actualiza la consulta de búsqueda.

La clase _MovieItem construye un Widget que representa un Movie en la lista de 
resultados de búsqueda.

En resumen, la clase SearchMovieDelegate proporciona una implementación 
concreta de un delegado de búsqueda que utiliza un datasource para obtener 
datos, lo que permite aislar la lógica de acceso a datos y facilita la unidad 
de pruebas y el mantenimiento del código.
 */