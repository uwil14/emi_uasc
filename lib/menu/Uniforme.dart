import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Uniformes extends StatefulWidget {
  @override
  _UniformesState createState() => _UniformesState();
}

class _UniformesState extends State<Uniformes> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: FadeInRight(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xff034692),
            labelColor: Color(0xff034692),
            tabs: [
              Tab(
                text: "Lunes",
              ),
              Tab(text: "Martes"),
              Tab(text: "Miércoles "),
              Tab(text: "Jueves"),
              Tab(text: "Viernes"),
            ],
          ),
          body: Container(
            alignment: Alignment.center,
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                uniformefoto("0"),
                uniformefoto("1"),
                uniformefoto("2"),
                uniformefoto("3"),
                uniformefoto("4"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget uniformefoto(String i) {
  return ListView(
    physics: BouncingScrollPhysics(),
    children: [
      Container(
        child: CachedNetworkImage(
          imageUrl: 'https://santacruz.emi.edu.bo/images/App/uniformes/$i.jpeg',
          fit: BoxFit.fill,
        ),
      )
    ],
  );
}
