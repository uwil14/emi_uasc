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

void main() {
  runApp(MyApp());
}

// Inicia el programa
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    //Utlizamos multiprovider para manejar informacion entre paginas
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuProvider()),
          ChangeNotifierProvider(create: (context) => PosgradoProvider()),
          ChangeNotifierProvider(create: (context) => VirtualProvider()),
          ChangeNotifierProvider(create: (context) => VisorProvider()),
        ],
        //Usamos Material App como estilo para nuestra app
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            scrollBehavior:
            ScrollBehavior().copyWith(physics: BouncingScrollPhysics()),
            theme: ThemeData(
              fontFamily: 'MontserratRegular',
            ),
            debugShowCheckedModeBanner: false,
            //Llamanos a nuestra SplashScreen para que muestre la animacion de inicio
            home: SplashScreen(),
          );
        }));
  }
}
