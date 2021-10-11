import 'package:animate_do/animate_do.dart';
import 'package:emi_uasc/heramientas/visor.dart';
import 'package:emi_uasc/menu/contacto.dart';
import 'package:emi_uasc/menu/oferta.dart';
import 'package:emi_uasc/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Plantilla extends StatefulWidget {
  const Plantilla({Key? key}) : super(key: key);

  @override
  _PlantillaState createState() => _PlantillaState();
}

class _PlantillaState extends State<Plantilla> {

  @override

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent));

    final menuProvider = Provider.of<MenuProvider>(context);
    return
     Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 15.h,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff005F92), Color(0xff1C3B70)],
                    stops: [0.1, 0.8],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)),
            child: Stack(
              fit: StackFit.expand,
              children: [

                Container(
                  margin: EdgeInsets.only(top: 3.h),
                  alignment: Alignment.center,
                  child: Text(
                  menuProvider.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "MontserratExtraBold",
                      color: Colors.white,
                      fontSize: 25.sp),
                ),),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 4.h, left: 3.w,bottom: 1.h),
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                    )
                ),
              ],
            ),
          ),
          Expanded(
              child: FadeInUp(
                  duration: const Duration(milliseconds: 200),
                  child: menuProvider.body))
        ],
      ),
    );



    Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: menuProvider.title == "INSTRUCCIÓN"
                  ? const Color(0xff04230C)
                  : menuProvider.title == "BIBLIOTECAS"
                      ? Colors.brown
                      : const Color(0xff034692),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              centerTitle: true,
              title: Text(
                menuProvider.title,
                style: const TextStyle(
                    color: Colors.white, fontFamily: "MontserratSemiBold"),
              ),
            ),
            body: menuProvider.body,
          )



    ;
  }
}
Route _createRoute(pagina) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pagina,
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