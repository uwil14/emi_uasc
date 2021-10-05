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


  String _name = "Sistemas";
  String get name{
    return _name;
  }

  set name(String valor){
    _name=valor;
    notifyListeners();
  }



  String _objetivo = "Sistemas";
  String get objetivo{
    return _objetivo;
  }

  set objetivo(String valor){
    _objetivo=valor;
    notifyListeners();
  }



}