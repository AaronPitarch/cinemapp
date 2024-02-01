import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MovieMasonry({super.key, required this.movies, this.loadNextPage});

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ( widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 100) >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 40),
                MoviePosterLink(movie: widget.movies[index])
              ],
            );
          }
          return MoviePosterLink(movie: widget.movies[index]);
        }
      ),
    );
  }
}

/*
Este código define un widget MovieMasonry que muestra una cuadrícula de 
imágenes de las portadas de las películas. La clase MovieMasonry extiende 
StatefulWidget y recibe una lista de películas y una función loadNextPage 
como parámetros.

En el método initState, se crea un objeto ScrollController que controla el 
desplazamiento de la cuadrícula. Se agrega un listener al ScrollController 
que detecta cuando el usuario ha desplazado la cuadrícula hasta el final y 
llama a la función loadNextPage para cargar más películas.

En el método build, se crea un widget Padding que agrega un margen a la 
cuadrícula. Dentro del Padding, se crea un widget MasonryGridView.count que 
muestra las imágenes de las portadas de las películas en una cuadrícula de 3 
columnas.

El widget MasonryGridView.count tiene un espaciado horizontal y vertical entre 
las imágenes y un contador de elementos igual al número de películas en la 
lista. El itemBuilder crea un widget MoviePosterLink para cada película en la 
lista.

El primer elemento de la lista se muestra en una columna con un margen superior 
adicional de 40. El resto de las películas se muestran en la cuadrícula 
normalmente.

En resumen, el widget MovieMasonry muestra una cuadrícula de imágenes de las 
portadas de las películas con un espaciado horizontal y vertical entre las 
imágenes. El widget MasonryGridView.count controla la cuadrícula y el widget 
ScrollController controla el desplazamiento de la cuadrícula. La función 
loadNextPage se llama cuando el usuario ha desplazado la cuadrícula hasta el 
final.
 */