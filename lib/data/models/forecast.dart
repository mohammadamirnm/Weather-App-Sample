import 'forecast_day.dart';

class Forecast {
  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastDay: List<ForecastDay>.from(
            json["forecastday"].map((dynamic x) => ForecastDay.fromJson(x))),
      );
  Forecast({
    required this.forecastDay,
  });

  final List<ForecastDay> forecastDay;
}
