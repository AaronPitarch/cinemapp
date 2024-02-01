import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapp/presentation/providers/providers.dart';

class ActorsByMovie extends ConsumerWidget {
  final String movieId;

  const ActorsByMovie({
    super.key, 
    required this.movieId
  });

  @override
  Widget build(BuildContext context, ref) {

    final actorsByMovie = ref.watch( actorsByMovieProvider );

    //* Loading actors
    if ( actorsByMovie[movieId] == null ) {
      return Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 50),
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2)
        ),
      );
    }
    final actors = actorsByMovie[movieId]!;

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: actors.length,
        itemBuilder: (context, index) {
          final actor = actors[index];

          return Container(
            padding: const EdgeInsets.all(8.0),
            width: 135,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Actor Photo
                FadeInRight(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      height: 180,
                      width: 135,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage('assets/loaders/bottle-loader.gif'),
                      image: NetworkImage(
                        actor.profilePath,
                      ),
                    )
                  ),
                ),

                // Nombre
                const SizedBox(height: 5,),

                Text(actor.name, maxLines: 2 ),
                Text(actor.character ?? '', 
                  maxLines: 2,
                  style: const TextStyle( fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis ),
              ),

              ],
            ),
          );


        },
      ),
    );
  }
}

/*
Este código define un widget ActorsByMovie que muestra los actores de una 
película específica. La clase ActorsByMovie extiende ConsumerWidget y recibe 
un parámetro movieId que se utiliza para obtener los actores de esa película 
en particular.

En el método build, se utiliza el proveedor actorsByMovieProvider para obtener 
una mapa de películas a actores. Si los actores de la película especificada no 
están disponibles, se muestra un indicador de carga. De lo contrario, se itera 
sobre la lista de actores y se muestran en una lista horizontal.

Para cada actor, se muestra una imagen con un efecto de desvanecimiento al 
entrar desde la derecha, seguido del nombre y el personaje del actor. La 
imagen se carga utilizando FadeInImage y se muestra un indicador de carga 
mientras se carga la imagen.

El ancho y alto de la imagen se establecen en 135 y 180, respectivamente, y se 
redondean los bordes con un radio de 20. El nombre y el personaje del actor se 
muestran en dos líneas, con el nombre en negrita.

El widget ActorsByMovie tiene una altura fija de 300 y se utiliza el 
ListView.builder para construir la lista de actores de forma eficiente. 
El ScrollDirection se establece en Axis.horizontal para mostrar la lista de 
actores en horizontal.
 */