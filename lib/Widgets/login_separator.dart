import 'package:flutter/material.dart';

class LoginSeparator extends StatelessWidget {
  const LoginSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 5, // Grosor de la línea
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 28, 96, 27), // Color de la línea
                  borderRadius: BorderRadius.circular(
                      50), // Radio de borde para hacerlo redondeado
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Or",
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 20, 67, 20),
                    fontWeight: FontWeight.bold),
              ), // Texto entre los guiones
            ), // Texto entre las líneas
            Expanded(
              child: Container(
                height: 5, // Grosor de la línea
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 28, 96, 27), // Color de la línea
                  borderRadius: BorderRadius.circular(
                      50), // Radio de borde para hacerlo redondeado
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
