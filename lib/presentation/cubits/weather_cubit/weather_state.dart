part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => <Object>[];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.weather);

  final Weather weather;

  @override
  List<Object> get props => <Weather>[weather];
}

class WeatherError extends WeatherState {
  const WeatherError(this.message);

  final String message;

  @override
  List<Object> get props => <String>[message];
}
