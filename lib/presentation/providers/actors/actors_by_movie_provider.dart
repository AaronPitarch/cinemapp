import 'package:cinemapp/domain/entities/actor.dart';
import 'package:cinemapp/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Definición de un proveedor de estado para obtener actores por película
final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  //Obtiene la instancia del repositorio de actores a través del proveedor
  final actorsRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(getActors: actorsRepository.getActorByMovie);
});

//Definición de un callback para obtener actores basados en el ID de la película
typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  //Función de callback para obtener actores
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({required this.getActors}): super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final List<Actor> actors = await getActors(movieId);
    //Se actualiza el estado con los actores obtenidos
    state = {...state, movieId: actors};
  }
}

/*
Este código define un proveedor de estado llamado actorsByMovieProvider que 
utiliza la biblioteca flutter_riverpod. El proveedor devuelve una instancia de 
ActorsByMovieNotifier con un callback getActors como parámetro.

La clase ActorsByMovieNotifier extiende la clase 
StateNotifier<Map<String, List<Actor>>> y tiene un constructor que toma un 
objeto GetActorsCallback como parámetro y lo asigna a la variable getActors.

La clase ActorsByMovieNotifier tiene un método loadActors(String movieId) que 
devuelve un Future<void. El método loadActors(String movieId) verifica si los 
actores para la película con el ID movieId ya están en el estado y, si no lo 
están, obtiene los actores utilizando el callback getActors y actualiza el 
estado con los actores obtenidos.

En resumen, el proveedor actorsByMovieProvider proporciona una forma de 
inyectar la dependencia de ActorsByMovieNotifier en el código de la aplicación, 
lo que facilita la unidad de pruebas y el mantenimiento del código. Además, el 
método loadActors(String movieId) permite obtener los actores de una película 
específica y actualizar el estado en consecuencia.
 */