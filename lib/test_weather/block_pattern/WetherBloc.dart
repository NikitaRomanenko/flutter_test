import 'dart:async';

import 'package:flutter_app/test_weather/WeatherPojo.dart';
import 'package:flutter_app/test_weather/block_pattern/Repository.dart';

class WeatherBloc {
  final _repository = Repository();

  final _weatherStreamController = StreamController<WeatherState>();

  Stream<WeatherState> get weatherStream {
    return _weatherStreamController.stream; // getter
  }

  void loadData() {
    _weatherStreamController.sink.add(WeatherState._weatherLoading());
    _repository.fetchWeather().then((weatherResponse) {
      _weatherStreamController.sink
          .add(WeatherState._weatherData(weatherResponse));
    });
  }

  void dispose() {
    _weatherStreamController.close();
  }
}

class WeatherState {
  WeatherState();

//  factory WeatherState._weatherData(WeatherPojo weather) = WeatherDataState; // this method same as below

  factory WeatherState._weatherData(WeatherPojo weather) {
    return WeatherDataState(weather);
  }

  factory WeatherState._weatherLoading() = WeatherLoadingState;
}

class WeatherInitState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherDataState extends WeatherState {
  WeatherDataState(this.weatherPojo);

  final WeatherPojo weatherPojo;
}
