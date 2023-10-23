import 'package:flutter/material.dart';

ThemeData darkThemeData = ThemeData(
  primaryColor: const Color(0xFF00897B), // Color primario
  hintColor: const Color(0xFF64FFDA), // Color de acento

  // Colores de texto
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        color: Color(0xFFFFFFFF), fontSize: 20.0), // Texto de encabezado
    bodyMedium:
        TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.0), // Texto de cuerpo
  ),

  // Fondo
  scaffoldBackgroundColor: const Color(0xFF333333), // Fondo de los widgets

  // Botones
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF00897B), // Color de fondo de los botones
    textTheme: ButtonTextTheme.primary, // Texto de botones en color claro
  ),

  // Otros estilos
  cardTheme: const CardTheme(
    color: Color(0xFF333333), // Fondo de las tarjetas
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.dark, // Modo oscuro
    primary: Color(0xFF00897B), // Color primario
    primaryContainer: Color(0xFF333333),
    onPrimary: Color(0xFFFFFFFF), // Color de texto sobre el color primario
    secondary: Color(0xFF64FFDA), // Color secundario
    onSecondary: Color(0xFF000000),
    tertiary: Color(0xFFFFFFFF),
    onTertiary: Color(0x00000000), // Color de texto sobre el color secundario
    error: Color(0xFFB00020), // Color para errores
    onError: Color(0xFFFFFFFF), // Color de texto sobre el color de error
    background: Color(0xFF333333), // Color de fondo
    onBackground: Color(0xFFFFFFFF), // Color de texto sobre el fondo
    surface: Color(0xFF333333), // Color de superficie
    onSurface: Color(0xFFFFFFFF), // Color de texto sobre la superficie
  ),
);
