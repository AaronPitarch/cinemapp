import 'package:cinemapp/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> with AutomaticKeepAliveClientMixin {

  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;

    isLoading = true;
    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
            Text('No hay favoritos', style: TextStyle(fontSize: 30, color: colors.primary))
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: loadNextPage,
        movies: favoriteMovies
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/*
Este código define una vista para mostrar las películas favoritas de un 
usuario en una aplicación de cine. La vista se construye utilizando el patrón 
de widget ConsumerStatefulWidget de Flutter, lo que significa que tiene un 
estado asociado que se puede actualizar cuando cambian las dependencias.

La clase FavoritesView extiende ConsumerStatefulWidget y define un constructor 
sin parámetros. La clase FavoritesViewState extiende ConsumerState y contiene 
el estado de la vista, incluyendo dos variables booleanas isLastPage y 
isLoading, y dos métodos loadNextPage y build.

En el método initState, se llama al método loadNextPage para cargar las 
primeras películas favoritas. El método loadNextPage verifica si la carga ya 
está en progreso o si se ha alcanzado el final de la lista de películas 
favoritas antes de realizar una nueva llamada al proveedor 
favoriteMoviesProvider para cargar la siguiente página de películas.

En el método build, se utiliza el proveedor favoriteMoviesProvider para 
obtener la lista de películas favoritas y se muestran en una cuadrícula 
(MovieMasonry). Si no hay películas favoritas, se muestra un mensaje indicando 
que no hay películas favoritas.

La vista también tiene una propiedad loadNextPage que se puede utilizar para 
cargar la siguiente página de películas favoritas cuando se alcance el final 
de la cuadrícula.

La vista también implementa la mezcla AutomaticKeepAliveClientMixin para 
mantener la vista en memoria mientras el usuario navega entre diferentes 
vistas de la aplicación.
 */