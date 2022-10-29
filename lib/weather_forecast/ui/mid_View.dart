import 'package:flutter/material.dart';
import 'package:weather_forecast/weather_forecast/util/forecast_util.dart';

import '../model/weather_forecast_model.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
 var forecastList = snapshot.data?.weather;
  var city = snapshot.data?.name;
  var country = snapshot.data?.sys?.country;
  var date = snapshot.data?.dt;
  var currentTemp = snapshot.data?.main?.temp;
  var maxTemp = snapshot.data?.main?.tempMax;
  var humidity = snapshot.data?.main?.humidity;
  var airSpeed = snapshot.data?.wind?.speed;
 var formatteddate =  DateTime.fromMillisecondsSinceEpoch(date! *1000);
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$city,$country",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blue) ,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(ForecastUtil.getFormattedDate(formatteddate),
                style: const TextStyle(
                fontWeight: FontWeight.bold,
                  color: Colors.black26
              ),),
            ),
          ),
          const SizedBox(height: 12,),
          Icon(Icons.wb_sunny,size: 50,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${currentTemp!.toStringAsFixed(0)}°C",style: const TextStyle(
                  fontSize: 30,fontWeight: FontWeight.w400,color: Colors.blue
                ),),
                Text(forecastList![0].description!.toUpperCase(),style: const TextStyle(
                    fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black45
                )),
              ],
            ),
          ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${airSpeed!.toStringAsFixed(0)} km/h"),
                          Icon(Icons.arrow_forward,size: 20,color: Colors.brown,)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${humidity!.toStringAsFixed(0)} %"),
                          Icon(Icons.hot_tub,size: 20,color: Colors.brown,)
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${maxTemp!.toStringAsFixed(0)}°C"),
                        const Icon(Icons.arrow_circle_up,size: 20,color: Colors.brown,)
                      ],
                    )
                  ],
                ),
              ),
              ])
    ),
  );
}