import 'package:flutter/material.dart';

class TransportsView extends StatefulWidget {
  const TransportsView({super.key});

  @override
  State<TransportsView> createState() => _TransportsViewState();
}

class _TransportsViewState extends State<TransportsView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Transports', style: TextStyle(color: Colors.black)));
  }
}
