import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/slider_doble.dart';
import 'package:emi_uasc/heramientas/visor.dart';
import 'package:emi_uasc/provider/visor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Convenios extends StatefulWidget {
  const Convenios({Key? key}) : super(key: key);

  @override
  _ConveniosState createState() => _ConveniosState();
}

class _ConveniosState extends State<Convenios> {
  @override
  Widget build(BuildContext context) {
    return SliderDoble(academicos(), sociales(), "Academicos", "Sociales");
  }
  Widget academicos() {
    return Container(
        child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: const Text(
            "La Escuela Militar de Ingeniería tiene diferentes convenios académicos: de práctica empresarial, de implementación de proyectos, con entidades reconocidas Nacionales e Internacionales. Algunas de estas entidades son:",
            textAlign: TextAlign.justify,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                imagen("0.png", "academicos"),
                imagen("1.jpg", "academicos"),
                imagen("2.png", "academicos"),
                imagen("3.jpg", "academicos"),
                imagen("4.jpg", "academicos"),
                imagen("5.jpg", "academicos"),
                imagen("6.png", "academicos"),
                imagen("7.png", "academicos"),
                imagen("8.png", "academicos"),
                imagen("9.png", "academicos"),
                imagen("10.jpg", "academicos"),
                imagen("11.jpg", "academicos"),
                imagen("12.png", "academicos"),
                imagen("13.png", "academicos"),
                imagen("14.jpg", "academicos"),
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imagen("15.png", "academicos"),
                imagen("16.png", "academicos"),
                imagen("17.png", "academicos"),
                imagen("18.png", "academicos"),
                imagen("19.png", "academicos"),
                imagen("20.png", "academicos"),
                imagen("21.png", "academicos"),
                imagen("22.png", "academicos"),
                imagen("23.jpg", "academicos"),
                imagen("24.png", "academicos"),
                imagen("25.png", "academicos"),
                imagen("26.png", "academicos"),
                imagen("27.jpg", "academicos"),
                imagen("28.jpg", "academicos"),
                imagen("29.png", "academicos"),
                imagen("30.png", "academicos"),
              ],
            )),
          ],
        )
      ],
    ));
  }

  Widget sociales() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: const Text(
            "La Escuela Militar de Ingenieria esta constantemente realizando convenios sociales. Actualmente tenemos los siguientes convenios sociales :",
            textAlign: TextAlign.justify,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                imagen("0.png", "sociales"),
                imagen("1.jpg", "sociales"),
                imagen("2.png", "sociales"),
                imagen("3.jpg", "sociales"),
                imagen("4.png", "sociales"),
                imagen("5.jpg", "sociales"),
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imagen("6.jpg", "sociales"),
                imagen("7.jpg", "sociales"),
                imagen("8.png", "sociales"),
                imagen("9.png", "sociales"),
                imagen("10.png", "sociales"),
                imagen("11.jpg", "sociales"),
              ],
            )),
          ],
        )
      ],
    );
  }

  Widget imagen(String i, String c) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.h,vertical: 1.h),
        child: GestureDetector(
          onTap: () {
            launch("https://wa.me/59171566652");

          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: CachedNetworkImage(
              imageUrl:
                  'https://santacruz.emi.edu.bo/images/App/convenios/$c/$i',
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

//Usamos _createRoute para añadir animacion a la transicion de ventanas hacia el visor
Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Visor(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.1, 0.0);
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
