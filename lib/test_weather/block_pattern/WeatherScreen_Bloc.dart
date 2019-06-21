//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/BaseStatePage.dart';
import 'package:flutter_app/test_weather/WeatherPojo.dart';
import 'package:flutter_app/test_weather/block_pattern/WetherBloc.dart';

class WeatherScreen_Bloc extends StatefulWidget {
  @override
  WeatherScreenState_Bloc createState() => WeatherScreenState_Bloc();
}

// ignore: camel_case_types
class WeatherScreenState_Bloc extends BaseStatePage<WeatherScreen_Bloc> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  WeatherBloc _weatherBloc;

  @override
  void initState() {
    _weatherBloc = WeatherBloc();
    super.initState();
  }

  @override
  GlobalKey<ScaffoldState> getGlobalKey() => _globalKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Text("WeatherScreen_Block"),
        ),
        body: SafeArea(
          child: StreamBuilder<WeatherState>(
              stream: _weatherBloc.weatherStream,
              initialData: WeatherInitState(),
              builder: (context, snapshot) {
                if (snapshot.data is WeatherInitState) {
                  return _buildInitState();
                }
                if (snapshot.data is WeatherLoadingState) {
                  return _buildLoadingState();
                }
                if (snapshot.data is WeatherDataState) {
                  var weatherPojo =
                      (snapshot.data as WeatherDataState).weatherPojo;
                  return _buildDataState(weatherPojo);
                }
              }),
        ));
  }

  Widget _buildInitState() {
    return Center(
      child: RaisedButton(
        child: const Text('Load weather data'),
        onPressed: () {
          _weatherBloc.loadData();
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(child: getLoadingWidget());
  }

  Widget _buildDataState(WeatherPojo weatherPojo) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildInitState(),
            Image.network("https://picsum.photos/id/9/250/250")
          ]),
    );
  }

  @override
  void dispose() {
    _weatherBloc.dispose();
    super.dispose();
  }
}
