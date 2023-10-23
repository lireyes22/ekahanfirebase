import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double height;
  final double heightIcon;
  final Color? txtColor;
  const Logo(
      {super.key, this.height = 94, this.heightIcon = 200, this.txtColor});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.asset(
        "assets/images/colibri3.png",
        alignment: Alignment.center,
        height: heightIcon,
      ),
      const SizedBox(height: 25),
      Text(
        "Ek Ahan",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'MayaUno', // Cambia 'YourFont' a la fuente deseada
          fontSize: height, // Tamaño de fuente
          fontWeight: FontWeight
              .bold, // Peso de la fuente (puedes ajustarlo según tus preferencias)
          color: txtColor, // Color del texto
          // Otros atributos de estilo, como letterSpacing, decoration, etc.
        ),
      ),
    ]);
  }
}
