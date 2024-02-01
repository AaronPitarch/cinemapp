import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: const Color(0xFF2862F5),
    brightness: Brightness.dark
  );
}

/*
Este código define una clase llamada AppTheme que proporciona un método 
getTheme() para devolver un objeto ThemeData que se utiliza para personalizar 
el tema de la aplicación en Flutter.

La propiedad useMaterial3 se establece en true para utilizar el nuevo 
diseño de Material 3 en la aplicación. La propiedad colorSchemeSeed se 
utiliza para definir un color base que se utiliza para generar 
automáticamente una paleta de colores para el tema. En este caso, se 
utiliza el color 0xFF2862F5 como color base. La propiedad brightness se 
establece en Brightness.dark para utilizar un tema oscuro en la aplicación.

En resumen, este código define un tema personalizado para la aplicación 
utilizando la clase ThemeData y las propiedades useMaterial3, colorSchemeSeed 
y brightness. Esto permite a la aplicación tener un aspecto y sensación 
consistentes y personalizados en todas las pantallas y widgets.
 */