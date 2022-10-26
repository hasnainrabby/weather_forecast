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
    // forecastObject.then((main){
    //   print(main.coord);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast"),
      ),
      body: ListView(
        children: [
           textFieldView(),
          Container(
            padding: EdgeInsets.only(top: 5.0),
            child:
            FutureBuilder
              (
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasData){
                return Text("All Goods.");
              }
              else{
                return Container(
                  child: Center(child: CircularProgressIndicator(),),
                );
              }
            },

            ),
          )
        ],
      ),
    );
  }

  Widget textFieldView() {
    return Container(
      padding: EdgeInsets.only(top: 5.0,right: 5.0,left: 5.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),),
        ),
        onSubmitted: (value){

        },
      ),
    );
  }
}
