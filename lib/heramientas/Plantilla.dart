import 'package:animate_do/animate_do.dart';
import 'package:emi_uasc/menu/Contacto.dart';
import 'package:emi_uasc/provider/MenuProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Plantilla extends StatefulWidget {
  @override
  _PlantillaState createState() => _PlantillaState();
}

class _PlantillaState extends State<Plantilla> {

  @override

  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return menuProvider.title == "CONTACTO"
        ? Contacto()
        : Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: menuProvider.title == "INSTRUCCIÓN"
                  ? Color(0xff04230C)
                  : menuProvider.title == "BIBLIOTECAS"
                      ? Colors.brown
                      : Color(0xff034692),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              centerTitle: true,
              title: Text(
                menuProvider.title,
                style: TextStyle(
                    color: Colors.white, fontFamily: "MontserratSemiBold"),
              ),
            ),
            body: menuProvider.body,
          );
  }
}
