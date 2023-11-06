import 'package:flutter/material.dart';

class DividerLi extends StatelessWidget {
  final Color color;
  final double tm;
  const DividerLi(
      {super.key,
      this.color = const Color.fromARGB(50, 0, 0, 0),
      this.tm = 0.5});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: tm, // Grosor de la línea
        decoration: BoxDecoration(
          color: color, // Color de la línea
          borderRadius: BorderRadius.circular(
              50), // Radio de borde para hacerlo redondeado
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}
