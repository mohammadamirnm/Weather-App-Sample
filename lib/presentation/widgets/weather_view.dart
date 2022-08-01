import 'package:flutter/material.dart';
import 'package:weather_app/data/models/forecast_day.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/models/weather_condition.dart';
import 'package:weather_app/presentation/widgets/day_forecast_row.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({
    required this.weather,
    Key? key,
  }) : super(key: key);

  final Weather weather;

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 26),
          Text(
              '${widget.weather.location.name}, ${widget.weather.location.country}'),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(textValues.reverse[widget.weather.current.condition.text] ??
                  ''),
              const SizedBox(width: 8),
              Icon(
                weatherIcons[widget.weather.current.condition.text],
                size: 50,
              ),
            ],
          ),
          const SizedBox(height: 26),
          Text('${widget.weather.current.tempC} °C'),
          Row(
            children: <Widget>[
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    reverse = !reverse;
                  });
                },
                icon: const Icon(Icons.sort),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final List<ForecastDay> forecastDays = reverse
                    ? widget.weather.forecast.forecastDay.reversed.toList()
                    : widget.weather.forecast.forecastDay;
                return DayForecastRow(forecastDay: forecastDays[index]);
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: widget.weather.forecast.forecastDay.length,
            ),
          )
        ],
      ),
    );
  }
}
