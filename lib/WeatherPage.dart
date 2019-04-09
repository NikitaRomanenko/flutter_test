import 'package:flutter/material.dart';
import 'package:flutter_app/BaseStatePage.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends BaseStatePage<WeatherPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  String _json = "empty";

  @override
  GlobalKey<ScaffoldState> getGlobalKey() => _globalKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        body: Center(
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                RaisedButton(
                    child: Text(" make request "),
                    onPressed: () {
                      showLoadingDialog();
                      fetchData();
                    }),
                Text(_json)
              ])),
        ));
  }

  void fetchData() async {
    var url =
        "https://api.darksky.net/forecast/2bb07c3bece89caf533ac9a5d23d8417/59.337239,18.062381";
    http.get(url).then((response) {
      var responseString = response.body;
      setState(() {
        _json = responseString;
        Navigator.pop(context);
        showDumpDialog();
      });
    });
  }

  void showDumpDialog() {
    showSimpleDialog("title", "message", positiveCallback: () {
      showToast("positiveCallback");
    }, negativeCallback: () {
      showToast("negativeCallback");
    });
  }
}
