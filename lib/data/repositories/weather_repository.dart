import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/config/failures.dart';
import 'package:weather_app/data/data_sources/weather_api_client.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherRepository {
  WeatherRepository({WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  final WeatherApiClient _weatherApiClient;

  Future<Weather> getWeather(String city) async {
    final InternetConnectionChecker connectionChecker =
        InternetConnectionChecker();
    if (await connectionChecker.hasConnection) {
      final Weather weather = await _weatherApiClient.getWeather(city: city);

      return weather;
    } else {
      throw ConnectionFailure();
    }
  }
}
