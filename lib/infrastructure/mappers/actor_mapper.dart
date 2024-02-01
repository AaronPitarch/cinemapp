import 'package:cinemapp/domain/entities/actor.dart';
import 'package:cinemapp/infrastructure/models/moviedb/credits_response.dart';

//Clase de mapeo para convertir datos de la API de actores (Cast) a la entidad Actor
class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
      ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}' 
      : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png', 
    character: cast.character
  );
}

/*
Este código define una clase llamada ActorMapper que se utiliza para 
convertir los datos de la API de actores (Cast) a la entidad Actor. La 
clase ActorMapper tiene un método estático castToEntity(Cast cast) que toma 
un objeto Cast como parámetro y devuelve un objeto Actor.

El método castToEntity(Cast cast) crea un nuevo objeto Actor y asigna los 
valores de id, name, profilePath y character del objeto Cast a los 
correspondientes campos del objeto Actor. El campo profilePath se utiliza 
para construir la URL de la imagen del actor, utilizando la URL base de la 
API de The Movie DB y el valor de profilePath del objeto Cast. Si el valor 
de profilePath es nulo, se utiliza una imagen de perfil en blanco como reemplazo.

En resumen, la clase ActorMapper proporciona una forma de convertir los datos 
de la API de actores (Cast) a la entidad Actor, lo que facilita la integración 
de los datos de la API con el resto del código de la aplicación.
 */