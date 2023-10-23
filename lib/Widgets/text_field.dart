import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPrimary extends StatelessWidget {
  final bool obscureTxt;
  final String labelTxt;
  final bool allNumbers;
  final IconButton? passwordController;
  final ValueChanged<String>? onChanged;
  final Color? textColor;
  final Color? bgColor;
  final double? fontSize;
  const TextFieldPrimary(
      {super.key,
      this.obscureTxt = false,
      this.labelTxt = "",
      this.allNumbers = false,
      this.passwordController,
      this.onChanged,
      this.textColor,
      this.bgColor,
      this.fontSize});

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
        floatingLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.tertiary, fontSize: fontSize),
        border: OutlineInputBorder(
            //estando normal
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Theme.of(context).primaryColorDark)),
        enabledBorder: OutlineInputBorder(
            //estando habilitado
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(
                width: 1.0, color: Theme.of(context).primaryColorDark)),
        focusedBorder: OutlineInputBorder(
            //si estan escribiendo sobre el
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            borderSide:
                BorderSide(width: 2.0, color: Theme.of(context).primaryColor)),
        labelText: labelTxt,
        suffixIcon: passwordController,
        labelStyle:
            TextStyle(color: Theme.of(context).hintColor, fontSize: fontSize),
      ),
      style: TextStyle(fontSize: fontSize),
      onChanged: onChanged,
    );
  }
}
