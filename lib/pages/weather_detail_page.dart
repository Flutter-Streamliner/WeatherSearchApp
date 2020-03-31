import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_search_app_bloc/data/model/weather.dart';

import '../bloc/weather_bloc.dart';

class WeatherDetailPage extends StatefulWidget {
  final Weather masterWeather;

  WeatherDetailPage({@required this.masterWeather});

  @override
  _WeatherDetailPageState createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {

  @override
  void didChangeDependencies() {
    BlocProvider.of<WeatherBloc>(context)
      .add(GetDetailedWeatherEvent(cityName: widget.masterWeather.cityName));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Detail'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        alignment: Alignment.center,
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              
            } else if (state is WeatherLoading) {
              return buildLoading();
            } else if (state is WeatherLoaded) {
              return buildColumnWithData(context, state.weather);
            } else {

            }
          },
        )
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(BuildContext context, Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the Celsius temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        Text(
          // Display the Fahrenheit temperature with 1 decimal place
          "${weather.temperatureFarenheit?.toStringAsFixed(1)} °F",
          style: TextStyle(fontSize: 80),
        ),
      ],
    );
  }
}