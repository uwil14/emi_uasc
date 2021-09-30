import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 2500),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent));
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff034692), Color(0xff005F92)],
                  stops: [0.1, 0.8],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: Column(
            children: [
              Container(
                padding:
                EdgeInsets.only(top: 40.h),
                child: FadeInLeftBig(
                  child: Image.asset(
                    "images/castillo.png",
                    height: 20.h,
                  ),
                ),
              ),
              Container(
                padding:
                EdgeInsets.only(top: 32.h),
                child: FadeInRightBig(
                  child: Text(
                    "PRESTIGIO, DISCIPLINA Y MEJORES OPORTUNIDADES",textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize: 9.sp,
                        fontFamily: "MontserratMediumItalic"),
                  ),
                ),
              ),
              Container()
            ],
          ),
        ));
  }
}
