import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../BaseStatePage.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends BaseStatePage<WebViewPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  GlobalKey<ScaffoldState> getGlobalKey() => _globalKey;

  StreamSubscription<String> _onUrlChanged;

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final _history = [];

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.close();

    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          _history.add('onUrlChanged: $url');
        });
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://vodiy.ua/",
      key: _globalKey,
      appBar: new AppBar(
        title: const Text('WebView example'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {
              print("webview " + _history.toString());
            },
          )
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();

    flutterWebviewPlugin.dispose();

    super.dispose();
  }
}
