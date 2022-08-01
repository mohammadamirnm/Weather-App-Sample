import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

class Get5DayForecast {
  const Get5DayForecast(this.repository);

  final WeatherRepository repository;

  Future<Weather> execute(String city) {
    return repository.getWeather(city);
  }
}
