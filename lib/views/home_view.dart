import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/Models/Weather_model.dart';
import 'package:weather_apps/main.dart';
import 'package:weather_apps/views/SearchView.dart';

import '../cubit/get_weather/get_weather_cubit.dart';
import '../cubit/get_weather/get_weather_state.dart';
import '../widgets/no_weather_body.dart';
import '../widgets/weather_info_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
WeatherModel ?weatherModel;
    return Scaffold(
      appBar: AppBar(
backgroundColor: getColor(weatherModel?.weatherCondition)??Colors.orangeAccent,
        title: const Text('Weather App'),
        actions: [
         IconButton(onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context){
             return SearchView();
           }));
         }, icon:Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetweatherCubit,WeatherState>(
        builder: (context, state){
          if(state is WeatherInitialState){
            return NoWeatherBody();
          }else if (state is LoadingState) {
return WeatherInfoBody(
weatherModel: state.weatherModel,
);
          }else{
            return Center(child: Text('oops there is an error',
            style: TextStyle(
              fontSize: 40
            ),
            ));
          }

        },
      )
    );
  }
}
