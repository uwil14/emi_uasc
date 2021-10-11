import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';

class Instruccion extends StatefulWidget {
  @override
  _InstruccionState createState() => _InstruccionState();
}

class _InstruccionState extends State<Instruccion> {
  @override
  Widget build(BuildContext context) {
    //Para instruccion usaremos un carrucel con fotos
    Widget item(String url) {
      String dir = "https://santacruz.emi.edu.bo/images/App/instruccion/";
      return Container(
        child: CachedNetworkImage(
          imageUrl: "$dir$url",
          fit: BoxFit.fill,
        ),
      );
    }

    List cardList = [
      item("0.jpeg"),
      item("1.jpeg"),
      item("2.jpeg"),
      item("3.jpeg"),
      item("4.jpeg"),
    ];
    return FadeInUp(
        //Definimos un ListViewa con un carrucel y con textos dentro de container
        child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.h),

        ),
        ListView(
          padding: const EdgeInsets.all(0),
          children: [

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 2.h,left: 2.w,right: 2.w),
              child: Text(
                "PROCESO DE INSTRUCCIÓN",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "MontserratExtraBold"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
              ),
              child: Container(
                padding:
                EdgeInsets.only(
                    top: 1.h, left: 2.w, right: 2.w, bottom: 1.h),
                child: Text(
                  "Tiene una duración de 1 año y se realiza los días sábados en las mañanas en los alrededores de la unidad, es un requisito obligatorio para poder obtener la libreta de reserva. Además de ser una ventaja para todo aquello alumnos que no realzaron el servicio militar. ",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 1.h),
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  aspectRatio:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 1.6
                      : 1.8,
                  enlargeCenterPage: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Container(
                        margin: EdgeInsets.all(1.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: card,
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
              ),
              child: Container(
                padding:
                EdgeInsets.only(
                    top: 1.h, left: 2.w, right: 2.w, bottom: 5.h),
                child: Text(
                  "La Instrucción Militar como pilar fundamental para la formación de los futuros Subtenientes de Reserva, quienes con altos valores cívico patrióticos desarrollan sus actividades demostrando su valor, vigor, ganas de superación y servicio a la Patria, cultivando la disciplina, respeto a los símbolos patrios, conservación de la soberanía nacional y defensa de nuestro territorio.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
