import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BarraRedes extends StatelessWidget {
  final String facebook;
  final String whatsapp;
  final String telefono;
  final String web;
  final bool red;

  const BarraRedes(
      this.facebook, this.whatsapp, this.telefono, this.web, this.red);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GestureDetector(
          onTap: () {
            launch(facebook);
          },
          child: Container(
            color: const Color(0xff3b5998),
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "Facebook",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            launch("tel://$telefono");
          },
          child: Container(
            color: Colors.teal,
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.phoneAlt,
                  color: Colors.white,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "Teléfono ",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {
            launch("https://wa.me/591$whatsapp");
          },
          child: Container(
            color: const Color(0xff4ac959),
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "WhatsApp",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        )),
        red
            ? Expanded(
                child: GestureDetector(
                onTap: () {
                  launch(web);
                },
                child: Container(
                  color: Colors.lightBlue,
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(FontAwesomeIcons.globeAmericas,
                          color: Colors.white),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Sitio Web",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ))
            : Container(),
      ],
    );
  }
}
