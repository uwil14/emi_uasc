import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_uasc/provider/visor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Visor extends StatefulWidget {
  Visor();

  @override
  _VisorState createState() => _VisorState();
}

class _VisorState extends State<Visor> {
  @override
  Widget build(BuildContext context) {
    final visorProvider = Provider.of<VisorProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF012B5D),
        child: Container(
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 36.5),
        child: InteractiveViewer(
          child: CachedNetworkImage(
              imageUrl: "https://santacruz.emi.edu.bo/images/App/" +
                  visorProvider.link +
                  ".png"),
        ),
      ),
    );
  }
}
