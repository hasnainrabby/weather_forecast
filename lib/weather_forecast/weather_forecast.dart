import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_forecast/network/network.dart';

import 'model/weather_forecast_model.dart';
class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Dhaka";
  @override
  void initState() {

    super.initState();
    forecastObject = Network().getWeatherForecast(cityName: _cityName);
    forecastObject.then((main){
      print(main.coord);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast"),
      ),
    );
  }
}
