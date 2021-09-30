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
    return Scaffold(
      backgroundColor: Colors.grey,
      //En el AppBar estara un boton para volver a la ventana anterior y un titulo por defecto de de EMI 360
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: FadeInDown(
          child: const Text(
            "EMI 360",
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: FadeInDown(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
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
            child: BounceInDown(
              child: Text(
                virtualProvider.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
