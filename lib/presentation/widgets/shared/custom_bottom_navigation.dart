import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {

  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
      break;
      case 1:
        context.go('/home/1');
      break;
      case 2:
        context.go('/home/2');
      break;
    }
  }

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTap(context, value),
      elevation: 0,
      selectedItemColor: colors.primary,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),

        BottomNavigationBarItem(
          icon: Icon( Icons.thumbs_up_down_outlined ),
          label: 'Populares'
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        )
      ]
    );
  }
}

/*
Este código define un widget CustomBottomNavigation que muestra una barra de 
navegación inferior personalizada con tres opciones: "Inicio", "Populares" y 
"Favoritos". La clase CustomBottomNavigation extiende StatelessWidget y recibe 
un índice actual como parámetro.

En el método onItemTap, se cambia la pantalla actual según el índice 
seleccionado.

En el método build, se crea un widget BottomNavigationBar que muestra la barra 
de navegación inferior. El BottomNavigationBar tiene un índice actual, un 
callback onTap que se ejecuta cuando se selecciona un opción, una elevación de 
0, un color de texto seleccionado y una lista de opciones.

Cada opción se crea con el widget BottomNavigationBarItem y se define con un 
icono y un texto.

En resumen, el widget CustomBottomNavigation muestra una barra de navegación 
inferior personalizada con tres opciones: "Inicio", "Populares" y "Favoritos". 
El widget BottomNavigationBar controla la barra de navegación inferior y el 
callback onTap se ejecuta cuando se selecciona un opción.
 */