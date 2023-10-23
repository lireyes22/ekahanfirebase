// ignore_for_file: use_build_context_synchronously
import 'package:ekahanfirebase/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:ekahanfirebase/Widgets/button.dart';
import 'package:ekahanfirebase/Widgets/login_separator.dart';
import 'package:ekahanfirebase/Widgets/logo.dart';
import 'package:ekahanfirebase/Widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordEye = true;
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Logo(height: 94),
                const SizedBox(height: 20),
                //Caja de texto para el Email
                TextFieldPrimary(
                    labelTxt: "Email",
                    onChanged: (value) {
                      _email = value;
                    }),
                const SizedBox(height: 25),
                //Caja de texto para el password
                TextFieldPrimary(
                    labelTxt: "Password",
                    obscureTxt: passwordEye,
                    onChanged: (value) {
                      _password = value;
                    },
                    passwordController: IconButton(
                      icon: Icon(
                        passwordEye ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromARGB(255, 20, 67, 20),
                      ),
                      onPressed: () {
                        setState(() {
                          passwordEye = !passwordEye;
                        });
                      },
                    )),
                const SizedBox(height: 25),
                //Boton LogIn
                ModelButtonPrimary(
                  widthFactor: 1, // Personaliza el ancho del botón
                  highSize: 12,
                  fontSize: 25,
                  buttonText: 'Log In', // Cambia el texto del botón
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    final result = await getUserEP(_email, _password);
                    if (result) {
                      // Iniciar sesión exitosa
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Inicio de sesion exitoso!')));
                      Navigator.pushNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Credenciales invalidas!')));
                    }
                  },
                ),
                const LoginSeparator(), //Separa con Or
                //Iniciar sesion con google
                ModelButtonPrimary(
                  widthFactor: 1, // Personaliza el ancho del botón
                  highSize: 12,
                  fontSize: 25,
                  buttonText:
                      'Sign in with google', // Cambia el texto del botón

                  textColor: Colors.black,
                  iconButton: Image.asset(
                    'assets/images/googleIcon.png',
                    width: 25,
                    height: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
