import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {

    final messages = <String> [
    'Cargando peliculas',
    'Comprando palomitas',
    'Entrevistando a los actores',
    'Entrando a la sala',
    ];

    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),

          StreamBuilder(
            stream: getLoadingMessages(), 
            builder: (context, snapshot) {
              if ( !snapshot.hasData) return const Text('Cargando...');

              return Text(snapshot.data!);
            }
          ),
        ]
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