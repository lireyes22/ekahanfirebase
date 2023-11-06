import 'package:flutter/material.dart';

class TextWithConfigs extends StatelessWidget {
  final double mt;
  final double mb;
  final double fontSize;
  final String text;
  final int nlines;
  final FontWeight tmText;
  final TextOverflow overflow;
  final Color color;
  const TextWithConfigs(
      {super.key,
      this.mt = 0.0,
      this.mb = 0.0,
      this.text = '',
      this.fontSize = 20.0,
      this.tmText = FontWeight.normal,
      this.color = Colors.black,
      this.nlines = 1,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: mt),
        Text(
          text,
          maxLines: nlines,
          overflow: overflow,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: tmText,
          ),
        ),
        SizedBox(height: mb),
      ],
    );
  }
}
