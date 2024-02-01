import 'package:flutter_dotenv/flutter_dotenv.dart';

// Proporciona la clave de la API de The Movie DB
class Environment {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
}

/*
Este código importa la biblioteca flutter_dotenv para cargar variables de 
entorno y define una clase llamada Environment con una sola variable 
estática theMovieDbKey de tipo String.

La variable theMovieDbKey almacena la clave de la API de The Movie DB, la 
cual se carga desde un archivo .env utilizando la función 
dotenv.env['THE_MOVIEDB_KEY']. Si la clave no se encuentra en el 
archivo .env, se asigna el valor 'No hay api key' a la variable theMovieDbKey.

En resumen, la clase Environment proporciona una forma fácil y segura de 
almacenar y acceder a la clave de la API de The Movie DB desde un 
archivo .env, lo que permite evitar hardcodear la clave en el código y 
facilita su gestión y actualización. 
*/