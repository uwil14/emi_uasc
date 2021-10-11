import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/provider/virtual_provider.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';

class Virtual extends StatefulWidget {
  @override
  _VirtualState createState() => _VirtualState();
}
//La estructura de Virtual tendra un Scffold con el titulo obtenido con el Provider VirtualProvider
class _VirtualState extends State<Virtual> {
  @override
  Widget build(BuildContext context) {
    final virtualProvider = Provider.of<VirtualProvider>(context);
    return  Scaffold(
      appBar: AppBar(

        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title:Text(  "EMI 360",style: const TextStyle(color: Colors.black,fontFamily: "MontserratSemiBold"),),


      ),
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Usando la libreria panorama y configurando su parametro de sensorControl usaremos el giroscopio del dispositivo
          Panorama(
            animSpeed: 3.0,
            sensorControl: SensorControl.Orientation,
            child: Image(
              image: CachedNetworkImageProvider(
                  'https://santacruz.emi.edu.bo/images/App/virtual/' +
                      virtualProvider.body),
            ),
          ),
          //Aqui agregaremos el nombre de lo que se este proyectando
          Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.15),
            child: Text(
              virtualProvider.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),);





  }
}
