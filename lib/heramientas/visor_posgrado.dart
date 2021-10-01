import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VisorPosgrado extends StatefulWidget {
  VisorPosgrado(this.info, this.titulo);

  final String info;
  final String titulo;

  @override
  _VisorPosgradoState createState() => _VisorPosgradoState(info, titulo);
}

class _VisorPosgradoState extends State<VisorPosgrado> {
  _VisorPosgradoState(this.info, this.titulo);

  String info;
  String titulo;

  @override
  Widget build(BuildContext context) {
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
      body: Container()
      
      // PhotoView(
      //   minScale: PhotoViewComputedScale.contained * 1,
      //   maxScale: PhotoViewComputedScale.covered * 1.6,
      //   backgroundDecoration: BoxDecoration(color: Colors.white),
      //   imageProvider: CachedNetworkImageProvider(info),
      // ),


    );
  }
}
