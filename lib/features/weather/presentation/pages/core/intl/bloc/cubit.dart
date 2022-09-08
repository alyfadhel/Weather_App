import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/pages/core/intl/bloc/states.dart';
import 'package:weather_app/features/weather/presentation/pages/weather.dart';
import 'package:weather_app/model/ForecastModel.dart';
import 'package:weather_app/model/WeatherModel.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

class WeatherAppCubit extends Cubit<WeatherAppStates> {
  WeatherAppCubit() : super(WeatherAppInitialState());

  static WeatherAppCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherModel;
   getData(String initValue)async {
    emit(WeatherAppLoadingState());
   await DioHelper.getData(
      url: 'data/2.5/weather',
      query: {
        "q" : initValue,
        "appid": "611f83e7e77c4dc93085867ff3eef260",
      },
    ).then((value) {
      weatherModel = WeatherModel.fromJson(value.data!);
      debugPrint('Country: ${weatherModel!.name}');
      getForecastData();
    }).catchError((error) {
      emit(WeatherAppErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  ForecastModel? forecastModel;

   getForecastData() {
    emit(WeatherAppForecastLoadingState());
    DioHelper.getData(
      url: 'data/2.5/forecast',
      query: {
         "q": initValue,
        "appid": "611f83e7e77c4dc93085867ff3eef260",
      },
    ).then((value) {
      forecastModel = ForecastModel.fromJson(value.data);
      initValue = weatherModel!.name.toString();
      emit(WeatherAppForecastSuccessState());
    }).catchError((error) {
      emit(WeatherAppForecastErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }





}



