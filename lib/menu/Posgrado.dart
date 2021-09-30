import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/PosgradoListado.dart';
import 'package:emi_uasc/heramientas/SliderDoble.dart';
import 'package:emi_uasc/heramientas/VisorPosgrado.dart';
import 'package:emi_uasc/provider/PosgradoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Posgrado extends StatefulWidget {
  @override
  _PosgradoState createState() => _PosgradoState();
}

//Para Posgrado usaremos el SliderDoble
class _PosgradoState extends State<Posgrado> {
  @override
  Widget build(BuildContext context) {
    return SliderDoble(cursos(context), informacion(), "Cursos", "Información");
  }
}

Widget cursos(context) {
  Widget carrera(List<String> nombres, String categoria) {
    return FadeInRight(
        child: Container(
            child: ListView.builder(
              physics:BouncingScrollPhysics(),
      itemBuilder: (BuildContext ctxt, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push((_createRoute(VisorPosgrado(
                'https://santacruz.emi.edu.bo/images/App/posgrado/$categoria/info_$index.jpeg',
                "INFORMACION"))));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            margin: EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      color: Colors.black,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://santacruz.emi.edu.bo/images/App/posgrado/$categoria/$index.png',
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Text(
                    nombres[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: nombres.length,
    )));
  }

//Se usara icono() para crear la tarjeta de cada categoria
  Widget icono(String i) {
    final posgradoProvider = Provider.of<PosgradoProvider>(context);
    return Card(
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      child: GestureDetector(
        onTap: () {
          switch (i) {
            case '0':
              posgradoProvider.body = carrera([
                "GERENCIA INDUSTRIAL Y DE SERVICIOS",
              ], "maestrias");
              posgradoProvider.title = "MAESTRIAS";
              break;
            case '1':
              posgradoProvider.body = carrera([
                "GESTION DE PROCESOS DE NEGOCIOS - BPM",
                "EDUCACION SUPERIOR UNIVERSITARIA",
                "GESTION AGROENERGETICA CAÑERA Y DE PROCESOS AZUCAREROS EN LA INSDUSTRIA BOLIVIANA",
                "PLANIFICACION Y DESARROLLO DE COMPETENCIAS PROFESIONALES EN EDUCACION SUPERIOR",
                "SEGURIDAD Y SALUD EN EL TRABAJO",
                "TECNOLOGIA DEL HORMIGON",
              ], "diplomados");
              posgradoProvider.title = "DIPLOMADOS";
              break;
            case '2':
              posgradoProvider.body = carrera([
                "EMERGENTOLOGIA",
                "TALLER DE AVALUOS DE BIENE INMUEBLES",
                "TREPANOS E HIDRAULICA DE PERFORACION",
              ], "formacion");
              posgradoProvider.title = "FORMACION CONTINUA";
              break;
            case '3':
              posgradoProvider.body = carrera([], "doctorado");
              posgradoProvider.title = "DOCTORADOS";
              break;
          }
          Navigator.of(context).push((_createRoute(PosgradoListado())));
        },
        child: CachedNetworkImage(
          imageUrl: 'https://santacruz.emi.edu.bo/images/App/posgrado/$i.png',
        ),
      ),
    );
  }

//Para cursos se usara un GridView.count pero que mostrara las 4 categorias como si fuera un columna
  return Container(
      child: GridView.count(
          physics:BouncingScrollPhysics(),
          childAspectRatio:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2.2
                  : 0.9,
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 1
                  : 4,
          children: List.generate(4, (index) {
            return GridTile(
              child: icono("$index"),
            );
          })));
}

//Aqui va informacion y llama BarraRedes y Directores
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

//Usamos _createRoute para añadir una animacion al cambio de ventana y esta vez se recibe la sgte pestaña como parametro
Route _createRoute(Widget pagina) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pagina,
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
