import 'package:weather_app/model/WeatherModel.dart';

abstract class WeatherAppStates{}

class WeatherAppInitialState extends WeatherAppStates{}

class GetLatAndLongSuccessState extends WeatherAppStates{}

class GetLatAndLongErrorState extends WeatherAppStates
{
  final String error;

  GetLatAndLongErrorState(this.error);
}

class WeatherAppLoadingState extends WeatherAppStates{}

class WeatherAppSuccessState extends WeatherAppStates{}

class WeatherAppErrorState extends WeatherAppStates{
  final String error;
  WeatherAppErrorState(this.error);
}




class WeatherAppForecastLoadingState extends WeatherAppStates{}
class WeatherAppForecastSuccessState extends WeatherAppStates{}
class WeatherAppForecastErrorState extends WeatherAppStates{
  final String error;

  WeatherAppForecastErrorState(this.error);
}

