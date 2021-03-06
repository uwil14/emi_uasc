// @dart=2.9

import 'package:emi_uasc/provider/menu_provider.dart';
import 'package:emi_uasc/provider/posgrado_provider.dart';
import 'package:emi_uasc/provider/virtual_provider.dart';
import 'package:emi_uasc/provider/visor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'heramientas/splash_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuProvider()),
          ChangeNotifierProvider(create: (context) => PosgradoProvider()),
          ChangeNotifierProvider(create: (context) => VirtualProvider()),
          ChangeNotifierProvider(create: (context) => VisorProvider()),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            scrollBehavior:
            const ScrollBehavior().copyWith(physics: BouncingScrollPhysics()),
            theme: ThemeData(
              fontFamily: 'MontserratRegular',
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        }));
  }
}
