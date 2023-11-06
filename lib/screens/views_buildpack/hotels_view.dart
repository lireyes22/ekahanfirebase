import 'package:flutter/material.dart';

class HotelsView extends StatefulWidget {
  const HotelsView({super.key});

  @override
  State<HotelsView> createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Hotels', style: TextStyle(color: Colors.black)));
  }
}
