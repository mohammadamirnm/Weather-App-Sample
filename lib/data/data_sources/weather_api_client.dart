import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/weather.dart';

import 'weather_api_exceptions.dart';

class WeatherApiClient {
  WeatherApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const String _baseUrl = 'api.weatherapi.com';
  static const String _key = '13c5ac4e1a4d40a1a03172254222807';
  final http.Client _httpClient;

  /// Finds a [Location] with `/search.json?q={query}`.
  Future<List<Location>> locationSearch(String query) async {
    final Uri locationRequest = Uri.https(
      _baseUrl,
      '/v1/search.json',
      <String, String>{
        'q': query,
        'key': _key,
      },
    );
    final http.Response locationResponse =
        await _httpClient.get(locationRequest);

    if (locationResponse.statusCode != 200) {
      if (locationResponse.statusCode < 500) {
        throw const LocationIdRequestFailure(
          'There was an issue with the request. Please try again.',
        );
      } else {
        throw const LocationIdRequestFailure(
          'There was an issue with the server. Please try again later.',
        );
      }
    }

    final List<Location> locationResults =
        Location.locationFromJson(locationResponse.body);

    if (locationResults.isEmpty) {
      throw const LocationNotFoundFailure('Location not found.');
    }

    return locationResults;
  }

  /// Fetches [Weather] for a given [city].
  Future<Weather> getWeather({required String city, int days = 5}) async {
    final Uri weatherRequest = Uri.https(
      _baseUrl,
      '/v1/forecast.json',
      <String, String>{
        'q': city,
        'key': _key,
        'days': days.toString(),
      },
    );
    final http.Response weatherResponse = await _httpClient.get(weatherRequest);

    if (weatherResponse.statusCode != 200) {
      if (weatherResponse.statusCode < 500) {
        throw const WeatherRequestFailure(
          'There was an issue with the request. Please try again.',
        );
      } else {
        throw const WeatherRequestFailure(
          'There was an issue with the server. Please try again later.',
        );
      }
    }

    final Map<String, dynamic> bodyJson =
        jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (bodyJson.isEmpty) {
      throw const WeatherNotFoundFailure(
        'There is no weather info available for this location',
      );
    }

    final Map<String, dynamic> weatherJson = jsonDecode(weatherResponse.body);

    if (weatherJson.isEmpty) {
      throw const WeatherNotFoundFailure(
        'There is no weather info available for this location',
      );
    }

    final Weather weatherResult = Weather.fromJson(weatherJson);

    return weatherResult;
  }
}
