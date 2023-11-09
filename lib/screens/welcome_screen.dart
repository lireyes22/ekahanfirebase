import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:ekahanfirebase/Widgets/button.dart';
//import 'package:ekahanfirebase/Widgets/logo.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String routeName = '';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 400,
              child: BabylonJSViewer(
                src: 'assets/models3D/manati_4.glb',
              ),
            ),
            //const Logo(height: 94),
            const SizedBox(height: 55),
            ModelButtonPrimary(
              widthFactor: 0.8, // Personaliza el ancho del botón
              highSize: 11,
              fontSize: 22,
              buttonText: 'Log In', // Cambia el texto del botón
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const SizedBox(height: 10),
            ModelButtonPrimary(
              widthFactor: 0.8, // Personaliza el ancho del botón
              highSize: 11,
              fontSize: 22,
              buttonText: 'Register', // Cambia el texto del botón
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            )
          ],
        ),
      ),
    );
  }
}
