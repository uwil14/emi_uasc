import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Buzon extends StatefulWidget {
  @override
  _BuzonState createState() => _BuzonState();
}

class _BuzonState extends State<Buzon> {
  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: "186.121.203.35/informanos",
        javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
