

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_apps/Models/Weather_model.dart';

class WeatherService{
  final Dio dio;
  final String baseUrl='https://api.weatherapi.com/v1';
  final String api='4192a866e88649428a3223742243007';
  WeatherService(this.dio);
  Future<WeatherModel> getcurrentWeatehr({required String city})async{
 try {
   Response response = await dio.get(
      '$baseUrl/forecast.json?key=$api&q=$city&days=1'
   );
   WeatherModel weatherModel=WeatherModel.fromJson(response.data);
   return weatherModel;
 } on DioException catch (e) {
   final String ErorrMassege= e.response?.data['error']['messaage']??'oops there is error , try later' ;
throw Exception(ErorrMassege);
 } catch(e){
   log(e.toString());
   throw Exception('try later');
 }
  }


}