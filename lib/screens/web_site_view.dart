import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebSitePageView extends StatefulWidget {
  const WebSitePageView({Key? key}) : super(key: key);

  @override
  State<WebSitePageView> createState() => _WebSitePageViewState();
}

class _WebSitePageViewState extends State<WebSitePageView> {
  double _progress = 0;
  late InAppWebViewController webViewControler;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(children: [
        InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.tryParse('https://www.starwars.com/community')),
          onWebViewCreated: (controller) {
            webViewControler = controller;
          },
          onProgressChanged: (controller, progress) {
            setState(() {
              _progress = progress / 100;
            });
          },
        ),
        _progress < 1 ? SizedBox(
          height: 3,
          child: LinearProgressIndicator(
            value: _progress,
            backgroundColor: Colors.black,
          ),) : const SizedBox(),
      ]),
    );
  }
}