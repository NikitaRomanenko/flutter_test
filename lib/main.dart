import 'package:flutter/material.dart';
import 'package:flutter_app/BaseStatePage.dart';
import 'package:flutter_app/test_list/MyListPage.dart';
import 'package:flutter_app/test_weather/WeatherPage.dart';
import 'package:flutter_app/test_weather/block_pattern/WeatherScreen_Bloc.dart';

import 'Utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => MyHomePage(title: 'page home'),
        '/list': (BuildContext context) => MyListPage(title: 'page list'),
        '/weather': (BuildContext context) => WeatherPage(),
        '/weather_block': (BuildContext context) => WeatherScreen_Bloc(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseStatePage<MyHomePage> {
  int _counter = 0;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  GlobalKey<ScaffoldState> getGlobalKey() => _globalKey;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changedfl in this State, which causes it to rerun the build method below
      // so that the diflusplay can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
  _checkInternet();
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            super.goBack();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {
              showSnackBar("SnackBar test");
            },
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            GestureDetector(
                child: Text("Click here",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
                onTap: () {
                  Navigator.of(context).pushNamed('/list');
                }),
            RaisedButton(
              child: Text("WeatherScreen_Block"),
              onPressed: () {
                Navigator.of(context).pushNamed('/weather_block');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _checkInternet(){
    Utils.isNetworkAvailable.then((connected) {
      print("Utils $connected");
      if (connected) {
        showSnackBar("isNetworkAvailable = true");
      } else {
        showSnackBar("isNetworkAvailable = false");
      }
    });
  }
}
