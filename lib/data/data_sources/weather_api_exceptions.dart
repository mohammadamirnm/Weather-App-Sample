import 'package:weather_app/config/failures.dart';

/// Exception thrown when locationSearch fails.
class LocationIdRequestFailure extends Failure {
  const LocationIdRequestFailure(super.message);
}

/// Exception thrown when the provided location is not found.
class LocationNotFoundFailure extends Failure {
  const LocationNotFoundFailure(super.message);
}

/// Exception thrown when getWeather fails.
class WeatherRequestFailure extends Failure {
  const WeatherRequestFailure(super.message);
}

/// Exception thrown when weather for provided location is not found.
class WeatherNotFoundFailure extends Failure {
  const WeatherNotFoundFailure(super.message);
}
