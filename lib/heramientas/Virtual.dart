import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/provider/virtual_provider.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Virtual extends StatefulWidget {
  const Virtual({Key? key}) : super(key: key);

  @override
  _VirtualState createState() => _VirtualState();
}

class _VirtualState extends State<Virtual> {
  @override
  Widget build(BuildContext context) {
    final virtualProvider = Provider.of<VirtualProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          Panorama(
            hotspots: virtualProvider.title == "EMI UASC"
                ? [
                    Hotspot(
                      latitude: 0,
                      longitude: 50,
                      width: 30.h,
                      height: 30.h,
                      widget: Image.asset(
                        'images/emi.png',
                      ),
                    ),
                    Hotspot(
                      latitude: 0,
                      longitude: 230,
                      width: 30.h,
                      height: 30.h,
                      widget: Image.asset(
                        'images/emi.png',
                      ),
                    ),
                    Hotspot(
                      latitude: 0,
                      longitude: 315,
                      width: 30.h,
                      height: 30.h,
                      widget: Image.asset(
                        'images/emi.png',
                      ),
                    ),
                  ]
                : [],
            animSpeed: 0.1,
            sensorControl: SensorControl.Orientation,
            child: Image(
              image: CachedNetworkImageProvider(
                  'https://santacruz.emi.edu.bo/images/App/virtual/' +
                      virtualProvider.body),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.15),
            child: Text(
              virtualProvider.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "MontserratExtraBold"
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 6.h,left: 3.w),
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
