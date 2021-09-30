import 'package:emi_uasc/menu/contacto.dart';
import 'package:emi_uasc/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Plantilla extends StatefulWidget {
  const Plantilla({Key? key}) : super(key: key);

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
              shadowColor: Colors.transparent,
              backgroundColor: menuProvider.title == "INSTRUCCIÓN"
                  ? const Color(0xff04230C)
                  : menuProvider.title == "BIBLIOTECAS"
                      ? Colors.brown
                      : const Color(0xff034692),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
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
                style: const TextStyle(
                    color: Colors.white, fontFamily: "MontserratSemiBold"),
              ),
            ),
            body: menuProvider.body,
          );
  }
}
