import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/provider/menu_provider.dart';
import 'package:emi_uasc/provider/visor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Visor extends StatefulWidget {
  @override
  _VisorState createState() => _VisorState();
}

class _VisorState extends State<Visor> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent));
    final visorProvider = Provider.of<VisorProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent));
        return true;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 200),
                child: Container(
                  child: InteractiveViewer(
                    child: Image(
                      image: CachedNetworkImageProvider(
                          'https://santacruz.emi.edu.bo/images/App/' +
                              visorProvider.objetivo +
                              '.png'),
                    ),
                  ),
                  width: 100.w,
                ),
              ),
              Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 4.h, left: 3.w),
                  child: IconButton(
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
                  )),
            ],
          )),
    );
  }
}
