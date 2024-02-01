import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesSlideshow extends StatelessWidget {

  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.8,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _Slide(movie: movies[index]);
        }
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10),
        )
      ]
    );

    return Padding(
      padding: const EdgeInsets.only( bottom: 30 ),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () => context.push('/home/0/movie/${ movie.id }'),
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
              image: NetworkImage(movie.backdropPath),
            ),
          )
        )
      ),
    );
  }
}

/*
Este código define un widget MoviesSlideshow que muestra una lista de 
películas en forma de diapositivas. La clase MoviesSlideshow extiende 
StatelessWidget y recibe una lista de películas como parámetro movies.

En el método build, se crea un widget SizedBox con una altura fija de 210 y un 
ancho infinito. Dentro del SizedBox, se crea un widget Swiper que muestra las 
diapositivas de las películas. El Swiper tiene una relación de aspecto de 0.8 
y una sombra en la parte inferior de cada diapositiva.

El Swiper tiene una paginación activa que muestra puntos en la parte inferior 
de la pantalla. La paginación se personaliza con los colores primario y 
secundario de la temática de la aplicación.

Cada diapositiva se crea con el widget _Slide, que recibe una película como 
parámetro movie. El widget _Slide crea un fondo decorado con una sombra y un 
borde redondeado. Dentro del fondo decorado, se crea un widget GestureDetector 
que detecta toques y navega a la página de detalles de la película cuando se 
toca una diapositiva.

El GestureDetector contiene un widget FadeInImage que muestra la imagen de 
fondo de la película con un efecto de desvanecimiento al cargar la imagen.
El FadeInImage tiene un placeholder que se muestra mientras se carga la imagen.

En resumen, el widget MoviesSlideshow muestra una lista de películas en forma 
de diapositivas, con una paginación activa y un efecto de desvanecimiento al 
cargar las imágenes. Cada diapositiva se puede tocar para navegar a la página 
de detalles de la película.
 */