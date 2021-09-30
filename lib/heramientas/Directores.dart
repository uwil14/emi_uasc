import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// La clase Directores devuelve una columna con el nombre y la foto de cada director
class Directores extends StatefulWidget {
  final String nombre;
  final String foto;
  final String cargo;

  Directores(this.nombre, this.foto, this.cargo);

  @override
  _DirectoresState createState() => _DirectoresState(nombre, foto, cargo);
}

class _DirectoresState extends State<Directores> {
  String nombre;
  String foto;
  String cargo;

  _DirectoresState(this.nombre, this.foto, this.cargo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "Encargado",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          //Se hace distincion de la orientacion del dispositivo para definir el tamaño de la foto del director
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.4
              : MediaQuery.of(context).size.height * 0.8,
          margin: EdgeInsets.all(10),
          child: CachedNetworkImage(
            imageUrl:
                'https://santacruz.emi.edu.bo/images/App/directores/$foto',
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            "$nombre",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 3, bottom: 10),
          child: Text(
            "$cargo",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
