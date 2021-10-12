import 'package:emi_uasc/provider/posgrado_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PosgradoListado extends StatefulWidget {
  const PosgradoListado({Key? key}) : super(key: key);

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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          posgradoProvider.title,
          style:
              const TextStyle(color: Colors.black, fontFamily: "MontserratSemiBold"),
        ),
      ),
      body: posgradoProvider.body,
    );
  }
}
