import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviePosterLink extends StatelessWidget {

  final Movie movie;

  const MoviePosterLink({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return FadeInUp(
      from: random.nextInt(100) + 80,
      delay: Duration(milliseconds: random.nextInt(450) + 0 ),
      child: GestureDetector(
        onTap: () => context.push('/home/0/movie/${ movie.id }'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            height: 180,
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
            image: NetworkImage(movie.posterPath),
          ),
        ),
      ),
    );
  }
}

/*
Este código define un widget MoviePosterLink que muestra una imagen de la 
portada de una película y permite navegar a la página detalles de la película 
cuando se toca la imagen. La clase MoviePosterLink extiende StatelessWidget y 
recibe una película como parámetro movie.

En el método build, se crea un objeto Random para generar números aleatorios. 
Se crea un widget FadeInUp que controla la animación de entrada de la imagen. 
El widget FadeInUp tiene un valor from que controla el desplazamiento vertical 
inicial de la imagen y un valor delay que controla el retraso de la animación.

Dentro del FadeInUp, se crea un widget GestureDetector que detecta toques y 
navega a la página de detalles de la película cuando se toca la imagen. 
El GestureDetector contiene un widget ClipRRect que da forma a la imagen con 
un borde redondeado.

Dentro del ClipRRect, se crea un widget FadeInImage que muestra la imagen de 
la portada de la película con un efecto de desvanecimiento al cargar la imagen. 
El FadeInImage tiene un placeholder que se muestra mientras se carga la imagen.

En resumen, el widget MoviePosterLink muestra una imagen de la portada de una 
película con una animación de entrada y permite navegar a la página de detalles 
de la película cuando se toca la imagen. El widget FadeInImage muestra la 
imagen de la portada de la película con un efecto de desvanecimiento al cargar 
la imagen. El widget ClipRRect da forma a la imagen con un borde redondeado.
 */