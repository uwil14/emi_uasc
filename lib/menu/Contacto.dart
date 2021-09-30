import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/BarraRedes.dart';
import 'package:emi_uasc/heramientas/Virtual.dart';
import 'package:emi_uasc/provider/VirtualProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panorama/panorama.dart';
import 'package:provider/provider.dart';

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
    CameraPosition _initialPosition = CameraPosition(
        target: LatLng(-17.81180654876007, -63.178771421404825), zoom: 12);
    Completer<GoogleMapController> _controller = Completer();

    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
    }

// Agregamos el marcador con las coordenadoas de la EMI UASC
    setState(() {
      _markers.add(
        Marker(
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
        child: CustomScrollView(physics:BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Color(0xff034692),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              automaticallyImplyLeading: false,
              stretch: true,
              onStretchTrigger: () {
                return Future<void>.value();
              },
              expandedHeight:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.35
                      : MediaQuery.of(context).size.height * 0.7,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                centerTitle: true,
                title: Text("EMI UASC",style: TextStyle(fontFamily: "MontserratSemiBold"),),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    //Este appbar contiene un widget de la libreria panorama
                    Panorama(
                      onTap: (longitude, latitude, tilt) => {
                        virtualProvider.body = "patio.JPG",
                        virtualProvider.title = "EMI UASC",
                        Navigator.of(context).push((_createRoute()))
                      },
                      animSpeed: 3.0,
                      child: Image(
                        image: CachedNetworkImageProvider(
                            'https://santacruz.emi.edu.bo/images/App/virtual/patio.JPG'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                //Llamamos a BarraRedes con el booleano true para mostrar el sitio web tambien
                child: BarraRedes(
                    "https://www.facebook.com/emiuascz/",
                    "71566652",
                    "33579545",
                    "https://santacruz.emi.edu.bo/",
                    true),
              ),
              Container(
                padding: EdgeInsets.only(top: 15, left: 10),
                child: Text(
                  "General",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, top: 10),
                child: Text(
                  "Direccion",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, top: 5),
                child: Text(
                  "Tercer Anillo Radial 13",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, top: 20),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, top: 5),
                child: Text(
                  "santacruz@adm.emi.edu.bo",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, top: 20),
                child: Text(
                  "Fax",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, top: 5, bottom: 20),
                child: Text(
                  "3579545",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.grey),
                ),
              ),
              //En este container ira el google maps con el markador definido en las coordenadas de la EMI UASC
              Container(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.height * 0.35
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
            ]))
          ],
        ),
      ),
    );
  }
}

// Esta ruta agrega una animacion al cambio de ventana
Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Virtual(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.1, 0.0);
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
