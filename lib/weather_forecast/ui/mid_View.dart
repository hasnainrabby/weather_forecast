import 'package:flutter/material.dart';

import '../model/weather_forecast_model.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
 // var forecastList = snapshot.data?.weather;
  var city = snapshot.data?.name;
  var country = snapshot.data?.sys?.country;
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$city,$country",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.blue) ,)
        ],
      ),
    ),
  );
}