import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapp/presentation/providers/providers.dart';
import 'package:cinemapp/presentation/widgets/widgets.dart';

class PopularView extends ConsumerStatefulWidget {
  const PopularView({super.key});

  @override
  PopularViewState createState() => PopularViewState();
}

class PopularViewState extends ConsumerState<PopularView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context ) {
    super.build(context);
    
    final popularMovies = ref.watch( popularMoviesProvider );
    
    if ( popularMovies.isEmpty ) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    
    return Scaffold(
      body: MovieMasonry(
        loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
        movies: popularMovies
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

/*
Este código define la vista de películas populares en la aplicación. La vista 
se implementa utilizando el widget ConsumerStatefulWidget y el estado 
PopularViewState.

En el método build, se utiliza el proveedor popularMoviesProvider para obtener 
las películas populares y se verifica si la lista está vacía. Si lo está, se 
muestra un indicador de progreso circular. De lo contrario, se devuelve un 
Scaffold con un MovieMasonry como cuerpo. El MovieMasonry es un widget 
personalizado que muestra las películas en una cuadrícula y tiene dos 
propiedades: loadNextPage y movies. La propiedad loadNextPage es una función 
que se utiliza para cargar la siguiente página de películas y la propiedad 
movies es la lista de películas a mostrar.

La propiedad wantKeepAlive se establece en true para mantener la vista en 
memoria cuando se cambia de pestaña.

En resumen, este código define la vista de películas populares en la 
aplicación. La vista se implementa utilizando el widget ConsumerStatefulWidget 
y el estado PopularViewState. Se utiliza el proveedor popularMoviesProvider 
para obtener las películas populares y se muestran en una cuadrícula utilizando 
el widget MovieMasonry. La propiedad wantKeepAlive se establece en true para 
mantener la vista en memoria cuando se cambia de pestaña.
 */