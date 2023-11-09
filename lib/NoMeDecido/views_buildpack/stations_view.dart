import 'package:flutter/material.dart';

class StationsView extends StatefulWidget {
  const StationsView({super.key});

  @override
  State<StationsView> createState() => _StationsViewState();
}

class _StationsViewState extends State<StationsView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Stations', style: TextStyle(color: Colors.black)));
  }
}
