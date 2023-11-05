import 'package:flutter/material.dart';

class ProviderPrueba with ChangeNotifier {
  String _pr = "txt1";

  //Vemos el estado global
  String get pr => _pr;

  void addLetter(String pr) {
    _pr += pr;

    notifyListeners();
  }
}
