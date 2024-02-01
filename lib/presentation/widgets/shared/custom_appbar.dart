import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapp/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Cinemapp', style: titleStyle),

              const Spacer(),

              IconButton(
                onPressed: () {
                  final searchMovies = ref.read(searchMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context, 
                    delegate: SearchMovieDelegate(
                      initialMovies: searchMovies,
                      searchMovies: ref.read(searchMoviesProvider.notifier).searchMoviesByQuery
                    )
                  ).then((movie) {
                    if (movie == null) return;
                    context.push('/home/0/movie/${movie.id}');
                  });
                }, 
                icon: const Icon(Icons.search)
              ),
            ],
          ),
        ),)
    );
  }
}

/*
Este código define un widget CustomAppbar que muestra una barra de navegación 
superior personalizada con un icono, un título y un botón de búsqueda. La 
clase CustomAppbar extiende ConsumerWidget y no recibe ningún parámetro.

En el método build, se crea un widget SafeArea que evita que los widgets se 
superpongan con la barra de navegación superior o inferior. Dentro del SafeArea,
se crea un widget Padding que agrega un margen horizontal de 10.

Dentro del Padding, se crea un widget SizedBox que contiene un icono, un título 
y un botón de búsqueda. El icono se crea con el widget Icon y se define con el 
icono de cine y el color primario de la temática. El título se crea con el 
widget Text y se define con el estilo titleMedium de la temática.

El botón de búsqueda se crea con el widget IconButton y se define con un icono 
de lupa y un callback onPressed que muestra un diálogo de búsqueda.

El diálogo de búsqueda se crea con el widget showSearch y se define con una 
consulta inicial, un contexto y un delegado de búsqueda. El delegado de 
búsqueda se define con una lista inicial de películas y una función de búsqueda 
por consulta.

En resumen, el widget CustomAppbar muestra una barra de navegación superior 
personalizada con un icono, un título y un botón de búsqueda. El widget 
showSearch muestra un diálogo de búsqueda con una consulta inicial y un 
delegado de búsqueda. El delegado de búsqueda se define con una lista inicial 
de películas y una función de búsqueda por consulta.
 */