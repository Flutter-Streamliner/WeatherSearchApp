import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_search_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_search_app_bloc/data/weather_repository.dart';
import 'package:weather_search_app_bloc/pages/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepository: FakeWeatherRepository()),
        child: WeatherSearchPage(),
      ),
    );
  }
}
