import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cinemapp/config/router/app_router.dart';
import 'package:cinemapp/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

Future <void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    initializeDateFormatting();

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}

/*
Este código define la función `main` que es el punto de entrada de la 
aplicación. La función `main` carga las variables de entorno con el paquete 
`flutter_dotenv` y crea un objeto `ProviderScope` que proporciona un contexto 
para los proveedores de Riverpod.

Dentro del ProviderScope, se crea un widget MaterialApp.router que define la 
aplicación de Flutter. El widget MaterialApp.router tiene un enrutador de rutas 
definido con el paquete go_router, un indicador de modo depuración y un tema 
definido con el paquete flutter_riverpod.

El enrutador de rutas se crea con el widget appRouter que se define en el 
archivo app_router.dart. El tema se crea con el widget AppTheme().getTheme() 
que devuelve un objeto ThemeData con los colores y estilos definidos en el 
archivo app_theme.dart.

En resumen, el código define la función main que crea un objeto ProviderScope 
y un widget MaterialApp.router que define la aplicación de Flutter. El widget 
MaterialApp.router tiene un enrutador de rutas y un tema definidos. El enrutador 
de rutas se define con el widget appRouter y el tema se define con el widget 
AppTheme().getTheme().
 */