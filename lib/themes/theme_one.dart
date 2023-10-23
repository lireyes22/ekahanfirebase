import 'package:flutter/material.dart';

ThemeData themeDataUno = ThemeData(
  primaryColor: const Color(0xFF00897B), // Color primario
  hintColor: const Color(0xFF64FFDA), // Color de acento

  // Colores de texto
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        color: Color(0xFF333333), fontSize: 20.0), // Texto de encabezado
    bodyMedium:
        TextStyle(color: Color(0xFF333333), fontSize: 16.0), // Texto de cuerpo
  ),

  // Fondo
  scaffoldBackgroundColor: const Color(0xFFF0FFF4), // Fondo de los widgets

  // AppBar
  appBarTheme: const AppBarTheme(
    color: Color(0xFF00897B), // Color de la barra de la aplicación
    iconTheme: IconThemeData(
        color: Color(
            0xFFFFFFFF)), // Color de los iconos en la barra de la aplicación
  ),

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
    secondary: Color(0xFF64FFDA), // Color secundario
    onSecondary: Color(0xFF000000), // Color de texto sobre el color secundario
    error: Color(0xFFB00020), // Color para errores
    onError: Color(0xFFFFFFFF), // Color de texto sobre el color de error
    background: Color(0xFFFFFFFF), // Color de fondo
    onBackground: Color(0xFF000000), // Color de texto sobre el fondo
    surface: Color(0xFFFFFFFF), // Color de superficie
    onSurface: Color(0xFF000000), // Color de texto sobre la superficie
  ),
);
