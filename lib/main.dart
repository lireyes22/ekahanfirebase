import 'package:ekahanfirebase/providers/provider_prueba.dart';
import 'package:ekahanfirebase/screens/info_lugar_screen.dart';
import 'package:ekahanfirebase/screens/prueba_screen.dart';
import 'package:flutter/material.dart';
//Firebase:
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
//Pantallas:
import 'package:ekahanfirebase/screens/home_screen.dart';
import 'package:ekahanfirebase/screens/login_screen.dart';
import 'package:ekahanfirebase/screens/register_screen.dart';
import 'package:ekahanfirebase/screens/packs_screen.dart';
import 'package:ekahanfirebase/screens/welcome_screen.dart';
//Tema de color
//import 'package:ekahanfirebase/themes/theme_dark.dart';
import 'package:ekahanfirebase/themes/theme_light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(create: (_) => ProviderPrueba(), child: _home()));
}

MaterialApp _home() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: lightThemeData,
    home: const WelcomeScreen(),
    initialRoute: WelcomeScreen.routeName,
    routes: <String, WidgetBuilder>{
      LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
      RegisterScreen.routeName: (BuildContext context) =>
          const RegisterScreen(),
      HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
      WelcomeScreen.routeName: (BuildContext context) => const WelcomeScreen(),
      PacksScreen.routeName: (BuildContext context) => const PacksScreen(),
      PruebaScreen.routeName: (BuildContext context) => const PruebaScreen(),
      InfoLugarScreen.routeName: (BuildContext context) =>
          const InfoLugarScreen()
    },
  );
}
