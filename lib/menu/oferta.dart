import 'package:animate_do/animate_do.dart';
import 'package:emi_uasc/heramientas/visor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class Oferta extends StatefulWidget {
  @override
  _OfertaState createState() => _OfertaState();
}

class _OfertaState extends State<Oferta> {
  bool carreras = false;

  @override
  Widget build(BuildContext context) {

    Widget carrera(String nombre, Color arriba, Color abajo) {
      return Container(
        margin: EdgeInsets.only(left: 10.w, bottom: 3.h),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push((_createRoute(Visor())));
          },
          child: Row(
            children: [
              Container(
                height: 4.5.h,
                width: 4.5.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [arriba, abajo],
                        stops: const [0.1, 0.8],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter)),
              ),
              Container(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  nombre,
                  style: TextStyle(
                      fontFamily: "MontserratRegular",
                      color: Colors.black54,
                      fontSize: 15.sp),
                ),
              )
            ],
          ),
        ),
      );
    }



    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 30.h,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff005F92), Color(0xff1C3B70)],
                    stops: [0.1, 0.8],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 5.h, left: 3.w),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                     icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                    )
                ),
                Container(
                    padding: EdgeInsets.only(top: 3.h),
                    child: Text(
                      "OFERTA ACADEMICA",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "MontserratExtraBold",
                          color: Colors.white,
                          fontSize: 20.sp),
                    )),
                Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  carreras = false;
                                });
                              },
                              child: Container(
                                margin:
                                EdgeInsets.only(top: 4.h, left: 3.w, right: 2.w),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30)),
                                  gradient: carreras
                                      ? const LinearGradient(
                                      colors: [
                                        Color(0xff1C3B70),
                                        Color(0xff005F92)
                                      ],
                                      stops: [
                                        0.3,
                                        0.8
                                      ],
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter)
                                      : const LinearGradient(
                                      colors: [
                                        Color(0xffFFCB00),
                                        Color(0xffFFCB00)
                                      ],
                                      stops: [
                                        0.3,
                                        0.8
                                      ],
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter),
                                  boxShadow: const[
                                    BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 0.1,
                                        blurRadius: 10),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "INGENIERÍA",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "MontserratSemiBold",
                                        color: carreras
                                            ? Color(0xffFFCB00)
                                            : Color(0xff1C3B70),
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ),
                            )),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    carreras = true;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 4.h, left: 2.w, right: 3.w),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                    gradient: !carreras
                                        ? const LinearGradient(
                                        colors: [
                                          Color(0xff1C3B70),
                                          Color(0xff005F92)
                                        ],
                                        stops: [
                                          0.3,
                                          0.8
                                        ],
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter)
                                        :const LinearGradient(
                                        colors: [
                                          Color(0xffFFCB00),
                                          Color(0xffFFCB00)
                                        ],
                                        stops: [
                                          0.3,
                                          0.8
                                        ],
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter),
                                    boxShadow:const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0.1,
                                          blurRadius: 10),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "TÉCNICAS",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: "MontserratSemiBold",
                                          color: !carreras
                                              ? Color(0xffFFCB00)
                                              : Color(0xff1C3B70),
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                )))
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
              child: Container(
                child: carreras
                    ? FadeInUp(
                    duration: const Duration(milliseconds: 200),
                    key:const Key("Tecnicas"),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        carrera("Construcción Civil", Color(0xff1C3B70),
                            Color(0xff005F92)),
                        carrera("Energías Renovables", Color(0xff47A6DE),
                            Color(0xff68D6F1)),
                        carrera("Sistemas Electrónicas", Color(0xff245B72),
                            Color(0xff47A09E)),
                        carrera("Diseño Gráfico", Color(0xffF29C38),
                            Color(0xffF6BD41)),
                        carrera("Informática", Color(0xff1C3B70),
                            Color(0xff005F92)),
                      ],
                    ))
                    : FadeInUp(
                    duration: Duration(milliseconds: 200),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        carrera(
                            "Química", Color(0xff1C3B70), Color(0xff005F92)),
                        carrera("Agronómica", Color(0xff47A6DE),
                            Color(0xff68D6F1)),
                        carrera(
                            "Civíl", Color(0xff245B72), Color(0xff47A09E)),
                        carrera("Comercial", Color(0xffF29C38),
                            Color(0xffF6BD41)),
                        carrera("Mecatrónica", Color(0xff1C3B70),
                            Color(0xff005F92)),
                        carrera("Ambiental", Color(0xff245B72),
                            Color(0xff47A09E)),
                        carrera("Sistemas Electrónicos", Color(0xffEB3C3A),
                            Color(0xffEF876A)),
                        carrera(
                            "Sistemas", Color(0xff47A6DE), Color(0xff68D6F1)),
                        carrera("Industrial", Color(0xffF6C945),
                            Color(0xff5FD5FA)),
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}

Route _createRoute(pagina) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pagina,
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
