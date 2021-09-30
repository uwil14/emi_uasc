import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// La clase de BarraRedes es un widget de ayuda
class BarraRedes extends StatelessWidget {
  final String facebook;
  final String whatsapp;
  final String telefono;
  final String web;
  final bool red;
// Recible como parametros las direcciones de facebook, whatsapp, telefono, web y un booleano para ver si se mostrara o no la web
  BarraRedes(this.facebook, this.whatsapp, this.telefono, this.web, this.red);

  @override
  Widget build(BuildContext context) {
    return Container(
      //Una fila con GestureDetector que al ser clickeados usan la libreria launch para usar el navegador o ir a whatsapp
      child: Row(
        children: [
          Container(
            child: Expanded(
                child: GestureDetector(
                  onTap: () {
                    launch(facebook);
                  },
                  child: Container(
                    color: Color(0xff3b5998),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Facebook",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          Container(
            child: Expanded(
                child: GestureDetector(
                  onTap: () {
                    launch("tel://$telefono");
                  },
                  child: Container(
                    color: Colors.teal,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.phoneAlt,
                          color: Colors.white,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Teléfono ",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
          Container(
            child: Expanded(
                child: GestureDetector(
                  onTap: () {
                    launch("https://wa.me/591$whatsapp");
                  },
                  child: Container(
                    color: Color(0xff4ac959),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "WhatsApp",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),
          red? Container(
            child: Expanded(
                child: GestureDetector(
                  onTap: () {
                    launch(web);
                  },
                  child: Container(
                    color: Colors.lightBlue,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Icon(FontAwesomeIcons.globeAmericas, color: Colors.white),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Sitio Web",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ):Container(),
        ],
      ),
    );
  }
}