import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_cubit_app/constants/constants.dart';
import 'package:weather_cubit_app/exceptions/weather_exception.dart';
import 'package:weather_cubit_app/services/http_handler_error.dart';

import '../models/weather.dart';

class WeatherApiService {
  final http.Client httpClient;
  WeatherApiService({
    required this.httpClient,
  });

  Future<int> getWoeid(String city) async {
    final Uri uri = Uri(
        scheme: 'https',
        host: kHost,
        path: '/api/location/search/',
        queryParameters: {
          'query': city,
        });
    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final responseBody = json.decode(response.body);
      if (responseBody.isEmpty) {
        throw WeatherException('Cannot get the woeid of $city');
      }
      if (responseBody.length > 1) {
        throw WeatherException(
            'There are multiple candidates for $city \n Please specify furthur!');
      }
      return responseBody[0]['woeid'];
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeather(int woeid) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: kHost,
      path: '/api/location/$woeid',
    );

    try {
      final http.Response response = await http.get(uri);
      if (response.statusCode != 200) {
        throw Exception(httpErrorHandler(response));
      }
      final weatherJson = json.decode(response.body);
      final Weather weather = Weather.fromJson(weatherJson);
      return weather;
    } catch (e) {
      rethrow;
    }
  }
}
