import 'package:cinemapp/config/constants/environment.dart';
import 'package:cinemapp/domain/datasources/actors_datasource.dart';
import 'package:cinemapp/domain/entities/actor.dart';
import 'package:cinemapp/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapp/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

//Implementa la obtencion de actores desde la API de The Movie DB
class ActorMovieDbDatasource extends ActorsDatasource {

  //Instancia de Dio para realizar peticiones HTTP
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-ES',
    }
  ));

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async{
    //Realiza una solicitud HTTP para obtener los creditos de una pelicula
    final response = await dio.get('/movie/$movieId/credits');
    //Convierte la respuesta en un objeto
    final castResponse = CreditsResponse.fromJson(response.data);

    //Mapea los datos de los actores a objetos Actor y devuelve la lista
    List<Actor> actors = castResponse.cast.map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
  }
 }

 /**
Este código define una clase llamada ActorMovieDbDatasource que implementa la 
interfaz ActorsDatasource. La clase se encarga de obtener información sobre 
actores desde la API de The Movie DB.

La clase ActorMovieDbDatasource utiliza la biblioteca Dio para realizar 
solicitudes HTTP a la API de The Movie DB. La instancia de Dio se inicializa 
con la URL base de la API y los parámetros de consulta necesarios, como la 
clave de API y el idioma.

El método getActorByMovie(String movieId) se encarga de obtener la lista de 
actores que actuaron en una película específica, dado su identificador 
(movieId). La solicitud HTTP se realiza a la API de The Movie DB con el 
endpoint /movie/$movieId/credits, que devuelve una respuesta en formato JSON. 
La respuesta se analiza utilizando la clase CreditsResponse y se mapea a una 
lista de objetos Actor utilizando la clase ActorMapper.

En resumen, la clase ActorMovieDbDatasource proporciona una implementación 
concreta de la interfaz ActorsDatasource para obtener información sobre 
actores desde la API de The Movie DB.
  */