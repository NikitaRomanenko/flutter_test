import 'package:flutter_app/test_weather/WeatherPojo.dart';
import 'package:flutter_app/test_weather/block_pattern/NetworkDataProvider.dart';

class Repository {
  final weatherProvider = NetworkDataProvider();

  Future<WeatherPojo> fetchWeather() {
    print("weather block fetchWeather()");

    return weatherProvider.fetchWeather();
  }
}
