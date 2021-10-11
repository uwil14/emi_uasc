import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class VisorPosgrado extends StatefulWidget {
  VisorPosgrado(this.info, this.titulo);

  final String info;
  final String titulo;

  @override
  _VisorPosgradoState createState() => _VisorPosgradoState(info, titulo);
}

class _VisorPosgradoState extends State<VisorPosgrado> {
  _VisorPosgradoState(this.info, this.titulo);

  String info;
  String titulo;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async {
        SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(

          foregroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              SystemChrome.setSystemUIOverlayStyle(
                  const SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: Colors.transparent));
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title:Text( titulo,style: const TextStyle(color: Colors.black,fontFamily: "MontserratSemiBold"),),


        ),
        backgroundColor: Colors.white,
        body: FadeInUp(
          duration: const Duration(milliseconds: 200),
          child: SizedBox(
            child: InteractiveViewer(

              child: Image(

                image: CachedNetworkImageProvider(
                   info),
              ),
            ),
            width: 100.w,
            height: 100.h,
          ),
        ),),
    );
  }
}
