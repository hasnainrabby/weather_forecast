import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_forecast/weather_forecast/model/weather_forecast_model.dart';

Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context){

  var  feelsLike = snapshot.data?.main?.feelsLike; ;
  var sunRise = snapshot.data?.sys?.sunrise;
  var sunSet = snapshot.data?.sys?.sunset;


  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("Current weather details".toUpperCase(),style: TextStyle(
        fontSize: 15,
          color: Colors.black26,
          fontWeight: FontWeight.bold
      ),),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 170,
          width: 250,
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 10),
          decoration:  BoxDecoration(borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(colors: [Colors.blue,Colors.white12],
                begin:Alignment.topLeft,end: Alignment.bottomRight ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("${feelsLike!.toStringAsFixed(0)}°C"),
                       Icon(FontAwesomeIcons.faceDizzy,size: 20,color: Colors.brown,),
                     ],
                     //
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Text("${getClockInUtcPlus6Hours(sunRise!)}"),
                        Icon(FontAwesomeIcons.sun,size: 20,color: Colors.brown,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Text("${getClockInUtcPlus6Hours(sunSet!)}"),
                        Icon(FontAwesomeIcons.moon,size: 20,color: Colors.brown,),
                      ],
                    ),
                  )


                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Feels Like",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),),
                  Text("Sun Rise",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45)),
                  Text("Sun Set",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45)),
                ],
              )
            ],


          ),),
      ),


    ],
  );
}
String getClockInUtcPlus6Hours(int timeSinceEpochInSec) {
  final time = DateTime.fromMillisecondsSinceEpoch(timeSinceEpochInSec * 1000,
      isUtc: true)
      .add(const Duration(hours: 6));
  return '${time.hour}:${time.second}';
}