import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/plantilla.dart';
import 'package:emi_uasc/menu/movilidad_internacional.dart';
import 'package:emi_uasc/menu/oferta.dart';
import 'package:emi_uasc/menu/tour.dart';
import 'package:emi_uasc/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import 'becas.dart';
import 'bibliotecas.dart';
import 'buzon.dart';
import 'contacto.dart';
import 'convenios.dart';
import 'grado.dart';
import 'idiomas.dart';
import 'instruccion.dart';
import 'movilidad_nacional.dart';
import 'posgrado.dart';
import 'tecnico.dart';
import 'uniforme.dart';
import 'package:sizer/sizer.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    Widget icono(String i) {
      final menuProvider = Provider.of<MenuProvider>(context);
      return Expanded(
          child: GestureDetector(
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
                    menuProvider.body = Becas();
                    menuProvider.title = "BECAS";
                    break;
                  case '5':
                    menuProvider.body = Convenios();
                    menuProvider.title = "CONVENIOS";
                    break;
                  case '6':
                    menuProvider.body = Instruccion();
                    menuProvider.title = "INSTRUCCIÓN";
                    break;
                  case '7':
                    menuProvider.body = Uniformes();
                    menuProvider.title = "UNIFORMES";
                    break;
                  case '8':
                    menuProvider.body = MovilidadNacional();
                    menuProvider.title = "MOVILIDAD NACIONAL";
                    break;
                  case '9':
                    menuProvider.body = MovilidadInternacional();
                    menuProvider.title = "MOVILIDAD INTERNACIONAL";
                    break;
                  case '10':
                    menuProvider.body = Tour();
                    menuProvider.title = "EMI 360";
                    break;
                  case '11':
                    menuProvider.body = Buzon();
                    menuProvider.title = "BUZON";
                    break;
                  case '12':
                    menuProvider.body = Contacto();
                    menuProvider.title = "CONTACTO";
                    break;
                }
                Navigator.of(context).push((_createRoute()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 1.w),
                width: 23.w,
                child: SvgPicture.asset(
                  'images/menu/$i.svg',
                  color: const Color(0xff004796),
                ),
              )));
    }

    return Column(
      children: [
        Container(
          height: 60.h,
          padding: EdgeInsets.only(top: 3.h),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff034693), Color(0xff034693)],
                  stops: [0.3, 1],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Panorama(
                hotspots: [
                  Hotspot(
                    latitude: 0,
                    longitude: 50,
                    width: 30.h,
                    height: 30.h,
                    widget: Image.asset(
                      'images/emi.png',
                    ),
                  ),
                  Hotspot(
                    latitude: 0,
                    longitude: 230,
                    width: 30.h,
                    height: 30.h,
                    widget: Image.asset(
                      'images/emi.png',
                    ),
                  ),
                  Hotspot(
                    latitude: 0,
                    longitude: 315,
                    width: 30.h,
                    height: 30.h,
                    widget: Image.asset(
                      'images/emi.png',
                    ),
                  ),
                ],
                interactive: false,
                animSpeed: 2,
                child: const Image(
                  image: CachedNetworkImageProvider(
                      'https://santacruz.emi.edu.bo/images/App/virtual/modulo.JPG'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 1.h, right: 3.w),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "EMI UASC",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "MontserratExtraBold",
                      color: Colors.white,
                      fontSize: 30.sp),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.white,
          child: FadeInRight(
            delay: const Duration(milliseconds: 1500),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  children: [
                    Container(
                        width: 30.w,
                        margin: EdgeInsets.only(top: 1.5.h, left: 10.w),
                        alignment: Alignment.center,
                        child: Text(
                          "OFERTA ACADÉMICA",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xff034693),
                            fontFamily: "MontserratExtraBold",
                            fontSize: 2.h,
                          ),
                        )),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      height: 30.h,
                      width: 60.w,
                      margin:
                          EdgeInsets.only(top: 1.h, bottom: 1.h, left: 10.w),
                      padding: EdgeInsets.only(),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                icono("0"),
                                icono("2"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [icono("1"), icono("3")],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: 40.w,
                        margin: EdgeInsets.only(top: 1.5.h, left: 10.w),
                        alignment: Alignment.center,
                        child: Text(
                          "EMI EXPERIENCE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xff034693),
                            fontFamily: "MontserratExtraBold",
                            fontSize: 2.h,
                          ),
                        )),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      height: 30.h,
                      width: 60.w,
                      margin:
                          EdgeInsets.only(top: 1.h, bottom: 1.h, left: 10.w),
                      padding: EdgeInsets.only(),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                icono("4"),
                                icono("6"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [icono("5"), icono("7")],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: 40.w,
                        margin: EdgeInsets.only(top: 1.5.h, left: 10.w),
                        alignment: Alignment.center,
                        child: Text(
                          "MOVILIDAD ESTUDIANTIL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xff034693),
                            fontFamily: "MontserratExtraBold",
                            fontSize: 2.h,
                          ),
                        )),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      height: 30.h,
                      width: 60.w,
                      margin:
                          EdgeInsets.only(top: 1.h, bottom: 1.h, left: 10.w),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                icono("8"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                icono("9"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: 40.w,
                        margin: EdgeInsets.only(
                            top: 1.5.h, left: 10.w, right: 10.w),
                        alignment: Alignment.center,
                        child: Text(
                          "MÁS INFORMACION",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color(0xff034693),
                            fontFamily: "MontserratExtraBold",
                            fontSize: 2.h,
                          ),
                        )),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      height: 30.h,
                      width: 60.w,
                      margin: EdgeInsets.only(
                          top: 1.h, bottom: 1.h, left: 10.w, right: 10.w),
                      padding: EdgeInsets.only(),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Row(
                                children: [
                                  icono("10"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                icono("11"),
                                icono("12"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const Plantilla(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 0.1);
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
