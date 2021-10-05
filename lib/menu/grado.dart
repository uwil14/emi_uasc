import 'package:animate_do/animate_do.dart';
import 'package:emi_uasc/heramientas/slider_doble.dart';
import 'package:emi_uasc/heramientas/visor.dart';
import 'package:emi_uasc/provider/visor_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Grado extends StatefulWidget {
  @override
  _GradoState createState() => _GradoState();
}

class _GradoState extends State<Grado> {
  @override
  Widget build(BuildContext context) {
    return SliderDoble(
        carreras(context), informacion(), "Carreras", "Información");
  }
}

//Aqui va la informacion de informacion
Widget informacion() {
  return ListView(
    physics: ScrollPhysics(),
    children: [
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 5.h),
        child: Text(
          "MISIÓN",
          style: TextStyle(
              color: Color(0xff034692),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "MontserratExtraBold"),
        ),
      ),
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 2.h, left: 3.h, right: 3.h),
        child: Text(
          "Formar y especializar profesionales de excelencia, con principios, valores éticos - morales y cívicos, caraterizados por su responsabilidad social, espiritu emprendedor, liderazgo y disciplina; promoviendo la internacionalización, intereacción social y desarrollo de la Ciencia, Tecnología e Innovación, para contribuir al desarrollo del Estado.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14.sp,
          ),
        ),
      ),
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 5.h),
        child: Text(
          "VISIÓN",
          style: TextStyle(
              color: Color(0xff034692),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "MontserratExtraBold"),
        ),
      ),
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 2.h, left: 3.h, right: 3.h, bottom: 3.h),
        child: Text(
          "Ser la Universidad líder en la formación de profesionales en Ingeniería y de especialización, caracterizada por el estudio, aplicación e innovacion tecnoogica, con responsabilidad social y reconocida a nivel nacional e internacional. ",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14.sp,
          ),
        ),
      ),
    ],
  );
}

//Aqui va la informacion de carreras
Widget carreras(context) {
  //La funcion icono crea un GestureDetector con un switch que segun sea el caso alistara el visor con un numero para mostrar cuando se cambien de ventana

  Widget carrera(String nombre, Color arriba, Color abajo, String info) {
    final visorProvider = Provider.of<VisorProvider>(context);

    return Container(
      margin: EdgeInsets.only(left: 10.w, bottom: 3.h),
      child: GestureDetector(
        onTap: () {
          visorProvider.name = nombre;
          visorProvider.link = "grado/" + nombre;
          visorProvider.objetivo = "informacion/" + info;
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

  //El cuerpo de carreras tiene un GridView.count que segun parametros creara un rejilla de las carreras
  return Container(
    child: ListView(
      padding: EdgeInsets.only(top: 5.h),
      children: [
        carrera(
            "Química", const Color(0xff1C3B70), const Color(0xff005F92), "8"),
        carrera("Agronómica", const Color(0xff47A6DE), const Color(0xff68D6F1),
            "0"),
        carrera("Civíl", const Color(0xff245B72), const Color(0xff47A09E), "2"),
        carrera(
            "Comercial", const Color(0xffF29C38), const Color(0xffF6BD41), "3"),
        carrera("Mecatrónica", Color(0xff1C3B70), Color(0xff005F92), "6"),
        carrera("Ambiental", Color(0xff245B72), Color(0xff47A09E), "1"),
        carrera(
            "Sistemas Electrónicos", Color(0xffEB3C3A), Color(0xffEF876A), "4"),
        carrera("Sistemas", Color(0xff47A6DE), Color(0xff68D6F1), "9"),
        carrera("Industrial", Color(0xffF6C945), Color(0xff5FD5FA), "5"),
      ],
    ),
  );
}

// Esta ruta agrega una animacion para el cambio de vantana y dirige al visor de imagenes
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
