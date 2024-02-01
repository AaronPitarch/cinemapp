import 'package:cinemapp/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {

  final double voteAverage; 


  const MovieRating({
    super.key,
    required this.voteAverage
  });

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
          const SizedBox(width: 3),
          Text(HumanFormats.number(voteAverage, 1),
              style: textStyles.bodyMedium
                  ?.copyWith(color: Colors.yellow.shade800)),
        ],
      ),
    );
  }
}

/*
Este código define un widget MovieRating que muestra la calificación de una 
película en forma de estrellas y texto. La clase MovieRating extiende 
StatelessWidget y recibe una calificación de película como parámetro 
voteAverage.

En el método build, se crea un widget SizedBox con un ancho fijo de 150 y un 
alto infinito. Dentro del SizedBox, se crea un widget Row que contiene un 
icono de estrella medio lleno y el texto de la calificación.

El icono de estrella se crea con el widget Icon y se colorea con amarillo. 
El texto de la calificación se crea con el widget Text y se formatea con la 
función HumanFormats.number que redondea el número a un decimal. El texto se 
muestra en negrita y se colorea con amarillo.

En resumen, el widget MovieRating muestra la calificación de una película en 
forma de estrellas y texto. El texto se muestra en negrita y se colorea con 
amarillo. El icono de estrella se muestra medio lleno y se colorea con amarillo.
 */