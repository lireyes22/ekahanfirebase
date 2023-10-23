// ignore_for_file: use_build_context_synchronously

import 'package:ekahanfirebase/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:ekahanfirebase/Widgets/button.dart';
import 'package:ekahanfirebase/Widgets/login_separator.dart';
import 'package:ekahanfirebase/Widgets/logo_row.dart';
import 'package:ekahanfirebase/Widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool passwordEye = true;
  String _email = "";
  String _password = "";
  String _name = "";
  String _lastName = "";
  String _mobileNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                const LogoRow(
                  height: 50,
                  heightIcon: 110,
                ),
                const SizedBox(height: 20),
                //Caja de texto para el Email
                TextFieldPrimary(
                  labelTxt: "Email",
                  onChanged: (value) {
                    _email = value;
                  },
                ),
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
                  ),
                ),
                const SizedBox(height: 25),
                //Caja de texto para el Email
                TextFieldPrimary(
                    labelTxt: "Name(s):",
                    onChanged: (value) {
                      _name = value;
                    }),
                const SizedBox(height: 25),
                //Caja de texto para el Email
                TextFieldPrimary(
                    labelTxt: "Last Name(s):",
                    onChanged: (value) {
                      _lastName = value;
                    }),
                const SizedBox(height: 25),
                //Caja de texto para el numero de telefono
                TextFieldPrimary(
                  labelTxt: "Phone Number:",
                  onChanged: (value) {
                    _mobileNumber = value;
                  },
                  allNumbers: true,
                ),
                const SizedBox(height: 25),
                //Boton LogIn
                ModelButtonPrimary(
                  widthFactor: 1, // Personaliza el ancho del botón
                  highSize: 12,
                  fontSize: 25,
                  buttonText: 'Register', // Cambia el texto del botón
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    bool save = await addUser(
                        _email, _password, _name, _lastName, _mobileNumber);
                    if (save) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Registro Exitoso!'),
                      ));
                      Future.delayed(const Duration(seconds: 2));
                      Navigator.pushNamed(context, '');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Error!'),
                      ));
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
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 222, 222, 222)),
                  textColor: Colors.black,
                  iconButton: Image.asset(
                    'assets/images/googleIcon.png',
                    width: 25,
                    height: 25,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
