import 'package:intl/intl.dart';

class HumanFormats {
  //Formatea un numero con la opcion de especificar el numero de decimales
  static String number(double number, [int decimals = 0]) {
    return NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en',
    ).format(number);
  }

  //Formatea una fecha en un formato corto
  static String shortDate(DateTime date) {
    final format = DateFormat.yMMMEd('es');
    return format.format(date);
  }
}

/*
Este código define una clase llamada HumanFormats que contiene dos métodos 
estáticos para dar formato a números y fechas de una manera más fácil de leer 
y entender para los humanos.

El primer método es number, el cual da formato a un número decimal (double) 
especificando el número de decimales opcionalmente. Utiliza la clase 
NumberFormat.compactCurrency para dar formato al número como moneda, pero 
sin mostrar el símbolo de moneda y en inglés ('en').

El segundo método es shortDate, el cual da formato a una fecha (DateTime) 
en un formato corto. Utiliza la clase DateFormat.yMMMEd para dar formato a 
la fecha en español ('es'), mostrando el año completo (y), el mes abreviado 
(MMM) y el día del mes (Ed).

En resumen, la clase HumanFormats proporciona dos métodos estáticos útiles 
para dar formato a números y fechas de una manera más fácil de leer y 
entender para los humanos en diferentes idiomas.
*/ 