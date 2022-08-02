import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/presentation/cubits/weather_cubit/weather_cubit.dart';

void main() {
  group('Weather Bloc Test', () {
    blocTest<WeatherCubit, WeatherState>(
      'check if Blocs are created and have the correct state',
      build: () => WeatherCubit(),
      expect: () => <WeatherState>[],
    );
    blocTest<WeatherCubit, WeatherState>(
      'check if Blocs are created and have the correct state',
      build: () => WeatherCubit(),
      act: (WeatherCubit cubit) async => await cubit.fetchWeather('London'),
      expect: () => <Object>[const WeatherLoading(), isA<WeatherLoaded>()],
    );
  });
}
