import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_apps/Models/Weather_model.dart';
import 'package:weather_apps/main.dart';

class WeatherInfoBody extends StatelessWidget {
   WeatherInfoBody({Key? key,required this.weatherModel}) : super(key: key);
WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: [
            getColor(weatherModel.weatherCondition),
              getColor(weatherModel.weatherCondition)[300]!,
              getColor(weatherModel.weatherCondition)[50]!
            ]
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
             weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              'updated at ${weatherModel.date.hour}: ${weatherModel.date.minute}',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "https:${ weatherModel.image!}",
                ),
                 Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.MaxTemp.round()}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Mintemp:${weatherModel.MinTemp.round()}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weatherModel.weatherCondition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
