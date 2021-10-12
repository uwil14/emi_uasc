import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/virtual.dart';
import 'package:emi_uasc/provider/virtual_provider.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Tour extends StatefulWidget {
  const Tour({Key? key}) : super(key: key);

  @override
  _TourState createState() => _TourState();
}

class _TourState extends State<Tour> {
  @override
  Widget build(BuildContext context) {
    final virtualProvider = Provider.of<VirtualProvider>(context);

    Widget tour(String name, String link) {
      return Stack(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              margin: EdgeInsets.all(1.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  height: 20.h,
                  child: Panorama(
                    onTap: (longitude, latitude, tilt) => {
                      virtualProvider.body = link,
                      virtualProvider.title = name,
                      Navigator.of(context)
                          .push((_createRoute(const Virtual())))
                    },
                    animSpeed: 2,
                    child: Image(
                      image: CachedNetworkImageProvider(
                          'https://santacruz.emi.edu.bo/images/App/virtual/$link'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 2.h, left: 6.w, bottom: 1.h),
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontFamily: "MontserratExtraBold"),
            ),
          ),
        ],
      );
    }

    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        tour('Jardín ', 'modulo.JPG'),
        tour('Patio', 'cancha.JPG'),
        tour('Lab. Automatización ', 'automatizacion.JPG'),
        tour('Lab. Electrónica', 'electronica.JPG'),
      ],
    );
  }
}

Route _createRoute(Widget x) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => x,
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
