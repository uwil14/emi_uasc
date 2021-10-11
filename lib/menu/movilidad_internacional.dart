import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MovilidadInternacional extends StatefulWidget {
  const MovilidadInternacional({Key? key}) : super(key: key);

  @override
  _MovilidadInternacionalState createState() => _MovilidadInternacionalState();
}

class _MovilidadInternacionalState extends State<MovilidadInternacional> {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 2.h, left: 2.w, right: 2.w),
          child: Text(
            "UNIVERSIDADES EXTRANJERAS",
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
                EdgeInsets.only(top: 1.h, left: 2.w, right: 2.w, bottom: 2.h),
            child: const Text(
              "La Escuela Militar de Ingeniería tiene diferentes convenios académicos: de práctica empresarial, de implementación de proyectos, con entidades reconocidas Nacionales e Internacionales",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imagen("0"),
                imagen("1"),
                imagen("2"),
                imagen("3"),
                imagen("4"),
                imagen("5"),
                imagen("6"),
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imagen("7"),
                imagen("8"),
                imagen("9"),
                imagen("10"),
                imagen("11"),
                imagen("12"),
                imagen("13"),
              ],
            )),
          ],
        )
      ],
    ));
  }
}

Widget imagen(String i) {
  return Container(
    padding: EdgeInsets.all(2.h),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: CachedNetworkImage(
        imageUrl: 'https://santacruz.emi.edu.bo/images/App/movilidad/$i.jpeg',
        fit: BoxFit.cover,
      ),
    ),
  );
}
