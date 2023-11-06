import 'package:flutter/material.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({super.key});

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Restaurants', style: TextStyle(color: Colors.black)));
  }
}
