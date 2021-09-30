import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Movilidad extends StatefulWidget {
  @override
  _MovilidadState createState() => _MovilidadState();
}

//Para movilidad definimos un ListView con un concepto y con dos columnas de de fotos de las universidades
class _MovilidadState extends State<Movilidad> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
        child: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 2.h,left: 10, right: 10, bottom: 15),
          child: Text(
            "La EMI integra diferentes redes académicas, y de investigación , nacionales e internacionales, para el intercambio de investigación, ciencia, tecnología y cultura",
            style: TextStyle(),
            textAlign: TextAlign.justify,
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
//Usamos esta funcio para que dado una indice i se genere una container con una imagen con los bordes redondeados
Widget imagen(String i) {
  return Container(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0),
          child: CachedNetworkImage(
            imageUrl:
                'https://santacruz.emi.edu.bo/images/App/movilidad/$i.jpeg',
            fit: BoxFit.cover,
          ),
        ),
      ));
}
