import 'current_weather.dart';
import 'forecast.dart';
import 'location.dart';

class Weather {
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: Location.fromJson(json["location"]),
        current: CurrentWeather.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
      );
  Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final Location location;
  final CurrentWeather current;
  final Forecast forecast;
}
