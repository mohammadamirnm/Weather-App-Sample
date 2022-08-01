import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/presentation/cubits/location_cubit/location_cubit.dart';
import 'package:weather_app/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/widgets/location_row.dart';
import 'package:weather_app/presentation/widgets/retry_button.dart';

class CitySearchDelegate extends SearchDelegate<Location?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<LocationCubit>().searchLocation(query);

    return BlocBuilder<LocationCubit, LocationState>(
        builder: ((BuildContext context, LocationState state) {
      if (state is LocationLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is LocationLoaded) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) => LocationRow(
            location: state.locationResults[index],
            onTap: () {
              context.read<WeatherCubit>().fetchWeather(
                    state.locationResults[index].name,
                  );
              close(context, state.locationResults[index]);
            },
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: state.locationResults.length,
        );
      }

      if (state is LocationError) {
        return Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Center(
              child: Text(state.message),
            ),
            const SizedBox(height: 16),
            RetryButton(
              onPressed: () =>
                  context.read<LocationCubit>().searchLocation(query),
            ),
          ],
        );
      }

      return const SizedBox.shrink();
    }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
