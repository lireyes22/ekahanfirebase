import 'package:flutter/material.dart';

class BuildPackScreen extends StatefulWidget {
  const BuildPackScreen({Key? key}) : super(key: key);
  static const String routeName = '/buildpack';

  @override
  State<BuildPackScreen> createState() => _BuildPackScreenState();
}

class _BuildPackScreenState extends State<BuildPackScreen> {
  @override
  Widget build(BuildContext context) {
    final String documentID =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Center(
        child: Text('ID del Documento: $documentID'),
      ),
    );
  }
}
