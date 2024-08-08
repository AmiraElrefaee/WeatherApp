import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/views/home_view.dart';

import 'cubit/get_weather/get_weather_cubit.dart';
import 'cubit/get_weather/get_weather_state.dart';
import 'customMaterial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return GetweatherCubit();
        },
        child: Builder(
            builder: (context) {
              return BlocBuilder<GetweatherCubit, WeatherState>(
                builder: (context, state) {
                  return MaterialApp(
                      theme: ThemeData(

                        // colorSchemeSeed: Colors.amber,
                        primarySwatch: getColor(
                            BlocProvider
                                .of<GetweatherCubit>(context)
                                .weatherModel
                                ?.weatherCondition
                        ),
                      ),
                      debugShowCheckedModeBanner: false,

                      home:  HomeView()
                  );
                },
              );
            }
        )
    );
  }

}

MaterialColor getColor(String? condition) {
  if (condition == 'null') {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.amber;
    case "Partly cloudy":
      return Colors.blueGrey;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
      return Colors.grey;
    case "Patchy rain possible":
      return Colors.blue;
    case "Patchy snow possible":
      return Colors.blue;
    case "Patchy sleet possible":
      return Colors.blue;
    case "Patchy freezing drizzle possible":
      return Colors.blue;
    case "Thundery outbreaks possible":
      return Colors.yellow;
    case "Blowing snow":
      return Colors.red;
    case "Blizzard":
      return Colors.green;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.grey;
    case "Patchy light drizzle":
      return Colors.blue;
    case "Light drizzle":
      return Colors.blue;
    case "Freezing drizzle":
      return Colors.blue;
    case "Heavy freezing drizzle":
      return Colors.blue;
    case "Patchy light rain":
      return Colors.blue;
    case "Light rain":
      return Colors.blue;
    case "Moderate rain at times":
      return Colors.blue;
    case "Moderate rain":
      return Colors.blue;
    case "Heavy rain at times":
      return Colors.blue;
    case "Heavy rain":
      return Colors.blue;
    case "Light freezing rain":
      return Colors.blue;
    case "Moderate or heavy freezing rain":
      return Colors.blue;
    case "Light sleet":
      return Colors.blue;
    case "Moderate or heavy sleet":
      return Colors.blue;
    case "Patchy light snow":
      return Colors.blueGrey;
    case "Light snow":
      return Colors.blueGrey;
    case "Patchy moderate snow":
      return Colors.blueGrey;
    case "Moderate snow":
      return Colors.blueGrey;
    case "Patchy heavy snow":
      return Colors.blueGrey;
    case "Heavy snow":
      return Colors.blueGrey;
    case "Ice pellets":
      return Colors.blueGrey;
    case "Light rain shower":
      return Colors.blue;
    case "Moderate or heavy rain shower":
      return Colors.blue;
    case "Torrential rain shower":
      return Colors.blue;
    case "Light sleet showers":
      return Colors.blue;
    case "Moderate or heavy sleet showers":
      return Colors.blue;
    case "Light snow showers":
      return Colors.red;
    case "Moderate or heavy snow showers":
      return Colors.indigo;
    case "Light showers of ice pellets":
      return Colors.brown;
    default:
      return Colors.lightBlue;
  }
}