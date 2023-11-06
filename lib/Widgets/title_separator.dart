import 'package:flutter/material.dart';

class TitleSeparator extends StatelessWidget {
  final String title;

  const TitleSeparator({super.key, this.title = "example"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
