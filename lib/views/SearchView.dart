import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/Models/Weather_model.dart';
import 'package:weather_apps/cubit/get_weather/get_weather_cubit.dart';
import 'package:weather_apps/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        onTap: (){
          FocusScope.of(context).unfocus();
        },

      child: Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blueAccent,
        // backgroundColor: Colors.amber,
        leading: IconButton(onPressed: (){
      Navigator.of(context).pop();

        },icon: Icon(Icons.arrow_back),),
      ),body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              style: TextStyle(
                fontSize: 25
              ),
              onFieldSubmitted: (value)async {
            var getWeather=    BlocProvider.of<GetweatherCubit>(context);
getWeather.getWeather(value: value);
               Navigator.of(context).pop();

              },
              // onChanged: (value){
              //
              // },
              decoration: InputDecoration(

                contentPadding: EdgeInsets.symmetric(vertical: 32,
                horizontal: 16),
                hintText: 'enter  city name',
                hintStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.black54
                ),
                labelText: 'search',
                labelStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.black54
                ),
                suffixIcon: Icon(Icons.search,size: 30,),
                border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}

