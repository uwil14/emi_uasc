import 'package:animate_do/animate_do.dart';
import 'package:emi_uasc/provider/PosgradoProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PosgradoListado extends StatefulWidget {
  @override
  _PosgradoListadoState createState() => _PosgradoListadoState();
}

class _PosgradoListadoState extends State<PosgradoListado> {
  @override
  Widget build(BuildContext context) {
    final posgradoProvider = Provider.of<PosgradoProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: FadeInRight(child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: () {
          Navigator.of(context).pop();
        },),),
        centerTitle: true,
        title: FadeInRight(child: Text(
          posgradoProvider.title,style: TextStyle(color: Colors.black),
        ),),
      ),
      body: posgradoProvider.body,
    );
  }
}
