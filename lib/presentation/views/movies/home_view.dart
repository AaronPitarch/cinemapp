import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapp/presentation/providers/providers.dart';
import 'package:cinemapp/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upComingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            titlePadding: EdgeInsets.zero,
            centerTitle: false,
          ),
        ),
        
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: slideShowMovies),
                  MovieHorizontalListView(
                    movies: nowPlayingMovies, 
                    title: 'En cines', 
                    subtitle: 'Lunes 20',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                    },
                  ),
      
                  MovieHorizontalListView(
                    movies: upComingMovies, 
                    title: 'Proximamente', 
                    subtitle: 'En este mes',
                    loadNextPage: () {
                      ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                    },
                  ),
      
                  MovieHorizontalListView(
                    movies: popularMovies, 
                    title: 'Populares', 
                    loadNextPage: () {
                      ref.read(popularMoviesProvider.notifier).loadNextPage();
                    },
                  ),
      
                  MovieHorizontalListView(
                    movies: topRatedMovies, 
                    title: 'Mejor calificadas', 
                    loadNextPage: () {
                      ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                    },
                  ),

                  const SizedBox(height: 10),
                ],
              );
            },

            childCount: 1,
          )
        )
      ]
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/*
Este código define la vista principal de la aplicación, que se muestra cuando 
se selecciona la pestaña "Inicio" en la barra de navegación inferior. La 
vista se implementa utilizando el widget ConsumerStatefulWidget y el estado 
HomeViewState.

En el método initState, se utilizan los proveedores nowPlayingMoviesProvider, 
popularMoviesProvider, topRatedMoviesProvider y upcomingMoviesProvider para 
cargar las películas en cada categoría.

En el método build, se utiliza el proveedor initialLoadingProvider para 
verificar si se está cargando la vista inicial y mostrar un indicador de 
progreso si es así. Luego, se utilizan los proveedores moviesSlideshowProvider, 
nowPlayingMoviesProvider, popularMoviesProvider, topRatedMoviesProvider y 
upcomingMoviesProvider para obtener las listas de películas y se muestran en 
una lista desplazable utilizando el widget CustomScrollView. Dentro del 
CustomScrollView, se utilizan varios widgets Sliver para definir el contenido 
de la vista, como el SliverAppBar y varios SliverList que contienen las 
películas en cada categoría.

Cada categoría de películas se muestra utilizando el widget 
MovieHorizontalListView, que es un widget personalizado que muestra las 
películas en una lista horizontal y tiene tres propiedades: movies, title y 
subtitle. La propiedad movies es la lista de películas a mostrar, la propiedad 
title es el título de la categoría y la propiedad subtitle es la subtitulo 
opcional de la categoría.

La propiedad wantKeepAlive se establece en true para mantener la vista en 
memoria cuando se cambia de pestaña.

En resumen, este código define la vista principal de la aplicación, que se 
muestra cuando se selecciona la pestaña "Inicio" en la barra de navegación 
inferior. La vista se implementa utilizando el widget ConsumerStatefulWidget 
y el estado HomeViewState. Se utilizan varios proveedores para cargar las 
películas en cada categoría y se muestran en una lista desplazable utilizando 
el widget CustomScrollView. Cada categoría de películas se muestra utilizando 
el widget MovieHorizontalListView. La propiedad wantKeepAlive se establece en 
true para mantener la vista en memoria cuando se cambia de pestaña.
 */