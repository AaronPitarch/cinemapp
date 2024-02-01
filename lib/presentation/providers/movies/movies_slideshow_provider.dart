import 'package:cinemapp/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];
  return nowPlayingMovies.sublist(0,6);
});

/*
Este código define un proveedor llamado `moviesSlideshowProvider` que utiliza 
la biblioteca `flutter_riverpod`. El proveedor devuelve una lista de `Movie` 
que se utilizará en un slideshow.

El proveedor moviesSlideshowProvider utiliza el proveedor 
nowPlayingMoviesProvider para obtener la lista de películas en cartelera y, 
si la lista no está vacía, devuelve las primeras 6 películas de la lista. 
De lo contrario, devuelve una lista vacía.

En resumen, el proveedor moviesSlideshowProvider proporciona una forma de 
inyectar la dependencia de una lista de Movie que se utilizará en un slideshow 
en el código de la aplicación, lo que facilita la unidad de pruebas y el 
mantenimiento del código. Además, el proveedor permite obtener las primeras 
6 películas en cartelera y mostrarlas en un slideshow.
 */