import 'package:cinemapp/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

//Define las rutas de la aplicacion utilizando GoRouter
final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    //Ruta principal que dirige a la pantalla de inicio
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = (state.pathParameters['page'] ?? 0).toString();
        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
      routes: [
        //Ruta secundaria para mostrar detalles de una pelicula
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          } 
        ),
      ]
    ),

    //Ruta raiz que redirige a la pantalla de inicio
    GoRoute(
      path: '/',
      redirect: (_ , __) => '/home/0',
    ),
  ]
);

/*
Este código define las rutas de aplicación utilizando la biblioteca GoRouter. 
Importa los archivos screens.dart y go_router.dart para definir y manejar 
las rutas de aplicación. La variable appRouter es una instancia de GoRouter
que se utiliza para definir las rutas de la aplicación. La ruta principal 
es '/home/:page', la cual lleva al usuario a la pantalla de inicio y acepta
un parámetro page opcional. El parámetro `page` se utiliza para mostrar
diferentes pestañas en la pantalla de inicio.

La ruta '/home/:page' tiene una ruta secundaria 'movie/:id', la cual 
lleva al usuario a la pantalla de detalles de una película y acepta un 
parámetro id obligatorio. El parámetro id se utiliza para mostrar los 
detalles de la película seleccionada.

La ruta raíz es '/', la cual redirige automáticamente al usuario a la 
pantalla de inicio con el parámetro page establecido en 0.

En resumen, este código define las rutas de la aplicación utilizando 
GoRouter, lo que permite una navegación fácil y eficiente entre las 
diferentes pantallas de la aplicación.
 */