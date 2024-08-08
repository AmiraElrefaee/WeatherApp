import 'package:weather_apps/Models/Weather_model.dart';

class WeatherState{}
class WeatherInitialState extends WeatherState{}
class LoadingState extends WeatherState{
  final WeatherModel weatherModel;
  LoadingState({required this.weatherModel});
}
class FailuerStare extends WeatherState{
  final String errorMassegae;
  FailuerStare({required this.errorMassegae});
}