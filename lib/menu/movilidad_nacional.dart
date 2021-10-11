import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class MovilidadNacional extends StatefulWidget {
  const MovilidadNacional({Key? key}) : super(key: key);

  @override
  _MovilidadNacionalState createState() => _MovilidadNacionalState();
}

class _MovilidadNacionalState extends State<MovilidadNacional> {
  @override
  Widget build(BuildContext context) {

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
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 2.h, left: 2.w),
                  child: Text(
                    "EMI NACIONAL",
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
                        top: 1.h, left: 2.w, right: 2.w, bottom: 0.h),
                    child: const Text(
                      "La Escuela Militar de Ingeniería tiene presencia en 4 departamentos del país brindando así la oportunidad a sus estudiantes de realizar traspasos a cualquiera de nuestras demás unidades sin ser perjudicados en su avance académico. .",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black),
                    ),
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
                      "LA PAZ - SANTA CRUZ - COCHABAMBA - RIBERALTA - TROPICO",
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  child: SvgPicture.network(
                    'https://upload.wikimedia.org/wikipedia/commons/b/b6/Escudo_de_Bolivia.svg',
                  ),
                )
              ],
            )
          ],
        )));
  }
}
