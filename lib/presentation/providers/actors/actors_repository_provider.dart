import 'package:cinemapp/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapp/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Definición de un proveedor para la implementación de ActorsRepository
final actorsRepositoryProvider = Provider((ref) {
  //Retorna una instancia de ActorRepositoryImpl con ActorMovieDbDatasource como fuente de datos
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});

/*
Este código define un proveedor llamado actorsRepositoryProvider que utiliza 
la biblioteca flutter_riverpod. El proveedor devuelve una instancia de 
ActorRepositoryImpl con ActorMovieDbDatasource como fuente de datos.

En resumen, el proveedor actorsRepositoryProvider proporciona una forma de 
inyectar la dependencia de ActorRepositoryImpl en el código de la aplicación, 
lo que facilita la unidad de pruebas y el mantenimiento del código.
 */