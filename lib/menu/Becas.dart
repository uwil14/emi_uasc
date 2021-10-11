import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Becas extends StatefulWidget {
  const Becas({Key? key}) : super(key: key);

  @override
  _BecasState createState() => _BecasState();
}

class _BecasState extends State<Becas> {
  @override
  Widget build(BuildContext context) {
    Widget item(String url) {
      String dir = "https://santacruz.emi.edu.bo/images/App/becas/";
      return CachedNetworkImage(
        imageUrl: "$dir$url",
        fit: BoxFit.fill,
      );
    }

    List cardList = [
      item("0.png"),
      item("1.png"),
      item("2.png"),
      item("3.png"),
      item("4.png"),
      item("5.png"),
      item("6.png"),
      item("7.png"),
    ];

    // Para crear la estructura de Becas se usara la clase creada SliderDoble donde le pasaremos el contenido y titulo de cada slider
    return Scaffold(
        backgroundColor: Colors.white,
        body: FadeInUp(
            child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.h),
            ),
            ListView(
              padding: const EdgeInsets.all(0),
              children: [

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 2.h, left: 2.w),
                  child: Text(
                    "NUESTRAS BECAS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
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
                    padding: EdgeInsets.only(
                        top: 1.h, left: 2.w, right: 2.w, bottom: 3.h),
                    child: const Text(
                      "Las Beca que otorga la  Escuela Militar de Ingeniería tiene la finalidad de incentivar a Estudiantes destacados en el campo académico, científico, Investigación, cultural y deportivo; apoyar a estudiantes de escasos recursos económicos o que presenten algún tipo de discapacidad permanente.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    aspectRatio: MediaQuery.of(context).orientation ==
                        Orientation.portrait
                        ? 1.2
                        : 1.8,
                    enlargeCenterPage: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                    const Duration(milliseconds: 800),
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
              ],
            )
          ],
        )));
  }
}
