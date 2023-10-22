import 'package:flutter/material.dart';

class ModelButtonPrimary extends StatelessWidget {
  final double widthFactor;
  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
  final VoidCallback onPressed;
  final double fontSize;
  final double highSize;
  final Image? iconButton;

  const ModelButtonPrimary({
    super.key,
    this.widthFactor = 0.7,
    this.backgroundColor = const Color.fromARGB(255, 28, 96, 27),
    this.textColor = const Color.fromARGB(255, 255, 255, 255),
    this.buttonText = 'Text',
    required this.onPressed,
    this.fontSize = 20,
    this.highSize = 10,
    this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: highSize),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconButton != null) iconButton!,
            if (iconButton != null) const SizedBox(width: 10),
            Text(
              buttonText,
              style: TextStyle(fontSize: fontSize, color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
