import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/BaseStatePage.dart';
import 'package:flutter_app/WeatherPojo.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends BaseStatePage<WeatherPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  String _json_not_parsed = "empty";

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
                Text(_json_not_parsed)
              ])),
        ));
  }

  void fetchData() async {
    var url =
        "https://api.darksky.net/forecast/2bb07c3bece89caf533ac9a5d23d8417/59.337239,18.062381";
    http.get(url).then((response) {
      var responseString = response.body;
      setState(() {
        _json_not_parsed = responseString;

        final jsonResponse = json.decode(responseString);
        WeatherPojo w = new WeatherPojo.fromJson(jsonResponse);
        print(w.currently.ozone);

        Navigator.pop(context);
        showDumpDialog();
      });
    });
  }

  void showDumpDialog() {
//    1
//    2
//    3
//    4
//  feature 1
//  feature 2
//  feature 3
//  feature 4
//  feature 5
//  feature 6
    showSimpleDialog("title", "message", positiveCallback: () {
      showToast("positiveCallback");
    }, negativeCallback: () {
      showToast("negativeCallback");
    });
  }
}
