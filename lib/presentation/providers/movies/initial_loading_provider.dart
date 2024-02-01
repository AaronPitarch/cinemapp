import 'package:cinemapp/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {

  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
  final step4 = ref.watch(upcomingMoviesProvider).isEmpty;

  if (step1 || step2 || step3 || step4) return true;

  return false;
});

/*
Este código define un proveedor llamado initialLoadingProvider que utiliza 
la biblioteca flutter_riverpod. El proveedor devuelve un valor booleano que 
indica si se está cargando inicialmente la aplicación o no.

El proveedor initialLoadingProvider utiliza los proveedores 
nowPlayingMoviesProvider, popularMoviesProvider, topRatedMoviesProvider, y 
upcomingMoviesProvider para verificar si las listas de películas están vacías. 
Si alguna de las listas está vacía, el proveedor devuelve true, lo que indica 
que aún se está cargando la aplicación. De lo contrario, devuelve false.

En resumen, el proveedor initialLoadingProvider proporciona una forma de 
inyectar la dependencia de un valor booleano que indica si se está cargando 
inicialmente la aplicación en el código de la aplicación, lo que facilita la 
unidad de pruebas y el mantenimiento del código. Además, el proveedor permite 
controlar el estado de carga inicial de la aplicación y mostrar una pantalla 
de carga mientras se cargan los datos.
 */