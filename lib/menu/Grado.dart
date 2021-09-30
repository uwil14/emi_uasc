import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/SliderDoble.dart';
import 'package:emi_uasc/heramientas/Visor.dart';
import 'package:emi_uasc/provider/VisorProvider.dart';
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

//Aqui va la informacion de carreras
Widget carreras(context) {
  //La funcion icono crea un GestureDetector con un switch que segun sea el caso alistara el visor con un numero para mostrar cuando se cambien de ventana
  Widget icono(String i) {
    final visorProvider = Provider.of<VisorProvider>(context);

    return GestureDetector(
      onTap: () {
        switch (i) {
          case '0':
            visorProvider.link = "informacion/0";
            break;
          case '1':
            visorProvider.link = "informacion/1";
            break;
          case '2':
            visorProvider.link = "informacion/2";
            break;
          case '3':
            visorProvider.link = "informacion/3";
            break;
          case '4':
            visorProvider.link = "informacion/4";
            break;
          case '5':
            visorProvider.link = "informacion/5";
            break;
          case '6':
            visorProvider.link = "informacion/6";
            break;
          case '7':
            visorProvider.link = "informacion/7";
            break;
          case '8':
            visorProvider.link = "informacion/8";
            break;
          case '9':
            visorProvider.link = "informacion/9";
            break;
        }
        Navigator.of(context).push((_createRoute()));
      },
      //Tambien cargamos el logo de cada carrera
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          child: CachedNetworkImage(
            imageUrl: 'https://santacruz.emi.edu.bo/images/App/grado/$i.png',
          ),
        ),
      ),
    );
  }

  //El cuerpo de carreras tiene un GridView.count que segun parametros creara un rejilla de las carreras
  return Container(
      child: GridView.count(
          physics: BouncingScrollPhysics(),
          //Segun la orientacion del dispositivo se tendra un tamañao y una cantidad de columnas
          childAspectRatio:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 1.38
                  : 1,
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 3,
          children: List.generate(10, (index) {
            return GridTile(
              child: Container(child: icono("$index")),
            );
          })));
}

//Aqui va la informacion de Informacion
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

// Esta ruta agrega una animacion para el cambio de vantana y dirige al visor de imagenes
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
