import 'package:cinemapp/domain/entities/entities.dart';
import 'package:cinemapp/infrastructure/models/moviedb/moviedb_videos.dart';

//Clase de mapeo para convertir datos de la API de videos (Result) a la entidad Video
class VideoMapper {
  static moviedbVideoToEntity(Result moviedbVideo) => Video(
    id: moviedbVideo.id, 
    name: moviedbVideo.name, 
    youtubeKey: moviedbVideo.key,
    publishedAt: moviedbVideo.publishedAt
  );
}

/*
Este código define una clase llamada VideoMapper que se utiliza para convertir 
los datos de la API de videos (Result) a la entidad Video. La clase 
VideoMapper tiene un método estático moviedbVideoToEntity(Result moviedbVideo) 
que toma un objeto Result como parámetro y devuelve un objeto Video.

El método moviedbVideoToEntity(Result moviedbVideo) crea un nuevo objeto 
Video y asigna los valores de id, name, youtubeKey, y publishedAt del objeto 
Result a los correspondientes campos del objeto Video.

En resumen, la clase VideoMapper proporciona una forma de convertir los datos 
de la API de videos (Result) a la entidad Video, lo que facilita la 
integración de los datos de la API con el resto del código de la aplicación.
 */