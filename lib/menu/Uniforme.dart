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
      child: FadeInUp(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const TabBar(
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
                uniformefoto("lunes"),
                uniformefoto("martes"),
                uniformefoto("miercoles"),
                uniformefoto("jueves"),
                uniformefoto("viernes"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget uniformefoto(String i) {
  return  InteractiveViewer(

    child: CachedNetworkImage(
      imageUrl: 'https://santacruz.emi.edu.bo/images/App/uniformes/$i.png',
    ),
  );
}
