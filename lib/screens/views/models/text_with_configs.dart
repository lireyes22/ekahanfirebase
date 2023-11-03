import 'package:flutter/material.dart';

class TextWithConfigs extends StatelessWidget {
  final double mt;
  final double mb;
  final double fontSize;
  final String text;
  final FontWeight tmText;
  final TextOverflow overflow;
  const TextWithConfigs(
      {super.key,
      this.mt = 0.0,
      this.mb = 0.0,
      this.text = '',
      this.fontSize = 20.0,
      this.tmText = FontWeight.normal,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: mt),
        Text(
          text,
          overflow: overflow,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: tmText,
          ),
        ),
        SizedBox(height: mb),
      ],
    );
  }
}
