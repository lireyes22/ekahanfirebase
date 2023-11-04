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
    return const Scaffold(
      body: Center(child: Text('Hola mundo')),
    );
  }
}
