import 'package:flutter/material.dart';

class LogoRow extends StatelessWidget {
  final double height;
  final double heightIcon;
  const LogoRow({super.key, this.height = 94, this.heightIcon = 200});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[      
      Text(
        "Ek Ahan",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'MayaUno', // Cambia 'YourFont' a la fuente deseada
          fontSize: height, // Tamaño de fuente
          fontWeight: FontWeight
              .bold, // Peso de la fuente (puedes ajustarlo según tus preferencias)
          color: const Color.fromARGB(255, 20, 67, 20), // Color del texto
          // Otros atributos de estilo, como letterSpacing, decoration, etc.
        ),
      ),
      const SizedBox(height: 25),
      Image.asset(
        "assets/images/colibri3.png",
        alignment: Alignment.center,
        height: heightIcon,
      ),
    ]);
  }
}
