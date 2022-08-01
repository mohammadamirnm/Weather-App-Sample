import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/config/failures.dart';
import 'package:weather_app/data/data_sources/weather_api_client.dart';
import 'package:weather_app/data/models/location.dart';

class LocationRepository {
  LocationRepository({WeatherApiClient? weatherApiClient})
      : _weatherApiClient = weatherApiClient ?? WeatherApiClient();

  final WeatherApiClient _weatherApiClient;

  Future<List<Location>> searchLocation(String query) async {
    final InternetConnectionChecker connectionChecker =
        InternetConnectionChecker();
    if (await connectionChecker.hasConnection) {
      final List<Location> locations =
          await _weatherApiClient.locationSearch(query);

      return locations;
    } else {
      throw ConnectionFailure();
    }
  }
}
