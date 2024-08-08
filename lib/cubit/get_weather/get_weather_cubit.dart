import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_apps/Models/Weather_model.dart';
import 'package:weather_apps/cubit/get_weather/get_weather_state.dart';

import '../../services/weather_service.dart';
import '../../views/SearchView.dart';

class GetweatherCubit extends Cubit<WeatherState>{

  GetweatherCubit() : super(WeatherInitialState());

    WeatherModel? weatherModel;

  getWeather( { required String value}) async{
    try {
       weatherModel=await
      WeatherService(Dio()).getcurrentWeatehr(city: value);
      emit(LoadingState(weatherModel: weatherModel!));
    }  catch (e) {
     emit(FailuerStare(
       errorMassegae:  e.toString()
     ));
    }
  }

}