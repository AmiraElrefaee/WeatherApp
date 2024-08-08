import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/views/home_view.dart';

import 'cubit/get_weather/get_weather_cubit.dart';
import 'main.dart';

class CustomMaterial extends StatelessWidget {
  const CustomMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(

          // colorSchemeSeed: Colors.amber,
          primarySwatch:getColor(
              BlocProvider.of<GetweatherCubit>(context).weatherModel?.weatherCondition
          ),
        ),
        debugShowCheckedModeBanner: false,

        home: HomeView()
    );
  }
}
