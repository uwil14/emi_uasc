import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/slider_doble.dart';
import 'package:emi_uasc/heramientas/visor.dart';
import 'package:emi_uasc/provider/visor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Tecnico extends StatefulWidget {
  @override
  _TecnicoState createState() => _TecnicoState();
}
//Como estructura de tecnico tendremos un slider doble
class _TecnicoState extends State<Tecnico> {
  @override
  Widget build(BuildContext context) {
    return SliderDoble(
        carreras(context), informacion(), "Carreras", "Información");
  }
}
// Cada icono tendra un switch con le dato que necesita el visor para mostrar la informacion
Widget carreras(context) {
  Widget icono(String i) {
    final visorProvider = Provider.of<VisorProvider>(context);

    return GestureDetector(
      onTap: () {
        switch (i) {
          case '0':
            visorProvider.name = "Informática";
            visorProvider.link = "grado/Informática";
            visorProvider.objetivo = "informacion/10" ;
            break;
          case '1':
            visorProvider.name = "Construcción Civil";
            visorProvider.link = "grado/Informatica";
            visorProvider.objetivo = "informacion/11" ;
            break;
          case '2':
            visorProvider.name = "Energías Renovables";
            visorProvider.link = "grado/Energías Renovables";
            visorProvider.objetivo = "informacion/12" ;
            break;
          case '3':
            visorProvider.name = "Sistemas Electrónicos";
            visorProvider.link = "grado/Sistemas Electrónicos";
            visorProvider.objetivo = "informacion/13" ;
            break;
          case '4':
            visorProvider.name = "Diseño Gráfico";
            visorProvider.link = "grado/Diseño Gráfico";
            visorProvider.objetivo = "informacion/14" ;
            break;
        }
        Navigator.of(context).push((_createRoute()));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          margin: EdgeInsets.all(7),
          child: CachedNetworkImage(
            imageUrl: 'https://santacruz.emi.edu.bo/images/App/tecnico/$i.png',
          ),
        ),
      ),
    );
  }

//Generamos la rejilla donde estara cada carrera tecnica
  return Container(
      child: GridView.count(
          physics:BouncingScrollPhysics(),
          childAspectRatio:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 0.8
                  : 1,
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 5,
          children: List.generate(5, (index) {
            return GridTile(
              child: icono("$index"),
            );
          })));
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

//Usamos _createRoute para añadir animacion a la transicion de ventanas hacia el visor
Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Visor(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 0.1);
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
