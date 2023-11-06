import 'package:flutter/material.dart';

class TouristPlacesView extends StatefulWidget {
  const TouristPlacesView({super.key});

  @override
  State<TouristPlacesView> createState() => _TouristPlacesViewState();
}

class _TouristPlacesViewState extends State<TouristPlacesView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Tourist Places', style: TextStyle(color: Colors.black)));
  }
}
