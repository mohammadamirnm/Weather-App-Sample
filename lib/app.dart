import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/config/theme.dart';
import 'package:weather_app/presentation/cubits/location_cubit/location_cubit.dart';
import 'package:weather_app/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/presentation/main_page.dart';

import 'config/route.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) => MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<WeatherCubit>(create: (_) => WeatherCubit()),
          BlocProvider<LocationCubit>(create: (_) => LocationCubit()),
        ],
        child: child!,
      ),
      darkTheme: ThemeClass.darkTheme,
      theme: ThemeClass.lightTheme,
      home: const MainPage(),
      onGenerateRoute: NamedRouter.generateRoute,
    );
  }
}
