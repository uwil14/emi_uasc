import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/plantilla.dart';
import 'package:emi_uasc/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'becas.dart';
import 'bibliotecas.dart';
import 'buzon.dart';
import 'contacto.dart';
import 'convenios.dart';
import 'grado.dart';
import 'idiomas.dart';
import 'instruccion.dart';
import 'movilidad.dart';
import 'posgrado.dart';
import 'tecnico.dart';
import 'uniforme.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    Widget icono(String i) {
      final menuProvider = Provider.of<MenuProvider>(context);
      return GestureDetector(
          onTap: () {
            switch (i) {
              case '0':
                menuProvider.body = Grado();
                menuProvider.title = "GRADO";
                break;
              case '1':
                menuProvider.body = Posgrado();
                menuProvider.title = "POSGRADO";
                break;
              case '2':
                menuProvider.body = Tecnico();
                menuProvider.title = "TECNICO";
                break;
              case '3':
                menuProvider.body = Idiomas();
                menuProvider.title = "IDIOMAS";
                break;
              case '4':
                menuProvider.body = Convenios();
                menuProvider.title = "CONVENIOS";
                break;
              case '5':
                menuProvider.body = Becas();
                menuProvider.title = "BECAS";
                break;
              case '6':
                menuProvider.body = Instruccion();
                menuProvider.title = "INSTRUCCIÓN";
                break;
              case '7':
                menuProvider.body = Bibliotecas();
                menuProvider.title = "BIBLIOTECAS";
                break;
              case '8':
                menuProvider.body = Uniformes();
                menuProvider.title = "UNIFORMES";
                break;
              case '9':
                menuProvider.body = Buzon();
                menuProvider.title = "BUZON";
                break;
              case '10':
                menuProvider.body = Contacto();
                menuProvider.title = "CONTACTO";
                break;
              case '11':
                menuProvider.body = Movilidad();
                menuProvider.title = "MOVILIDAD";
                break;
            }
            Navigator.of(context).push((_createRoute()));
          },
          child: Card(
            child: Container(
              padding: EdgeInsets.all(15),
              child: CachedNetworkImage(
                imageUrl: 'https://santacruz.emi.edu.bo/images/App/menu/$i.png',
                fit: BoxFit.fill,
              ),
            ),
          ));
    }

    return Container(
      child: FadeInUp(
          child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).orientation == Orientation.portrait
                    ? 0
                    : MediaQuery.of(context).size.height * 0.02,
              ),
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 0.7
                  : MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width * 0.52,
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                shrinkWrap: true,
                childAspectRatio:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 1
                        : 1,
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 3
                        : 4,
                children: List.generate(12, (index) {
                  return icono("$index");
                }),
              ))),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Plantilla(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.1, 1.0);
        var end = Offset.zero;
        var curve = Curves.linearToEaseOut;

        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}
