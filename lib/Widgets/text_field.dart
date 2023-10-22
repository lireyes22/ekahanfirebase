import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPrimary extends StatelessWidget {
  final bool obscureTxt;
  final String labelTxt;
  final bool allNumbers;
  final IconButton? passwordController;
  final ValueChanged<String>? onChanged;
  const TextFieldPrimary(
      {super.key,
      this.obscureTxt = false,
      this.labelTxt = "",
      this.allNumbers = false,
      this.passwordController,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: [
        if (allNumbers)
          FilteringTextInputFormatter.allow(
              RegExp(r'[0-9]')), // Solo permite números
      ],
      textAlign: TextAlign.center,
      obscureText: obscureTxt,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            //estando normal
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Color.fromARGB(255, 28, 96, 27))),
        enabledBorder: const OutlineInputBorder(
            //estando habilitado
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide:
                BorderSide(width: 1.0, color: Color.fromARGB(255, 28, 96, 27))),
        focusedBorder: const OutlineInputBorder(
            //si estan escribiendo sobre el
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide:
                BorderSide(width: 2.0, color: Color.fromARGB(255, 20, 67, 20))),
        labelText: labelTxt,
        suffixIcon: passwordController,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 28, 96, 27),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
