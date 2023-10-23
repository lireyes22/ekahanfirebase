import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData(
  primaryColor: const Color(0xFF00897B), // Color primario
  primaryColorDark: Colors.black,
  hintColor: Colors.black, // Color de acento

  // Colores de texto
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        color: Color.fromARGB(255, 96, 59, 27),
        fontSize: 20.0), // Texto de encabezado
    bodyMedium:
        TextStyle(color: Color(0xFF00897B), fontSize: 16.0), // Texto de cuerpo
  ),

  // Fondo
  scaffoldBackgroundColor: const Color(0xFFF0FFF4), // Fondo de los widgets

  // Botones
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF00897B), // Color de fondo de los botones
    textTheme: ButtonTextTheme.primary, // Texto de botones en color claro
  ),

  // Otros estilos
  cardTheme: const CardTheme(
    color: Color(0xFFFFFFFF), // Fondo de las tarjetas
  ),
  colorScheme: const ColorScheme(
    brightness:
        Brightness.light, // Puedes usar 'Brightness.dark' si lo prefieres
    primary: Color(0xFF00897B), // Color primario
    onPrimary: Color(0xFFFFFFFF), // Color de texto sobre el color primario
    primaryContainer: Color(0xFF00A360),
    secondary: Color(0xFF64FFDA), // Color secundario
    onSecondary: Color(0xFF000000), // Color de texto sobre el color secundario
    tertiary: Color(0xFF000000),
    error: Color(0xFFB00020), // Color para errores
    onError: Color(0xFFFFFFFF), // Color de texto sobre el color de error
    background: Color(0xFFFFFFFF), // Color de fondo
    onBackground: Color(0xFF000000), // Color de texto sobre el fondo
    surface: Color(0xFFFFFFFF), // Color de superficie
    onSurface: Color(0xFF000000), // Color de texto sobre la superficie
  ),
);
