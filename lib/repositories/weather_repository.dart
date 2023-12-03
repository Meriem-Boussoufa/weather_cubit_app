import 'package:weather_cubit_app/models/custom_error.dart';
import 'package:weather_cubit_app/services/weather_api_service.dart';

import '../models/weather.dart';

class WeatherRepository {
  final WeatherApiService weatherApiService;
  WeatherRepository({
    required this.weatherApiService,
  });

  Future<Weather> fetchWeather(String city) async {
    try {
      final int woeid = await weatherApiService.getWoeid(city);
      final Weather weather = await weatherApiService.getWeather(woeid);
      return weather;
    } catch (e) {
      throw CustomError(errMsg: e.toString());
    }
  }
}
