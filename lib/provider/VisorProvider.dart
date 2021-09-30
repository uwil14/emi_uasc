import 'package:flutter/material.dart';

class VisorProvider with ChangeNotifier{
  String _link = "0";
  String get link{
    return _link;
  }

  set link(String valor){
    _link=valor;
    notifyListeners();
  }
}