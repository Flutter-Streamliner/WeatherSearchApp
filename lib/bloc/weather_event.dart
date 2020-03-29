part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;

  const GetWeatherEvent({@required this.cityName});

  @override
  List<Object> get props => [cityName];

}

class GetDetailedWeatherEvent extends WeatherEvent {
  final String cityName;

  const GetDetailedWeatherEvent({@required this.cityName});

  @override
  List<Object> get props => [cityName];

}
