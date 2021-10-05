import 'package:animate_do/animate_do.dart';
import 'package:emi_uasc/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SliderDoble extends StatefulWidget {
  final Widget izquierda;
  final Widget derecha;
  final String tituloi;
  final String titulod;

  SliderDoble(this.izquierda, this.derecha, this.tituloi, this.titulod);

  @override
  _SliderDobleState createState() => _SliderDobleState();
}

class _SliderDobleState extends State<SliderDoble> {

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return DefaultTabController(
      length: 2,
      child: FadeInUp(
        duration: const Duration(milliseconds: 500),
        child: Scaffold(
          floatingActionButton: widget.tituloi == "Presencial"
              ? // Tambien se agregara un floatingActionButton para contactarse con la encargada de la biblioteca
              FloatingActionButton(
                heroTag: "btn1",
                  backgroundColor: Color(0xff4ac959),
                  child: const Icon(FontAwesomeIcons.whatsapp,
                      color: Colors.white, size: 35),
                  onPressed: () {
                    launch("https://wa.me/59178092485");
                  },
                )
              : Container(),
          backgroundColor: Colors.white,
          appBar: TabBar(
            unselectedLabelColor: Colors.grey,
            indicatorColor: menuProvider.title == "INSTRUCCIÓN"
                ? Color(0xff04230C)
                : menuProvider.title == "BIBLIOTECAS"
                ? Colors.brown
                : Color(0xff034692),
            labelColor: menuProvider.title == "INSTRUCCIÓN"
                ? Color(0xff04230C)
                : menuProvider.title == "BIBLIOTECAS"
                ? Colors.brown
                : Color(0xff034692),
            tabs: [
              Tab(
                text: widget.tituloi,
              ),
              Tab(text: widget.titulod),
            ],
          ),
          body: TabBarView(
            physics:BouncingScrollPhysics(),
            children: [
              Center(
                child: widget.izquierda,
              ),
              Center(
                child: widget.derecha,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
