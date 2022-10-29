import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';

import '../model/weather_forecast_model.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
 var forecastList = snapshot.data?.weather;
  var city = snapshot.data?.name;
  var country = snapshot.data?.sys?.country;
  var date = snapshot.data?.dt;
  var currentTemp = snapshot.data?.main?.temp;
 var formatteddate =  DateTime.fromMillisecondsSinceEpoch(date! *1000);
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$city,$country",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blue) ,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("${ForecastUtil.getFormattedDate(formatteddate)}",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                  color: Colors.black26
              ),),
            ),
          ),
          SizedBox(height: 12,),
          Icon(Icons.wb_sunny,size: 50,),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${currentTemp!.toStringAsFixed(0)}°C",style: TextStyle(
                  fontSize: 30,fontWeight: FontWeight.w400,color: Colors.blue
                ),),
                Text("${forecastList![0].description!.toUpperCase()}",style: TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black45
                )),
              ],
            ),
          )
        ],
      ),
    ),
  );
}