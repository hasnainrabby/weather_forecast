import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';

import '../model/weather_forecast_model.dart';

class Network{

  Future<WeatherForecastModel> getWeatherForecast({required String cityName}) async {
    var finalUrl = "https://api.openweathermap.org/data/2.5/weather?q="+cityName+""
        "&appid="+ForecastUtil.AppId+"&units=imperial"; // change to metric or imperial.

    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if(response.statusCode == 200){
      return WeatherForecastModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Error to get forecast");
    }

  }
}