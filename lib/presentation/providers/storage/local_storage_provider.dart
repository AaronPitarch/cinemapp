import 'package:cinemapp/infrastructure/datasources/isar_datasource.dart';
import 'package:cinemapp/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});

/*
Este código define un proveedor llamado localStorageRepositoryProvider en 
Flutter Riverpod, que se utiliza para proporcionar instancia de 
LocalStorageRepositoryImpl al resto de la aplicación.

La clase LocalStorageRepositoryImpl una implementación concreta de un 
repositorio de almacenamiento local, que se encarga de gestionar la lógica 
de acceso a datos de la aplicación en almacenamiento local. Para ello, utiliza 
una instancia de IsarDatasource, que es una fuente de datos abstracta que 
define una interfaz para acceder a los datos en almacenamiento local.

En resumen, este código define un proveedor para un repositorio de 
almacenamiento local que utiliza una fuente de datos abstracta, en este caso, 
una implementación concreta de IsarDatasource.
 */