import 'package:cinemapp/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapp/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Datasource que implementa la interacción con la base de datos local utilizando Isar.
class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  //Inicializa la base de datos local Isar y devuelve una instancia de Isar
  Future<Isar> openDB() async { 
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([MovieSchema], inspector: true,directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  //Verifica si una pelicula esta marcada como favorita en la base de datos
  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;
    final Movie? isFavoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movieId)
      .findFirst();

    return isFavoriteMovie != null;
  }

  //Carga una lista de peliculas desde la base de datos local 
  @override
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0}) async {
    final isar = await db;

    return isar.movies.where()
      .offset(offset)
      .limit(limit)
      .findAll();
  }


  //Cambia el estado de favorito para una pelicula en la base de datos
  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;
    final favoriteMovie = await isar.movies
      .filter()
      .idEqualTo(movie.id)
      .findFirst();

    if (favoriteMovie != null) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));
      return;
    }

    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}

/*
Este código define una clase llamada IsarDatasource que implementa la interfaz 
LocalStorageDatasource. La clase se encarga de interactuar con la base de 
datos local utilizando la biblioteca Isar.

La clase IsarDatasource tiene una variable db que es una instancia de Isar 
y se inicializa en el constructor de la clase. El método openDB() se encarga 
de inicializar la base de datos local Isar y devuelve una instancia de Isar. 
Si la base de datos ya existe, se devuelve una instancia de la misma, de lo 
contrario, se crea una nueva base de datos en el directorio de documentos de 
la aplicación.

La clase IsarDatasource implementa los siguientes métodos abstractos de la 
interfaz LocalStorageDatasource:

isMovieFavorite(int movieId): Este método verifica si una película con el 
identificador dado (movieId) está marcada como favorita en la base de datos 
y devuelve un valor booleano en función del resultado.

loadMovies({int limit = 10, offset = 0}): Este método carga una lista de 
películas desde la base de datos local, con un límite y un desplazamiento 
opcionales para la paginación.

toggleFavorite(Movie movie): Este método cambia el estado de favorito para 
una película específica en la base de datos. Si la película ya existe en la 
base de datos, se elimina, de lo contrario, se agrega a la base de datos.

En resumen, la clase IsarDatasource proporciona una implementación concreta 
de la interfaz LocalStorageDatasource para interactuar con la base de datos 
local utilizando la biblioteca Isar.
 */