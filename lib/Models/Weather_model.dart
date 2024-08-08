class WeatherModel{
  final String cityName;
  final DateTime date;
  final String ?image;
  final double temp;
  final double MaxTemp;
  final double MinTemp;
  final String weatherCondition;
  WeatherModel({
    this.image
    ,required this.cityName
    ,required this.date
    ,required this.MaxTemp,
    required this.MinTemp,
    required this.temp,
    required this.weatherCondition
});

  factory WeatherModel.fromJson(json){
    return WeatherModel(
        cityName:  json['location']['name'],
        date:DateTime.parse(json['current']['last_updated']),
        MaxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        MinTemp:  json['forecast']['forecastday'][0]['day']['mintemp_c'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    image:  json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}