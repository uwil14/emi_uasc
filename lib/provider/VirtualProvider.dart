import 'package:flutter/material.dart';

class VirtualProvider with ChangeNotifier{
  String _title = "INGENIERIA";
  String get title{
    return _title;
  }

  set title(String valor){
    _title=valor;
    notifyListeners();
  }

  String _body = 'images/emi.JPG';

  String get body {
    return _body;
  }

  set body(String valor) {
    _body = valor;
    notifyListeners();
  }
}