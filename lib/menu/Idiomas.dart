import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/heramientas/reproductor.dart';
import 'package:emi_uasc/heramientas/slider_doble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Idiomas extends StatefulWidget {
  @override
  _IdiomasState createState() => _IdiomasState();
}

// Para la estructura de idiomas usaremos un SliderDoble
class _IdiomasState extends State<Idiomas> {
  @override
  Widget build(BuildContext context) {
    return SliderDoble(ingles(context), frances(context), "Ingles", "Frances");
  }
}

//Aqui ira el contenido de ingles
Widget ingles(context) {
  //Teneos un metodo para crear los iconos de cada nivel
  Widget icono(String i) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CachedNetworkImage(
        imageUrl: 'https://santacruz.emi.edu.bo/images/App/idiomas/$i.png',
      ),
    );
  }

  //En un columna estara una pequeña descripcion del horario y un GridView.count para crear una rejilla de los niveles
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
        child: const Text(
          "Clases Lunes, Martes, Miercoles, Viernes, Sabados. 12:45 - 14:45",
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
          child: GridView.count(
              physics: BouncingScrollPhysics(),
              childAspectRatio:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 1
                      : 1.5,
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 2
                      : 3,
              children: List.generate(6, (index) {
                return GridTile(
                  child: Card(child: icono("$index")),
                );
              })))
    ],
  );
}

//Aqui ira el contenido de Frances
Widget frances(context) {
  return ListView(
    physics: const BouncingScrollPhysics(),
    children: [
      DefaultPlayer(),
      Container(
        margin: const EdgeInsets.only(top: 20,right: 15,left: 15,bottom: 10),
        child: const Text(
          "🇫🇷 ¡EMPIEZA A HABLAR FRANCÉS DESDE AHORA! 🇫🇷 ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),textAlign: TextAlign.center,
        ),
      ),
     Container(
        margin: const EdgeInsets.only(left: 20,right: 20),
        child: const Text(
          "No es necesario tener una super memoria o super mente para aprender francés solo necesitas la metodología indicada para aprenderlo y con la metodología de este curso podrás desarrollar la confianza, la seguridad en ti mismo y las herramientas para aprender este encantador idioma. Nuestro curso te guiará a través de todas las situaciones importantes de la vida (Restaurante, Tiempo, Médico, etc.)",
          style: TextStyle(fontWeight: FontWeight.w300),textAlign: TextAlign.justify,
        ),
      )
    ],
  );
}





