import 'package:cinemapp/domain/entities/movie.dart';
import 'package:cinemapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHorizontalListView extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView({super.key, required this.movies, this.title, this.subtitle, this.loadNextPage});

  @override
  State<MovieHorizontalListView> createState() => _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
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
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(title: widget.title, subtitle: widget.subtitle),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(), 
              itemBuilder: (context, index) {
                return _Slide(movie: widget.movies[index]);
              },
            )
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                onTap: () => context.push('/home/0/movie/${ movie.id }'),
                child: FadeInImage(
                  height: 220,
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/loaders/bottle-loader.gif'), 
                  image: NetworkImage(movie.posterPath)
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            )
          ),

          MovieRating(
            voteAverage: movie.voteAverage
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {

  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Row(
        children: [
          if (title != null)
            Text(title!, style: titleStyle),
          
          const Spacer(),

          if (subtitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact
              ),
              onPressed: () {}, 
              child: Text(subtitle!)
            ),
        ],
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
desplazamiento de la cuadrícula. Se agrega un listener al ScrollController que 
detecta cuando el usuario ha desplazado la cuadrícula hasta el final y llama a 
la función loadNextPage para cargar más películas.

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