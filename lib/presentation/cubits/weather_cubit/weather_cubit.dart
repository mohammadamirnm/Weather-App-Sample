import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/config/failures.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_5_day_forecast.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  Future<void> fetchWeather(String city) async {
    emit(WeatherLoading());
    final WeatherRepository weatherRepository = WeatherRepository();

    final Get5DayForecast get5dayForecast = Get5DayForecast(weatherRepository);

    try {
      final Weather weather = await get5dayForecast.execute(city);
      emit(WeatherLoaded(weather));
    } on Failure catch (failure) {
      emit(WeatherError(failure.message));
    }
  }
}
