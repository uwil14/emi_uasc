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
      initialUrl: "https://bot.dialogflow.com/69eb7a71-0774-40b3-87f4-b3f197bf21ed",
        javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
