import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_search_app_bloc/data/model/weather.dart';
import 'package:weather_search_app_bloc/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository});

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    
    
    if (event is GetWeatherEvent) {
      try {
        yield WeatherLoading();
        final weather = await weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather: weather);
      } on NetworkError {
        yield WeatherError(message: "Couldn't fetch weather. Is the device online?");
      } catch (e){ 
        print('error $e');
      }
    } else if (event is GetDetailedWeatherEvent) {
      try {
        final weatherDetailed = await weatherRepository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather: weatherDetailed);
      } on NetworkError {
        yield WeatherError(message: "Couldn't fetch weather details. Is the device online?");
      }
    }
  }
}
