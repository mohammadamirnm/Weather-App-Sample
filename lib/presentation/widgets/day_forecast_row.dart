import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/data/models/forecast_day.dart';
import 'package:weather_app/data/models/weather_condition.dart';

class DayForecastRow extends StatelessWidget {
  const DayForecastRow({required this.forecastDay, Key? key}) : super(key: key);

  final ForecastDay forecastDay;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 50,
          child: Row(
            children: <Widget>[
              Text(
                DateFormat('EEEE, d MMM, yyyy').format(forecastDay.date),
              ),
              const Spacer(),
              const SizedBox(width: 16),
              Text(textValues.reverse[forecastDay.day.condition.text] ?? ''),
              const SizedBox(width: 8),
              Text('${forecastDay.day.avgtempC} °C')
            ],
          ),
        ),
      );
}
