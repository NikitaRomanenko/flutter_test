import 'dart:convert';

import 'package:flutter_app/test_weather/WeatherPojo.dart';
import 'package:http/http.dart' show Client;

// Same as ApiHelper in SN
class NetworkDataProvider {
  Client _client = Client();

  Future<WeatherPojo> fetchWeather() async {
    var url =
        "https://api.darksky.net/forecast/2bb07c3bece89caf533ac9a5d23d8417/59.337239,18.062381";
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      return WeatherPojo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
