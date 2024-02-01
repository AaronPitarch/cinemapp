import 'package:cinemapp/presentation/views/views.dart';
import 'package:cinemapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    PopularView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if ( pageController.hasClients ) {
      pageController.animateToPage(
        widget.pageIndex, 
        curve: Curves.easeInOut, 
        duration: const Duration( milliseconds: 250),
      );
    }

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation( 
        currentIndex: widget.pageIndex,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/*
Este código define la pantalla principal de la aplicación, que consta de tres 
pestañas: Inicio, Populares y Favoritos. La pantalla se implementa utilizando 
un PageView con tres vistas diferentes, una para cada pestaña, y un 
CustomBottomNavigation como barra de navegación inferior.

La clase HomeScreen extiende StatefulWidget y tiene una variable pageIndex que 
indica la pestaña actual. La pantalla tiene un controlador de páginas 
pageController que se utiliza para animar la transición entre pestañas.

En el método initState, se crea el controlador de páginas y se establece la 
propiedad keepPage en true para mantener la página actual cuando se cambia de 
pestaña.

En el método dispose, se llama al método dispose del controlador de páginas 
para liberar los recursos.

La variable viewRoutes es una lista de widgets que contiene las tres vistas de 
las pestañas: HomeView, PopularView y FavoritesView.

En el método build, se devuelve un Scaffold con un PageView y un 
CustomBottomNavigation. El PageView tiene un NeverScrollableScrollPhysics para 
deshabilitar el desplazamiento y un controlador de páginas pageController. 
Los hijos del PageView son las vistas definidas en la variable viewRoutes. 
La barra de navegación inferior es un CustomBottomNavigation con la propiedad 
currentIndex establecida en la pestaña actual.

La propiedad wantKeepAlive se establece en true para mantener la página 
actual cuando se cambia de pestaña.

En resumen, este código define la pantalla principal de la aplicación, que 
consta de tres pestañas: Inicio, Populares y Favoritos. La pantalla se 
implementa utilizando un PageView con tres vistas diferentes, una para cada 
pestaña, y un CustomBottomNavigation como barra de navegación inferior.
 */