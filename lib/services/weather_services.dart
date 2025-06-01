import 'package:flutter_weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherServices {
  final String apikey = '59e482a94b373f2dbfe69618a5268d85'; // Ensure this API key is valid

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric'
    );

    final response = await http.get(url);

    print('Response: ${response.body}'); // Debug log

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}