import 'package:emi_uasc/menu/menu.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Widget enlaces(String a, String b, String enlace) {
      return Container(
        padding: EdgeInsets.all(2.h),
        child: Center(
            child: GestureDetector(
          onTap: () {
            launch(enlace);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff0C3C6B),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            padding: EdgeInsets.all(3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(a + " " + b,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "MontserratSemiBold",
                          color: Colors.white,
                          fontSize: 14.sp,
                        ))),
              ],
            ),
          ),
        )),
      );
    }

    return Scaffold(
      body: InnerDrawer(
        boxShadow: const [BoxShadow()],
        onTapClose: true,
        swipe: true,
        colorTransitionChild: const Color(0xff034692),
        colorTransitionScaffold: Colors.white10,
        offset: const IDOffset.only(bottom: 0.00, right: 0.25, left: 0.25),
        scale: const IDOffset.horizontal(1),
        proportionalChildArea: true,
        borderRadius: 20,
        leftAnimationType: InnerDrawerAnimation.quadratic,
        rightAnimationType: InnerDrawerAnimation.quadratic,
        backgroundDecoration: const BoxDecoration(color: Color(0xff034692)),
        leftChild: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'images/izq.png',
                alignment: Alignment.bottomCenter,
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: BounceInUp(
                        child: ListView(
                          children: [
                            Container(
                              height: 130,
                            ),
                            enlaces("Sistema", "de docentes",
                                "https://registro.emi.edu.bo/pregrado/"),
                            enlaces("Soporte", "Tecnico",
                                "https://emiuaschelpdesk.on.spiceworks.com/portal"),
                            enlaces("Asistencia Presencial", "EMI-UASC",
                                "https://asistencia.servicios.emi.edu.bo/login"),
                            enlaces("Asistencia Teletrabajo", "EMI-UASC",
                                "https://teletrabajo.servicios.emi.edu.bo/login"),
                          ],
                        ),
                      ))
                    ],
                  ),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          const Color(0xff034693),
                          const Color(0xff034693).withOpacity(0.1)
                        ],
                            stops: const [
                          0.7,
                          1
                        ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter)),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                        left: 15,
                        right: 20,
                        bottom: 12),
                    child: Image.asset(
                      'images/logo.png',
                      height: 130,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        rightChild: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(fit: StackFit.expand, children: [
            Image.asset(
              'images/der.png',
              alignment: Alignment.bottomCenter,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        child: BounceInDown(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Container(
                            height: 130,
                          ),
                          enlaces("Notas", "SAGA",
                              "https://notas.emi.edu.bo/login"),
                          enlaces("E-libro", "",
                              "https://elibro.net/es/lc/emisantacruz"),
                          enlaces("Mi Libreria", "Digital",
                              "https://site1.milibreriadigital.com/"),
                          enlaces("Repositorio", "de Grado",
                              "http://repositorio.servicios.emi.edu.bo/Visita/view"),
                          enlaces("Repositorio", "de Posgrado",
                              "http://repositorio.servicios.emi.edu.bo/Visita/view2"),
                          enlaces("Office", "365",
                              "https://login.microsoftonline.com/"),
                          enlaces("Moodle", "Grado",
                              "http://campus.santacruz.emi.edu.bo/"),
                          enlaces("Moodle", "Posgrado",
                              "http://posgrado.santacruz.emi.edu.bo/"),
                          enlaces("Tutorial", "Facturación en Línea",
                              "https://www.youtube.com/watch?v=y7CYTwW3n94 "),
                        ],
                      ),
                    ))
                  ],
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        const Color(0xff034693),
                        const Color(0xff034693).withOpacity(0.1)
                      ],
                          stops: const [
                        0.7,
                        1
                      ],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter)),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                      left: 15,
                      right: 20,
                      bottom: 12),
                  child: Image.asset(
                    'images/emi.png',
                    height: 130,
                  ),
                ),
              ],
            )
          ]),
        ),
        scaffold:
            Scaffold(backgroundColor: const Color(0xff005F92), body: Menu()),
      ),
    );
  }
}
