import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/SliderDoble.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Bibliotecas extends StatefulWidget {
  @override
  _BibliotecasState createState() => _BibliotecasState();
}

// Para crear la estructura de la biblioteca se utilizara el SliderDoble
class _BibliotecasState extends State<Bibliotecas> {
  @override
  Widget build(BuildContext context) {
    return SliderDoble(presencial(context), virtual(), "Presencial", "Virtual");
  }
}

// Este es el contenido de la ventana presencial
Widget presencial(context) {
  return Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    floatingActionButton: FloatingActionButton.extended(
      heroTag: "btn2",
      backgroundColor: Colors.white,
      onPressed: () {
        launch("http://186.121.254.138/login");
      },
      icon: Icon(
        Icons.menu_book,
        color: Colors.black,
      ),
      label: Text(
        "Reservar",
        style: TextStyle(color: Colors.black),
      ),
    ),

    backgroundColor: Colors.transparent,
    //Tendra un ListView con fotos en container
    body: ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
            padding: EdgeInsets.all(20),
            child: CachedNetworkImage(
              imageUrl:
                  'https://santacruz.emi.edu.bo/images/App/bibliotecas/3.jpeg',
              fit: BoxFit.cover,
            )),
        Container(
            padding: EdgeInsets.all(20),
            child: CachedNetworkImage(
              imageUrl:
                  'https://santacruz.emi.edu.bo/images/App/bibliotecas/4.jpeg',
              fit: BoxFit.cover,
            )),
        Container(
            padding: EdgeInsets.all(20),
            child: CachedNetworkImage(
              imageUrl:
                  'https://santacruz.emi.edu.bo/images/App/bibliotecas/5.jpeg',
              fit: BoxFit.cover,
            ))
      ],
    ),
  );
}

// Aqui ira le contenido de virtual
Widget virtual() {
  return FadeInRight(
      child: ListView(
    physics: BouncingScrollPhysics(),
    children: [
      //Se creara un fila con ambas bibliotecas virtuales
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imagen("0"),
            ],
          )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imagen("1"),
            ],
          )),
        ],
      )
    ],
  ));
}

// El metodo de imagen crea un contendor sencible a los gestos que segun sea precionado abrira el navegador con una pagina web dada
Widget imagen(String i) {
  return GestureDetector(
    onTap: () {
      i == "0"
          ? launch("https://elibro.net/es/lc/emisantacruz")
          : launch("https://site1.milibreriadigital.com/");
    },
    child: Container(
        padding: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.black)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: CachedNetworkImage(
              imageUrl:
                  'https://santacruz.emi.edu.bo/images/App/bibliotecas/$i.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        )),
  );
}
