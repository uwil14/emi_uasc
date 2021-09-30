import 'package:emi_uasc/menu/Menu.dart';
import 'package:flutter/cupertino.dart';

class PosgradoProvider with ChangeNotifier {
  Widget _body = Menu();

  Widget get body {
    return _body;
  }

  set body(Widget valor) {
    _body = valor;
    notifyListeners();
  }

  String _title = "MENU";

  String get title {
    return _title;
  }

  set title(String valor) {
    _title = valor;
    notifyListeners();
  }
}
