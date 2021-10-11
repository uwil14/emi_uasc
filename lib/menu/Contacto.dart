import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/barra_redes.dart';
import 'package:emi_uasc/heramientas/virtual.dart';
import 'package:emi_uasc/provider/virtual_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Contacto extends StatefulWidget {
  @override
  _ContactoState createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  // definimos el marcador que ira en el google maps
  final Set<Marker> _markers = Set();

  @override
  Widget build(BuildContext context) {
    //Declaramos una variable de neustro provider para concer el contenido y el titulo de la ventana
    final virtualProvider = Provider.of<VirtualProvider>(context);

    // Declaramos una posicion inicial para el googleMaps
    CameraPosition _initialPosition = const CameraPosition(
        target: LatLng(-17.81180654876007, -63.178771421404825), zoom: 12);
    Completer<GoogleMapController> _controller = Completer();

    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

// Agregamos el marcador con las coordenadoas de la EMI UASC
    setState(() {
      _markers.add(
        const Marker(
          infoWindow: InfoWindow(
              title: 'EMI UASC', snippet: 'Escuela Militar de Ingeniera'),
          markerId: MarkerId('EMI UASC'),
          position: LatLng(-17.81180654876007, -63.178771421404825),
        ),
      );
    });
// Este el cuerpo de Contacto
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeInUp(
        // Tiene CustomScrollView para tener slvider como appbar
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(0),
        children: [

          Container(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: const Text(
              "General",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: const Text(
              "Direccion",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, top: 5),
            child: const Text(
              "Tercer Anillo Radial 13",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.grey),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: const Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, top: 5),
            child: const Text(
              "santacruz@adm.emi.edu.bo",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.grey),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, top: 20),
            child: const Text(
              "Fax",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, top: 5, bottom: 20),
            child: const Text(
              "3579545",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.grey),
            ),
          ),
          Container(
            height: 11.h,
            //Llamamos a BarraRedes con el booleano true para mostrar el sitio web tambien
            child: const BarraRedes(
                "https://www.facebook.com/emiuascz/",
                "71566652",
                "33579545",
                "https://santacruz.emi.edu.bo/",
                true),
          ),
          SizedBox(
            height:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.40
                : MediaQuery.of(context).size.height * 0.7,
            child: GoogleMap(
              markers: _markers,
              gestureRecognizers: Set()
                ..add(Factory<EagerGestureRecognizer>(
                        () => EagerGestureRecognizer())),
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
            ),
          )
        ],),
      ),
    );
  }
}
