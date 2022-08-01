import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/widgets/city_search_delegate.dart';
import 'package:weather_app/presentation/widgets/retry_button.dart';
import 'package:weather_app/presentation/widgets/weather_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Location? _location;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                _location = await showSearch<Location?>(
                  context: context,
                  delegate: CitySearchDelegate(),
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is WeatherLoaded) {
              return WeatherView(weather: state.weather);
            }

            if (state is WeatherError) {
              Column(
                children: <Widget>[
                  Center(
                    child: Text(state.message),
                  ),
                  const SizedBox(height: 16),
                  RetryButton(
                    onPressed: () => context
                        .read<WeatherCubit>()
                        .fetchWeather(_location?.name ?? ''),
                  ),
                ],
              );
            }
            return const Center(
              child: Text(
                'Search for a city',
              ),
            );
          },
        ),
      );
}
