import 'package:cinemapp/domain/entities/movie.dart';

//Interfaz abstracta que maneja la informacion almacenada localmente
abstract class LocalStorageDatasource {
  //Cambia el estado de favorito para una pelicula
  Future<void> toggleFavorite(Movie movie);
  //Verifica si una pelicula esta marcada como favorita
  Future<bool> isMovieFavorite(int movieId);
  //Carga una lista de peliculas desde el almacenamiento local
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}

/*
Este codigo define una interfaz abstracta llamada LocalStorageDatasource 
en Dart. Esta interfaz se utiliza para proporcionar una abstracción sobre 
cómo se accede y se manipula la información almacenada local en una aplicación.

La interfaz define tres métodos abstractos:

toggleFavorite: Este método toma un objeto Movie como parámetro y devuelve 
una Future de void. La Future se utiliza para representar una operación 
asíncrona que cambia el estado de favorito de una película en particular 
en el almacenamiento local.

isMovieFavorite: Este método toma un int que representa el ID de una película 
y devuelve una Future de bool. La Future se utiliza para representar una 
operación asíncrona que verifica si una película en particular está marcada 
como favorita en el almacenamiento local.

loadMovies: Este método devuelve una Future de una lista de objetos Movie. 
La Future se utiliza para representar una operación asíncrona que carga una 
lista de películas desde el almacenamiento local. El método acepta dos 
parámetros opcionales, limit y offset, que se utilizan para controlar la 
cantidad y el desplazamiento de las películas que se cargan.

La interfaz LocalStorageDatasource se utiliza para definir un contrato que 
debe cumplir cualquier clase que implemente esta interfaz. Esto significa 
que cualquier clase que implemente LocalStorageDatasource debe proporcionar 
una implementación de los métodos definidos en la interfaz. Esto permite a 
la aplicación interactuar con diferentes orígenes de datos locales de manera 
consistente, independientemente de cómo se implementen los detalles de la 
obtención y el almacenamiento de datos.
 */