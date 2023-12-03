// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;

  const Weather({
    required this.theTemp,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidateWeather = json['consolidated_weather'][0];
    return Weather(
      weatherStateName: consolidateWeather['weather_state_name'],
      weatherStateAbbr: consolidateWeather['weather_state_abbr'],
      minTemp: consolidateWeather['min_temp'],
      created: consolidateWeather['created'],
      woeid: json['woeid'],
      maxTemp: consolidateWeather['max_temp'],
      lastUpdated: DateTime.now(),
      title: json['title'],
      theTemp: consolidateWeather['the_temp'],
    );
  }

  factory Weather.initial() => Weather(
        weatherStateName: '',
        created: '',
        maxTemp: 100.0,
        minTemp: 100.0,
        woeid: -1,
        weatherStateAbbr: '',
        title: '',
        lastUpdated: DateTime(1970),
        theTemp: 100.0,
      );

  @override
  List<Object> get props {
    return [
      weatherStateName,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      title,
      woeid,
      lastUpdated,
    ];
  }

  @override
  bool get stringify => true;
}
